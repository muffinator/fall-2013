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
#include <libopencm3/stm32/dma.h>
#include <libopencm3/cm3/nvic.h>


#define green GPIO12
#define orange GPIO13
#define red GPIO14
#define blue GPIO15

static volatile uint32_t mydma =DMA2;
static volatile uint32_t mystream= DMA_STREAM1;
static volatile uint32_t mychannel= DMA_SxCR_CHSEL_6;

// #define mydma DMA2
// #define mystream DMA_STREAM1
// #define mychannel DMA_SxCR_CHSEL_6

static volatile uint16_t datas[16000];

static volatile uint16_t testt = 168;

static void gpio_setup(void)
{
    /*
    PD0-PD7 = ground gates
    PB6-PB8,PB9 = S0-S2,SE
    PE0 = D0
    PC13 = !CS
    */
    //------------  PC13 as input b/c PA0 is !CS
    rcc_periph_clock_enable(RCC_GPIOC);
    gpio_mode_setup(GPIOC, GPIO_MODE_INPUT, GPIO_PUPD_NONE, GPIO13);

    //------------	PB6-PB8,PB9: S0-S2,SE
    rcc_periph_clock_enable(RCC_GPIOB);
    gpio_mode_setup(GPIOB, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO_ALL);
    gpio_set_output_options(GPIOB, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, GPIO_ALL);

    //------------	D12-15: LEDs, D0-7: ground fets
    rcc_periph_clock_enable(RCC_GPIOD);
    gpio_mode_setup(GPIOD, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO_ALL);
    gpio_set_output_options(GPIOD, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, GPIO_ALL);

    rcc_periph_clock_enable(RCC_GPIOE);
    gpio_mode_setup(GPIOE, GPIO_MODE_INPUT, GPIO_PUPD_NONE, GPIO_ALL);

    rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_OTGFS);
    gpio_mode_setup(GPIOA, GPIO_MODE_AF, GPIO_PUPD_NONE, GPIO8|GPIO0);
    gpio_mode_setup(GPIOA, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO15);
    gpio_set_output_options(GPIOA, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, GPIO8 |GPIO15|GPIO0);
    gpio_set_af(GPIOA, GPIO_AF1, GPIO8);
    gpio_set_af(GPIOA, GPIO_AF2, GPIO0);

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
    //dma_set_transfer_mode(mydma, mystream, DMA_SxCR_DIR_MEM_TO_PERIPHERAL);
    //dma_set_peripheral_address(mydma, mystream, (uint32_t) &GPIOB_ODR);
    dma_set_peripheral_address(mydma, mystream, (uint32_t) &GPIOE_IDR);
    /* The array v[] is filled with the waveform data to be output */
    dma_set_memory_address(mydma, mystream, (uint32_t) datas);
    dma_set_number_of_data(mydma, mystream, 16000);
    //dma_disable_transfer_complete_interrupt(mydma, mystream);
    dma_channel_select(mydma, mystream, mychannel);
    dma_enable_direct_mode(mydma, mystream);
    dma_enable_transfer_complete_interrupt(mydma, mystream);
    dma_enable_direct_mode_error_interrupt(mydma, mystream);
    dma_enable_stream(mydma, mystream);

    // mystream=DMA_STREAM3;
    // dma_stream_reset(mydma, mystream);
    // dma_set_priority(mydma, mystream, DMA_SxCR_PL_HIGH);
    // dma_set_memory_size(mydma, mystream, DMA_SxCR_MSIZE_16BIT);
    // dma_set_peripheral_size(mydma, mystream, DMA_SxCR_PSIZE_16BIT);
    // dma_disable_peripheral_increment_mode(mydma, mystream);
    // dma_enable_memory_increment_mode(mydma, mystream);
    // dma_enable_circular_mode(mydma, mystream);
    // dma_set_transfer_mode(mydma, mystream, DMA_SxCR_DIR_MEM_TO_PERIPHERAL);
    // //	dma_set_peripheral_address(mydma, mystream, (uint32_t) datas);
    // dma_set_peripheral_address(mydma, mystream,(uint32_t) &GPIOB_ODR);
    // /* The array v[] is filled with the waveform data to be output */
    // //	dma_set_memory_address(mydma, mystream, (uint32_t) &GPIOB_ODR);
    // dma_set_memory_address(mydma, mystream, (uint32_t) datas);
    // dma_set_number_of_data(mydma, mystream, 16000);
    // //dma_disable_transfer_complete_interrupt(mydma, mystream);
    // dma_channel_select(mydma, mystream, mychannel);
    // dma_enable_direct_mode(mydma, mystream);
    // dma_enable_transfer_complete_interrupt(mydma, mystream);
    // dma_enable_direct_mode_error_interrupt(mydma, mystream);
    // dma_enable_stream(mydma, mystream);
    //
    // mystream=DMA_STREAM1;
    nvic_enable_irq(NVIC_DMA2_STREAM1_IRQ);

}

static void timer1_setup(void)
{
    rcc_periph_clock_enable(RCC_TIM1);
    //nvic_enable_irq(NVIC_TIM1_UP_TIM10_IRQ);
    //nvic_enable_irq(NVIC_TIM1_CC_IRQ);
    timer_reset(TIM1);
    timer_set_mode(TIM1, TIM_CR1_CKD_CK_INT, TIM_CR1_CMS_EDGE, TIM_CR1_DIR_UP);
    timer_set_repetition_counter(TIM1,15);
    timer_one_shot_mode(TIM1);
    timer_set_prescaler(TIM1,0);
    timer_set_period(TIM1, 8);//8
    //dma stuff
    timer_set_dma_on_compare_event(TIM1);
    timer_enable_irq(TIM1, TIM_DIER_CC1DE);
    //timer_update_on_overflow(TIM1);

    timer_slave_set_mode(TIM1, TIM_SMCR_SMS_TM);
    timer_slave_set_trigger(TIM1, TIM_SMCR_TS_ITR0);
    //timer_set_master_mode(TIM1, TIM_CR2_MMS_UPDATE);

    timer_set_oc_mode(TIM1, TIM_OC1, TIM_OCM_PWM1);
    timer_enable_oc_output(TIM1, TIM_OC1);
    timer_enable_break_main_output(TIM1);

    //timer_set_oc_fast_mode(TIM1, TIM_OC1);
    timer_set_oc_value(TIM1, TIM_OC1, 4);//4
    timer_enable_counter(TIM1);
}

/* Timer Setup */

static void timer5_setup(void)
{
	rcc_periph_clock_enable(RCC_TIM5);
	nvic_enable_irq(NVIC_TIM5_IRQ);
	timer_reset(TIM5);
	timer_set_mode(TIM5, TIM_CR1_CKD_CK_INT,TIM_CR1_CMS_EDGE,TIM_CR1_DIR_UP);
	timer_set_prescaler(TIM5, 0);
	timer_disable_preload(TIM5);
	timer_continuous_mode(TIM5);
	timer_set_period(TIM5, 90);

	timer_set_oc_mode(TIM5, TIM_OC1, TIM_OCM_PWM2);
	//timer_disable_oc_output(TIM5, TIM_OC2 | TIM_OC3 | TIM_OC4);
    timer_enable_oc_output(TIM5, TIM_OC1);
    timer_enable_break_main_output(TIM5);
    //timer_disable_oc_clear(TIM5, TIM_OC1);
    //timer_disable_oc_preload(TIM5, TIM_OC1);
	timer_set_oc_fast_mode(TIM5, TIM_OC1);
	timer_set_oc_value(TIM5, TIM_OC1, 85);
    timer_set_master_mode(TIM5, TIM_CR2_MMS_UPDATE);
	timer_enable_counter(TIM5);
}

/* Timer 3 ISR */

void tim5_isr(void)
{
    if (timer_get_flag(TIM5, TIM_SR_UIF)){
        timer_clear_flag(TIM5, TIM_SR_UIF);
        gpio_set(GPIOD, orange);
    }

    if (timer_get_flag(TIM5, TIM_SR_CC1IF)) {
        timer_clear_flag(TIM5, TIM_SR_CC1IF);
        gpio_clear(GPIOD, orange);
    }
}


void dma2_stream1_isr(void)
{
    if (dma_get_interrupt_flag(mydma, mystream, DMA_TCIF))
    {
        dma_clear_interrupt_flags(mydma, mystream, DMA_TCIF);
        gpio_toggle(GPIOD, orange);
    }
}

int main(void)
{

    rcc_clock_setup_hse_3v3(&hse_8mhz_3v3[CLOCK_3V3_168MHZ]);
    gpio_setup();

    //timer2_setup();
    //timer_enable_irq(TIM2, TIM_DIER_UIE|TIM_DIER_CC1IE);
    timer1_setup();
    timer5_setup();
    dma2_setup();

    uint32_t i;
    uint32_t x;
    for(x=0;x<16000;x++)
    {
        datas[x]=x;
    }
    while (1)
    {
        for (testt=90;testt<95;testt++)
        {
            for (i = 0; i<2000000; i++)
            {
                __asm__("nop");
            }
            //timer_disable_counter(TIM5);
            TIM1_EGR |= TIM_EGR_UG;
            timer_set_counter(TIM5,1);
            timer_set_period(TIM5, testt);
            //timer_enable_counter(TIM5);
        }
        for (testt=95;testt>90;testt--)
        {
            for (i = 0; i<2000000; i++)
            {
                __asm__("nop");
            }
            //timer_disable_counter(TIM5);
            timer_set_counter(TIM5,1);
            timer_set_period(TIM5, testt);
            //timer_enable_counter(TIM5);
        }
    }
}
