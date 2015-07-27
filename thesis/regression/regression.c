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


#define green GPIO12
#define orange GPIO13
#define red GPIO14
#define blue GPIO15


static volatile uint16_t testt = 168;

static void gpio_setup(void)
{
    /*
    PD0-PD7 = ground gates
    PB6-PB8,PB9 = S0-S2,SE
    PE0 = D0
    PC13 = !CS
    */

    //------------	D12-15: LEDs, D0-7: ground fets
    rcc_periph_clock_enable(RCC_GPIOD);
    gpio_mode_setup(GPIOD, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO_ALL);
    gpio_set_output_options(GPIOD, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, GPIO_ALL);

}


/* Timer Setup */
static void timer2_setup(void)
{
	rcc_periph_clock_enable(RCC_TIM2);
	nvic_enable_irq(NVIC_TIM2_IRQ);
	timer_reset(TIM2);
	timer_set_mode(TIM2, TIM_CR1_CKD_CK_INT,TIM_CR1_CMS_EDGE,TIM_CR1_DIR_UP);
	timer_set_prescaler(TIM2, 0);
	timer_disable_preload(TIM2);
	timer_continuous_mode(TIM2);
	timer_set_period(TIM2, 165);
	timer_set_oc_mode(TIM2, TIM_OC1, TIM_OCM_PWM2);
	timer_disable_oc_output(TIM2, TIM_OC1|TIM_OC2 | TIM_OC3 | TIM_OC4);
    //timer_enable_oc_output(TIM2, TIM_OC1);
    //timer_disable_oc_clear(TIM2, TIM_OC1);
    //timer_disable_oc_preload(TIM2, TIM_OC1);
	timer_set_oc_fast_mode(TIM2, TIM_OC1);
	timer_set_oc_value(TIM2, TIM_OC1, 105);
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
	timer_set_period(TIM5, 800);
	timer_set_oc_mode(TIM5, TIM_OC1, TIM_OCM_PWM2);
	timer_disable_oc_output(TIM2, TIM_OC1|TIM_OC2 | TIM_OC3 | TIM_OC4);
    //timer_enable_oc_output(TIM2, TIM_OC1);
    //timer_disable_oc_clear(TIM2, TIM_OC1);
    //timer_disable_oc_preload(TIM2, TIM_OC1);
	timer_set_oc_fast_mode(TIM5, TIM_OC1);
	timer_set_oc_value(TIM5, TIM_OC1, 400);
	timer_enable_counter(TIM5);
}

/* Timer 3 ISR */

void tim2_isr(void)
{
    if (timer_get_flag(TIM2, TIM_SR_UIF)){
        timer_clear_flag(TIM2, TIM_SR_UIF);
        timer_disable_irq(TIM2, TIM_DIER_UIE);
        gpio_set(GPIOD, orange);
        timer_enable_irq(TIM2, TIM_DIER_CC1IE);
    }

    if (timer_get_flag(TIM2, TIM_SR_CC1IF)) {
        timer_clear_flag(TIM2, TIM_SR_CC1IF);
        timer_disable_irq(TIM2, TIM_DIER_CC1IE);
        gpio_clear(GPIOD, orange); 
        timer_enable_irq(TIM2, TIM_DIER_UIE);
    }
}

void tim5_isr(void)
{
    if (timer_get_flag(TIM5, TIM_SR_UIF)){
        timer_clear_flag(TIM5, TIM_SR_UIF);
        gpio_set(GPIOD, green);
    }

    if (timer_get_flag(TIM5, TIM_SR_CC1IF)) {
        timer_clear_flag(TIM5, TIM_SR_CC1IF);
        gpio_clear(GPIOD, green); 
    }
}



int main(void)
{

    rcc_clock_setup_hse_3v3(&hse_8mhz_3v3[CLOCK_3V3_168MHZ]);
    gpio_setup();

    timer2_setup();
    timer_enable_irq(TIM2, TIM_DIER_UIE);
    //timer5_setup();
    //timer_enable_irq(TIM5, TIM_DIER_UIE|TIM_DIER_CC1IE);

    uint32_t i;
    while (1)
    {
        for (testt=150;testt<220;testt++)
        {
            for (i = 0; i<2000000; i++)
            {
                __asm__("nop");
            }
            timer_disable_counter(TIM2);
            timer_set_period(TIM2, testt);
            timer_enable_counter(TIM2);
        }
        for (testt=220;testt>170;testt--)
        {
            for (i = 0; i<2000000; i++)
            {
                __asm__("nop");
            }
            timer_disable_counter(TIM2);
            timer_set_period(TIM2, testt);
            timer_enable_counter(TIM2);
        }
    }
}
