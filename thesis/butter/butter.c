/*
 * This file is part of the libopencm3 project.
 *
 * Copyright (C) 2010 Gareth McMullin <gareth@blacksphere.co.nz>
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <stdlib.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/timer.h>
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/stm32/exti.h>
#include <libopencmsis/core_cm3.h>
#include <libopencm3/usb/usbd.h>
#include <libopencm3/usb/cdc.h>
#include <libopencm3/cm3/scb.h>
#include <libopencm3/stm32/dma.h>
#include <libopencm3/stm32/dac.h>
#include <libopencm3/stm32/usart.h>

#define mydma DMA2
#define mystream DMA_STREAM1
#define mychannel DMA_SxCR_CHSEL_7

static volatile char message = 'a';
static volatile uint8_t ready = 0;
static volatile uint16_t datas[8];
static usbd_device *usb_device;


static void gpio_setup(void)
{
    rcc_periph_clock_enable(RCC_GPIOD);
    rcc_periph_clock_enable(RCC_GPIOB);
    gpio_mode_setup(GPIOB, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO_ALL);
    gpio_mode_setup(GPIOD, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO12 | GPIO13);
    gpio_set(GPIOD, GPIO12);
    gpio_clear(GPIOD, GPIO13);
    gpio_set(GPIOB, ('a'<<8)|'c');
}


static void dma_setup(void)
{
    /* DAC channel 1 uses DMA controller 1 Stream 5 Channel 7. */
    /* Enable DMA1 clock and IRQ */
    rcc_periph_clock_enable(RCC_DMA2);
    nvic_enable_irq(NVIC_DMA2_STREAM1_IRQ);
    dma_stream_reset(mydma, mystream);
    dma_set_priority(mydma, mystream, DMA_SxCR_PL_LOW);
    dma_set_memory_size(mydma, mystream, DMA_SxCR_MSIZE_8BIT);
    dma_set_peripheral_size(mydma, mystream, DMA_SxCR_PSIZE_8BIT);
    dma_enable_memory_increment_mode(mydma, mystream);
    dma_enable_circular_mode(mydma, mystream);
    dma_set_transfer_mode(mydma, mystream,
                DMA_SxCR_DIR_PERIPHERAL_TO_MEM);
    /* The register to target is the DAC1 8-bit right justified data
       register */
    dma_set_peripheral_address(mydma, mystream, (uint32_t) &GPIOB_IDR);
    /* The array v[] is filled with the waveform data to be output */
    dma_set_memory_address(mydma, mystream, (uint32_t) datas);
    dma_set_number_of_data(mydma, mystream, 7);
    dma_enable_transfer_complete_interrupt(mydma, mystream);
    dma_channel_select(mydma, mystream, mychannel);
    dma_enable_transfer_complete_interrupt(mydma, mystream);
    dma_enable_direct_mode_error_interrupt(mydma, mystream);
    dma_enable_stream(mydma, mystream);

/*
    rcc_periph_clock_enable(RCC_DMA1);
    nvic_enable_irq(NVIC_DMA1_STREAM1_IRQ);
    //disable dma
    DMA1_S1CR = 0;
    DMA1_S1CR = DMA_SxCR_PL_HIGH | DMA_SxCR_MSIZE_16BIT | DMA_SxCR_PSIZE_16BIT | DMA_SxCR_MINC; 
    DMA1_S1PAR = (uint32_t *) 0x40020410;//GPIOB_IDR;
    DMA1_S1M0AR = (uint32_t *)datas;
    DMA1_S1NDTR = 8;
    DMA1_S1CR |= DMA_SxCR_CHSEL_3|DMA_SxCR_CIRC|DMA_SxCR_TCIE;
    DMA1_S1CR |= 1;
*/
}

/* Timer Setup */

static void timer2_setup(void)
{
    rcc_periph_clock_enable(RCC_TIM2);
    nvic_enable_irq(NVIC_TIM2_IRQ);
    timer_reset(TIM2);
  //  timer_set_mode(TIM2, TIM_CR1_CKD_CK_INT,TIM_CR1_CMS_EDGE,TIM_CR1_DIR_UP);
    timer_set_prescaler(TIM2, 16799);
   // timer_disable_preload(TIM2);
   // timer_continuous_mode(TIM2);
    timer_set_period(TIM2, 1000);
    timer_disable_oc_output(TIM2, TIM_OC1);
    timer_disable_oc_output(TIM2, TIM_OC2);
    timer_disable_oc_output(TIM2, TIM_OC3);
    timer_disable_oc_output(TIM2, TIM_OC4);

    timer_update_on_overflow(TIM2);
    timer_set_dma_on_update_event(TIM2);
 
    timer_disable_oc_clear(TIM2, TIM_OC1); 
    timer_disable_oc_preload(TIM2, TIM_OC1); 
    timer_set_oc_slow_mode(TIM2, TIM_OC1); 
    timer_set_oc_mode(TIM2, TIM_OC1, TIM_OCM_FROZEN);
    timer_set_oc_value(TIM2, TIM_OC1, 1000);
   // timer_disable_preload(TIM2);
    timer_enable_counter(TIM2);
}

/* Timer ISR */

void tim2_isr(void)
{
    //check to see if it's our vector
    if (timer_get_flag(TIM2, TIM_SR_CC1IF)) {
        //clear the flag
        timer_clear_flag(TIM2, TIM_SR_CC1IF);
        if (message++ > 'z') {message='a';}
       // gpio_toggle(GPIOD, GPIO12);
        gpio_toggle(GPIOD, GPIO13);
        if(ready >7){
        ready=0;
        int x=0;
        uint8_t send=0;
        for(x=0;x<8;x++){
            send |= ((datas[x]&0x8000)>>(x+8));
        }
            usbd_ep_write_packet(usb_device, 0x82, (uint8_t *)&datas, 16);
            //usbd_ep_write_packet(usb_device, 0x82, (uint8_t *)&send, 1);
            
        }
        uint16_t tmp = ((('H'<< (ready+8))&0x8000)|'c');
        gpio_port_write(GPIOB,tmp);
        //datas[ready]=gpio_port_read(GPIOB);//(('H'<< (ready+8))&0x8000)|'c';//(uint16_t)GPIOB_IDR;
        ready++;
    }
}


void dma1_stream1_isr(void)
{
    if (dma_get_interrupt_flag(mydma, mystream, DMA_TCIF)) {
        dma_clear_interrupt_flags(mydma, mystream, DMA_TCIF);
        /* Toggle PC1 just to keep aware of activity and frequency. */
        //gpio_toggle(GPIOD, GPIO12);
    }
    if (dma_get_interrupt_flag(mydma, mystream, DMA_DMEIF)) {
        dma_clear_interrupt_flags(mydma, mystream, DMA_DMEIF);
        /* Toggle PC1 just to keep aware of activity and frequency. */
        gpio_toggle(GPIOD, GPIO12);
    }
}

//USB STUFF
static const struct usb_device_descriptor dev = {
	.bLength = USB_DT_DEVICE_SIZE,
	.bDescriptorType = USB_DT_DEVICE,
	.bcdUSB = 0x0200,
	.bDeviceClass = USB_CLASS_CDC,
	.bDeviceSubClass = 0,
	.bDeviceProtocol = 0,
	.bMaxPacketSize0 = 64,
	.idVendor = 0x0483,
	.idProduct = 0x5740,
	.bcdDevice = 0x0200,
	.iManufacturer = 1,
	.iProduct = 2,
	.iSerialNumber = 3,
	.bNumConfigurations = 1,
};

/*
 * This notification endpoint isn't implemented. According to CDC spec it's
 * optional, but its absence causes a NULL pointer dereference in the
 * Linux cdc_acm driver.
 */
static const struct usb_endpoint_descriptor comm_endp[] = {{
	.bLength = USB_DT_ENDPOINT_SIZE,
	.bDescriptorType = USB_DT_ENDPOINT,
	.bEndpointAddress = 0x83,
	.bmAttributes = USB_ENDPOINT_ATTR_INTERRUPT,
	.wMaxPacketSize = 16,
	.bInterval = 255,
} };

static const struct usb_endpoint_descriptor data_endp[] = {{
	.bLength = USB_DT_ENDPOINT_SIZE,
	.bDescriptorType = USB_DT_ENDPOINT,
	.bEndpointAddress = 0x01,
	.bmAttributes = USB_ENDPOINT_ATTR_BULK,
	.wMaxPacketSize = 64,
	.bInterval = 1,
}, {
	.bLength = USB_DT_ENDPOINT_SIZE,
	.bDescriptorType = USB_DT_ENDPOINT,
	.bEndpointAddress = 0x82,
	.bmAttributes = USB_ENDPOINT_ATTR_BULK,
	.wMaxPacketSize = 64,
	.bInterval = 1,
} };

static const struct {
	struct usb_cdc_header_descriptor header;
	struct usb_cdc_call_management_descriptor call_mgmt;
	struct usb_cdc_acm_descriptor acm;
	struct usb_cdc_union_descriptor cdc_union;
} __attribute__((packed)) cdcacm_functional_descriptors = {
	.header = {
		.bFunctionLength = sizeof(struct usb_cdc_header_descriptor),
		.bDescriptorType = CS_INTERFACE,
		.bDescriptorSubtype = USB_CDC_TYPE_HEADER,
		.bcdCDC = 0x0110,
	},
	.call_mgmt = {
		.bFunctionLength =
			sizeof(struct usb_cdc_call_management_descriptor),
		.bDescriptorType = CS_INTERFACE,
		.bDescriptorSubtype = USB_CDC_TYPE_CALL_MANAGEMENT,
		.bmCapabilities = 0,
		.bDataInterface = 1,
	},
	.acm = {
		.bFunctionLength = sizeof(struct usb_cdc_acm_descriptor),
		.bDescriptorType = CS_INTERFACE,
		.bDescriptorSubtype = USB_CDC_TYPE_ACM,
		.bmCapabilities = 0,
	},
	.cdc_union = {
		.bFunctionLength = sizeof(struct usb_cdc_union_descriptor),
		.bDescriptorType = CS_INTERFACE,
		.bDescriptorSubtype = USB_CDC_TYPE_UNION,
		.bControlInterface = 0,
		.bSubordinateInterface0 = 1,
	 }
};

static const struct usb_interface_descriptor comm_iface[] = {{
	.bLength = USB_DT_INTERFACE_SIZE,
	.bDescriptorType = USB_DT_INTERFACE,
	.bInterfaceNumber = 0,
	.bAlternateSetting = 0,
	.bNumEndpoints = 1,
	.bInterfaceClass = USB_CLASS_CDC,
	.bInterfaceSubClass = USB_CDC_SUBCLASS_ACM,
	.bInterfaceProtocol = USB_CDC_PROTOCOL_AT,
	.iInterface = 0,

	.endpoint = comm_endp,

	.extra = &cdcacm_functional_descriptors,
	.extralen = sizeof(cdcacm_functional_descriptors)
} };

static const struct usb_interface_descriptor data_iface[] = {{
	.bLength = USB_DT_INTERFACE_SIZE,
	.bDescriptorType = USB_DT_INTERFACE,
	.bInterfaceNumber = 1,
	.bAlternateSetting = 0,
	.bNumEndpoints = 2,
	.bInterfaceClass = USB_CLASS_DATA,
	.bInterfaceSubClass = 0,
	.bInterfaceProtocol = 0,
	.iInterface = 0,

	.endpoint = data_endp,
} };

static const struct usb_interface ifaces[] = {{
	.num_altsetting = 1,
	.altsetting = comm_iface,
}, {
	.num_altsetting = 1,
	.altsetting = data_iface,
} };

static const struct usb_config_descriptor config = {
	.bLength = USB_DT_CONFIGURATION_SIZE,
	.bDescriptorType = USB_DT_CONFIGURATION,
	.wTotalLength = 0,
	.bNumInterfaces = 2,
	.bConfigurationValue = 1,
	.iConfiguration = 0,
	.bmAttributes = 0x80,
	.bMaxPower = 0x32,

	.interface = ifaces,
};

static const char * usb_strings[] = {
	"Black Sphere Technologies",
	"CDC-ACM Demo",
	"DEMO",
};

/* Buffer to be used for control requests. */
uint8_t usbd_control_buffer[128];

static int cdcacm_control_request(usbd_device *usbd_dev,
	struct usb_setup_data *req, uint8_t **buf, uint16_t *len,
	void (**complete)(usbd_device *usbd_dev, struct usb_setup_data *req))
{
	(void)complete;
	(void)buf;
	(void)usbd_dev;

	switch (req->bRequest) {
	case USB_CDC_REQ_SET_CONTROL_LINE_STATE: {
		/*
		 * This Linux cdc_acm driver requires this to be implemented
		 * even though it's optional in the CDC spec, and we don't
		 * advertise it in the ACM functional descriptor.
		 */
		return 1;
		}
	case USB_CDC_REQ_SET_LINE_CODING:
		if (*len < sizeof(struct usb_cdc_line_coding)) {
			return 0;
		}

		return 1;
	}
	return 0;
}

static void cdcacm_data_rx_cb(usbd_device *usbd_dev, uint8_t ep)
{
	(void)ep;

	char buf[64];
	int len = usbd_ep_read_packet(usbd_dev, 0x01, buf, 64);
    if (len) {
        while (usbd_ep_write_packet(usbd_dev, 0x82, buf, len)==0);
    }
}

static void cdcacm_data_tx_cb(usbd_device *usbd_dev, uint8_t ep)
{
	(void)ep;
    (void)usbd_dev;
    timer_disable_irq(TIM2, TIM_DIER_CC1IE); 
	//while (usbd_ep_write_packet(usbd_dev, 0x82, (uint8_t *)&message, 1) == 0);
    timer_enable_irq(TIM2, TIM_DIER_CC1IE); 
}

static void cdcacm_set_config(usbd_device *usbd_dev, uint16_t wValue)
{
	(void)wValue;

	usbd_ep_setup(usbd_dev, 0x01, USB_ENDPOINT_ATTR_BULK, 64, cdcacm_data_rx_cb);
	usbd_ep_setup(usbd_dev, 0x82, USB_ENDPOINT_ATTR_BULK, 64, cdcacm_data_tx_cb);
	usbd_ep_setup(usbd_dev, 0x83, USB_ENDPOINT_ATTR_INTERRUPT, 16, NULL);

	usbd_register_control_callback(
				usbd_dev,
				USB_REQ_TYPE_CLASS | USB_REQ_TYPE_INTERFACE,
				USB_REQ_TYPE_TYPE | USB_REQ_TYPE_RECIPIENT,
				cdcacm_control_request);
}

int main(void)
{
	//usbd_device *usbd_dev;

	rcc_clock_setup_hse_3v3(&hse_8mhz_3v3[CLOCK_3V3_168MHZ]);
    gpio_setup();
    timer2_setup();
    dma_setup();

	rcc_periph_clock_enable(RCC_GPIOA);
	rcc_periph_clock_enable(RCC_OTGFS);

	gpio_mode_setup(GPIOA, GPIO_MODE_AF, GPIO_PUPD_NONE,
			GPIO9 | GPIO11 | GPIO12);
	gpio_set_af(GPIOA, GPIO_AF10, GPIO9 | GPIO11 | GPIO12);

	usb_device = usbd_init(&otgfs_usb_driver, &dev, &config,
			usb_strings, 3,
			usbd_control_buffer, sizeof(usbd_control_buffer));

	usbd_register_set_config_callback(usb_device, cdcacm_set_config);

    
    timer_enable_irq(TIM2, TIM_DIER_CC1IE); 
	while (1) {
		usbd_poll(usb_device);
        //ready=0;
	}
}