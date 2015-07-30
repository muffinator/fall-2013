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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.	If not, see <http://www.gnu.org/licenses/>.
 */


#include <stdio.h>
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
#include "usb.c"
#include "sin.c"

#define mydma DMA2
#define mystream DMA_STREAM1
#define mychannel DMA_SxCR_CHSEL_6
#define dT 500
#define T dT<<1

#define green GPIO12
#define orange GPIO13
#define red GPIO14
#define blue GPIO15
#define cs GPIOC,GPIO13


static volatile char message = 'a';
static volatile uint8_t ready = 0;
static volatile uint16_t datas[16000];
static volatile uint16_t rearranged[1000];
static volatile uint8_t send=0;
static volatile uint8_t muxpin[8]={5,7,6,4,2,1,0,3};
static volatile uint16_t testt = 168;
static volatile int edge=1;
volatile uint16_t idx=0;
static usbd_device *usb_device;

static void gpio_setup(void)
{
    /*
    PD0-PD7 = ground gates
    PB6-PB8,PB9 = S0-S2,SE
    PE0 = D0
    PC13 = !CS
    */
    //------------	PC13: !CS
    rcc_periph_clock_enable(RCC_GPIOC);
    gpio_mode_setup(GPIOC, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO1|GPIO13);
    gpio_set_output_options(GPIOC, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, GPIO1|GPIO13);

    //------------	PB6-PB8,PB9: S0-S2,SE
	rcc_periph_clock_enable(RCC_GPIOB);
	gpio_mode_setup(GPIOB, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO_ALL);
	gpio_set_output_options(GPIOB, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, GPIO_ALL);

    //------------	GPIOE: data collection register
	rcc_periph_clock_enable(RCC_GPIOE);
	gpio_mode_setup(GPIOE, GPIO_MODE_INPUT, GPIO_PUPD_NONE, GPIO_ALL);

    //------------	D12-15: LEDs, D0-7: ground fets
    rcc_periph_clock_enable(RCC_GPIOD);
    gpio_mode_setup(GPIOD, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO_ALL);
    gpio_set_output_options(GPIOD, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, GPIO_ALL);
    gpio_set(cs);

    //------------	A8: Clock  A4: DAC
    rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_OTGFS);

    gpio_mode_setup(GPIOA, GPIO_MODE_ANALOG, GPIO_PUPD_NONE, GPIO4);

    gpio_mode_setup(GPIOA, GPIO_MODE_AF, GPIO_PUPD_NONE, GPIO11 | GPIO12);
    gpio_set_af(GPIOA, GPIO_AF10, GPIO11 | GPIO12);

    gpio_mode_setup(GPIOA, GPIO_MODE_AF, GPIO_PUPD_NONE, GPIO8);
    gpio_mode_setup(GPIOA, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO15);
    gpio_set_output_options(GPIOA, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, GPIO8 | GPIO15);
    gpio_set_af(GPIOA, GPIO_AF1, GPIO8);
}


static void dma2_setup(void)
{
    /* DAC channel 1 uses DMA controller 1 Stream 5 Channel 7. */
    /* Enable DMA1 clock and IRQ */
    rcc_periph_clock_enable(RCC_DMA2);
    dma_stream_reset(mydma, mystream);
    dma_set_priority(mydma, mystream, DMA_SxCR_PL_VERY_HIGH);
    dma_set_memory_size(mydma, mystream, DMA_SxCR_MSIZE_16BIT);
    dma_set_peripheral_size(mydma, mystream, DMA_SxCR_PSIZE_16BIT);
    dma_disable_peripheral_increment_mode(mydma, mystream);
    dma_enable_memory_increment_mode(mydma, mystream);
    dma_enable_circular_mode(mydma, mystream);
    dma_set_transfer_mode(mydma, mystream, DMA_SxCR_DIR_PERIPHERAL_TO_MEM);
    //	dma_set_peripheral_address(mydma, mystream, (uint32_t) datas);
    dma_set_peripheral_address(mydma, mystream, (uint32_t) &GPIOE_IDR);
    /* The array v[] is filled with the waveform data to be output */
    //	dma_set_memory_address(mydma, mystream, (uint32_t) &GPIOB_ODR);
    dma_set_memory_address(mydma, mystream, (uint32_t) datas);
    dma_set_number_of_data(mydma, mystream, 16000);
    //dma_disable_transfer_complete_interrupt(mydma, mystream);
    dma_channel_select(mydma, mystream, mychannel);
    dma_enable_direct_mode(mydma, mystream);
    dma_enable_transfer_complete_interrupt(mydma, mystream);
    dma_enable_direct_mode_error_interrupt(mydma, mystream);
    dma_enable_stream(mydma, mystream);
    nvic_enable_irq(NVIC_DMA2_STREAM1_IRQ);
}

static void dma1_setup(void)
{
    rcc_periph_clock_enable(RCC_DMA1);
	dma_stream_reset(DMA1, DMA_STREAM5);
	dma_set_priority(DMA1, DMA_STREAM5, DMA_SxCR_PL_HIGH);
	dma_set_memory_size(DMA1, DMA_STREAM5, DMA_SxCR_MSIZE_8BIT);
	dma_set_peripheral_size(DMA1, DMA_STREAM5, DMA_SxCR_PSIZE_8BIT);
	dma_enable_memory_increment_mode(DMA1, DMA_STREAM5);
	dma_enable_circular_mode(DMA1, DMA_STREAM5);
	dma_set_transfer_mode(DMA1, DMA_STREAM5,
				DMA_SxCR_DIR_MEM_TO_PERIPHERAL);
	/* The register to target is the DAC1 8-bit right justified data
	   register */
	dma_set_peripheral_address(DMA1, DMA_STREAM5, (uint32_t) &DAC_DHR8R1);
	/* The array v[] is filled with the waveform data to be output */
	dma_set_memory_address(DMA1, DMA_STREAM5, (uint32_t) cos25);
	dma_set_number_of_data(DMA1, DMA_STREAM5, 1000);
	dma_enable_transfer_complete_interrupt(DMA1, DMA_STREAM5);
	dma_channel_select(DMA1, DMA_STREAM5, DMA_SxCR_CHSEL_7);
	dma_enable_stream(DMA1, DMA_STREAM5);
	nvic_enable_irq(NVIC_DMA1_STREAM5_IRQ);
}

static void dac_setup(void)
{
	/* Enable the DAC clock on APB1 */
	rcc_periph_clock_enable(RCC_DAC);
	/* Setup the DAC channel 1, with timer 2 as trigger source.
	 * Assume the DAC has woken up by the time the first transfer occurs */
	dac_buffer_enable(CHANNEL_1);
	dac_trigger_enable(CHANNEL_1);
	dac_set_trigger_source(DAC_CR_TSEL1_T4);
	dac_dma_enable(CHANNEL_1);
    dac_enable(CHANNEL_1);
}

/* Timer Setup */

static void timer1_setup(void)
{
    rcc_periph_clock_enable(RCC_TIM1);
    //nvic_enable_irq(NVIC_TIM1_UP_TIM10_IRQ);
    //nvic_enable_irq(NVIC_TIM1_CC_IRQ);
    timer_reset(TIM1);
    timer_set_mode(TIM1, TIM_CR1_CKD_CK_INT, TIM_CR1_CMS_EDGE, TIM_CR1_DIR_UP);
    timer_set_prescaler(TIM1,0);
    timer_set_period(TIM1, 10);
    //dma stuff
    timer_set_dma_on_compare_event(TIM1);
    timer_enable_irq(TIM1, TIM_DIER_CC1DE);
    //timer_update_on_overflow(TIM1);

    timer_slave_set_mode(TIM1, TIM_SMCR_TS_ITR1 | TIM_SMCR_SMS_GM);
    timer_set_master_mode(TIM1, TIM_CR2_MMS_UPDATE);

    timer_set_oc_mode(TIM1, TIM_OC1, TIM_OCM_PWM2);
    timer_enable_oc_output(TIM1, TIM_OC1);
    timer_enable_break_main_output(TIM1);

    timer_set_oc_fast_mode(TIM1, TIM_OC1);
    timer_set_oc_value(TIM1, TIM_OC1, 5);
    timer_enable_counter(TIM1);
}


static void timer2_setup(void)
{
    rcc_periph_clock_enable(RCC_TIM2);
    //nvic_enable_irq(NVIC_TIM2_IRQ);
    timer_reset(TIM2);
    timer_slave_set_mode(TIM2, TIM_SMCR_TS_ITR0 | TIM_SMCR_SMS_ECM1);

    timer_set_master_mode(TIM2, TIM_CR2_MMS_COMPARE_OC1REF);
    timer_set_mode(TIM2, TIM_CR1_CKD_CK_INT,TIM_CR1_CMS_EDGE,TIM_CR1_DIR_UP);
    timer_set_prescaler(TIM2, 0);
    timer_disable_preload(TIM2);
    timer_continuous_mode(TIM2);
    timer_set_period(TIM2, 15);
    //timer_set_oc_mode(TIM2, TIM_OC2, TIM_OCM_FROZEN);
    //timer_disable_oc_output(TIM2, TIM_OC2);

    //timer_update_on_overflow(TIM2);
    //timer_set_dma_on_update_event(TIM2);
    timer_set_oc_mode(TIM2, TIM_OC1, TIM_OCM_PWM2);
    timer_disable_oc_output(TIM2, TIM_OC1);

    timer_set_oc_fast_mode(TIM2, TIM_OC1);
    timer_set_oc_value(TIM2, TIM_OC1, 15);

    //timer_disable_oc_clear(TIM2, TIM_OC1);
    //timer_disable_oc_preload(TIM2, TIM_OC1);
    //timer_set_oc_fast_mode(TIM2, TIM_OC2);
    //timer_set_oc_value(TIM2, TIM_OC2, 10);
    //timer_disable_preload(TIM2);
    timer_enable_counter(TIM2);
}

static void timer5_setup(void)
{
	rcc_periph_clock_enable(RCC_TIM5);
	nvic_enable_irq(NVIC_TIM5_IRQ);
	timer_reset(TIM5);
	timer_set_mode(TIM5, TIM_CR1_CKD_CK_INT,TIM_CR1_CMS_EDGE,TIM_CR1_DIR_UP);
	timer_set_prescaler(TIM5, 0);
	timer_disable_preload(TIM5);
	timer_continuous_mode(TIM5);
	timer_set_period(TIM5, 165);
    //timer_disable_oc_output(TIM5, TIM_OC2);
    // timer_update_on_overflow(TIM5);
	//timer_set_dma_on_update_event(TIM5);
	timer_set_oc_mode(TIM5, TIM_OC1, TIM_OCM_PWM2);
	timer_disable_oc_output(TIM5, TIM_OC2 | TIM_OC3 | TIM_OC4);
    timer_enable_oc_output(TIM5, TIM_OC1);
    timer_disable_oc_clear(TIM5, TIM_OC1);
    timer_disable_oc_preload(TIM5, TIM_OC1);
	timer_set_oc_fast_mode(TIM5, TIM_OC1);
	timer_set_oc_value(TIM5, TIM_OC1, 145);
    timer_set_master_mode(TIM5, TIM_CR2_MMS_COMPARE_OC1REF);
	//timer_disable_oc_clear(TIM5, TIM_OC1);
	//timer_disable_oc_preload(TIM5, TIM_OC1);
    // timer_set_oc_fast_mode(TIM5, TIM_OC2);
    // timer_set_oc_value(TIM5, TIM_OC2, 10);
	//timer_disable_preload(TIM5);
	timer_enable_counter(TIM5);
}

static void timer4_setup(void)
{
	rcc_periph_clock_enable(RCC_TIM4);
	nvic_enable_irq(NVIC_TIM4_IRQ);
	timer_reset(TIM4);
	timer_set_mode(TIM4, TIM_CR1_CKD_CK_INT,TIM_CR1_CMS_EDGE,TIM_CR1_DIR_UP);
	timer_set_prescaler(TIM4, 0);
	timer_disable_preload(TIM4);
	timer_continuous_mode(TIM4);
	timer_set_period(TIM4, 11);
	timer_set_master_mode(TIM4, TIM_CR2_MMS_UPDATE);
	timer_enable_counter(TIM4);
}

void tim5_isr(void)
{
    if (timer_get_flag(TIM5, TIM_SR_UIF)){
        timer_clear_flag(TIM5, TIM_SR_UIF);
        TIM2_EGR |= TIM_EGR_UG;
        gpio_clear(cs);
        TIM1_EGR |= TIM_EGR_UG;
    }

    if (timer_get_flag(TIM5, TIM_SR_CC1IF)) {
        timer_clear_flag(TIM5, TIM_SR_CC1IF);
        gpio_set(cs);
    }
}

/* DMA ISR */

void dma2_stream1_isr(void)
{
    if (dma_get_interrupt_flag(mydma, mystream, DMA_TCIF))
    {
        dma_clear_interrupt_flags(mydma, mystream, DMA_TCIF);
        /* Toggle PC1 just to keep aware of activity and frequency. */
        //gpio_toggle(GPIOD, GPIO12);
        gpio_toggle(GPIOD, red);
        timer_disable_counter(TIM5);
        //maximum packet size of 64 bytes
        int n;
        int in;
        char pin=(0<<0);
        for(n=0;n<1000;n++)
        {
            rearranged[n]=0;
            for(in=0;in<16;in++)
            {
                rearranged[n]|=(((datas[n*16+in+4]>>pin)&1)<<(9-in));
                //rearranged[n]|=(((datas[in+n*16]>>pin)&1)<<(15-in));
            }
            //rearranged[n]=rearranged[n]>>1;
        }
        for(n=0;n<63;n++)		//we want 30 packets
        {
            while (usbd_ep_write_packet(usb_device, 0x82, (const void *)&rearranged[n*16],32)==0);
            //While (usbd_ep_write_packet(usb_device, 0x82, (const void *)&(datas[n*32]), 64)==0);
        }
        //printf("hi");

        uint8_t test[6];
        test[0]=56;
        test[1]=55;
        test[2]=13;
        test[3]=10;
        test[4]='/';
        test[5]='n';
        while (usbd_ep_write_packet(usb_device, 0x82, (const void *)&test[2], 2)==0);


        //dac_disable(CHANNEL_1);
        TIM5_EGR |= TIM_EGR_UG;

    }
    if (dma_get_interrupt_flag(mydma, mystream, DMA_DMEIF)) {
        dma_clear_interrupt_flags(mydma, mystream, DMA_DMEIF);
        /* Toggle PC1 just to keep aware of activity and frequency. */
        gpio_set(GPIOD, blue);
    }
}

void dma1_stream5_isr(void)
{
    if (dma_get_interrupt_flag(DMA1, DMA_STREAM5, DMA_TCIF)) {
        dma_clear_interrupt_flags(DMA1, DMA_STREAM5, DMA_TCIF);
        /* Toggle PC1 just to keep aware of activity and frequency. */
        gpio_toggle(GPIOD, green);
    }
}


static void cdcacm_data_rx_cb(usbd_device *usbd_dev, uint8_t ep)
{
    (void)ep;

    char buf[64];
    int len = usbd_ep_read_packet(usbd_dev, 0x01, buf, 64);
    if (len) {
        //while (usbd_ep_write_packet(usbd_dev, 0x82, buf, len)==0);
        if(buf[0]=='s')
        {
            uint32_t clork = 84000000;
            uint32_t freq=(((uint32_t)buf[3]<<16)+((uint32_t)buf[2]<<8)+(uint32_t)buf[1]);
            uint32_t spd=168;
            uint16_t dpd=12;
            if(freq < 3000){
                dpd=(uint16_t)(clork/freq/250);
                spd=(uint32_t)(dpd);
                dma_disable_stream(DMA1, DMA_STREAM5);
	            dma_set_memory_address(DMA1, DMA_STREAM5, (uint32_t) cos250);
	            dma_enable_stream(DMA1, DMA_STREAM5);
	        }else if(freq<15000){
	            dpd=(uint16_t)(clork/freq/100);
                spd=(uint32_t)(dpd);
	            dma_disable_stream(DMA1, DMA_STREAM5);
	            dma_set_memory_address(DMA1, DMA_STREAM5, (uint32_t) cos100);
	            dma_enable_stream(DMA1, DMA_STREAM5);
	        }
	        else {
	            dpd=(uint16_t)(clork/freq/25);
                spd=(uint32_t)(dpd/4);
	            dma_disable_stream(DMA1, DMA_STREAM5);
	            dma_set_memory_address(DMA1, DMA_STREAM5, (uint32_t) cos25);
	            dma_enable_stream(DMA1, DMA_STREAM5);
	        }
            if (spd<168){spd=168;}  //don't sample faster than 500KHz
            if (dpd<12){dpd=12;}    //the DMA can't drive faster than this
            dac_enable(CHANNEL_1);
            timer_set_period(TIM5, (uint32_t)(spd));
            timer_set_period(TIM4, (uint16_t)(dpd));
            timer_enable_counter(TIM5);
            timer_enable_counter(TIM2);
            timer_enable_counter(TIM1);

        }
        else if(buf[0]=='g')
        {
            gpio_clear(GPIOD,0xff);
            gpio_set(GPIOD,((buf[1])&0xff));
        }
        else if(buf[0]=='m')
        {
            //gpio_clear(GPIOD, 0b111<<12); //reset LEDs
            //gpio_set(GPIOD, (buf[1]&0xf)<<12); //set LEDs
            gpio_clear(GPIOB, 0b1111<<6); //reset mux
            gpio_set(GPIOB,muxpin[(buf[1]&0xf)]<<6);
        }
    }
}

static void cdcacm_data_tx_cb(usbd_device *usbd_dev, uint8_t ep)
{
	(void)ep;
	(void)usbd_dev;
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

    rcc_clock_setup_hse_3v3(&hse_8mhz_3v3[CLOCK_3V3_168MHZ]);
    gpio_setup();

    timer2_setup();
    timer1_setup();
    timer5_setup();
    timer_enable_irq(TIM5, TIM_DIER_UIE|TIM_DIER_CC1IE);
    timer_disable_counter(TIM5);
    timer_disable_counter(TIM2);
    timer_disable_counter(TIM1);
    dma2_setup();
    dma1_setup();
    dac_setup();
    timer4_setup();
    //dac_disable(CHANNEL_1);

    usb_device = usbd_init(&otgfs_usb_driver, &dev, &config,usb_strings, 3,
        usbd_control_buffer, sizeof(usbd_control_buffer));
    usbd_register_set_config_callback(usb_device, cdcacm_set_config);
    while (1)
    {
        usbd_poll(usb_device);
    }
}
