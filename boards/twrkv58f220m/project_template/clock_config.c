/*
 * Copyright 2018 NXP.
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/***********************************************************************************************************************
 * This file was generated by the MCUXpresso Config Tools. Any manual edits made to this file
 * will be overwritten if the respective MCUXpresso Config Tools is used to update this file.
 **********************************************************************************************************************/
/*
 * How to setup clock using clock driver functions:
 *
 * 1. CLOCK_SetSimSafeDivs, to make sure core clock, bus clock, flexbus clock
 *    and flash clock are in allowed range during clock mode switch.
 *
 * 2. Call CLOCK_Osc0Init to setup OSC clock, if it is used in target mode.
 *
 * 3. Set MCG configuration, MCG includes three parts: FLL clock, PLL clock and
 *    internal reference clock(MCGIRCLK). Follow the steps to setup:
 *
 *    1). Call CLOCK_BootToXxxMode to set MCG to target mode.
 *
 *    2). If target mode is FBI/BLPI/PBI mode, the MCGIRCLK has been configured
 *        correctly. For other modes, need to call CLOCK_SetInternalRefClkConfig
 *        explicitly to setup MCGIRCLK.
 *
 *    3). Don't need to configure FLL explicitly, because if target mode is FLL
 *        mode, then FLL has been configured by the function CLOCK_BootToXxxMode,
 *        if the target mode is not FLL mode, the FLL is disabled.
 *
 *    4). If target mode is PEE/PBE/PEI/PBI mode, then the related PLL has been
 *        setup by CLOCK_BootToXxxMode. In FBE/FBI/FEE/FBE mode, the PLL could
 *        be enabled independently, call CLOCK_EnablePll0 explicitly in this case.
 *
 * 4. Call CLOCK_SetSimConfig to set the clock configuration in SIM.
 */

/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
!!GlobalInfo
product: Clocks v4.1
processor: MKV58F1M0xxx24
package_id: MKV58F1M0VLQ24
mcu_data: ksdk2_0
processor_version: 4.0.0
board: TWR-KV58F220M
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */

#include "fsl_smc.h"
#include "clock_config.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/
#define MCG_PLL_DISABLE 0U                   /*!< MCGPLLCLK disabled */
#define OSC_CAP0P 0U                         /*!< Oscillator 0pF capacitor load */
#define SIM_CLKOUT_SEL_FLEXBUS_CLK 0U        /*!< CLKOUT pin clock select: FlexBus clock */
#define SIM_ENET_1588T_CLK_SEL_CLKIN_CLK 3U  /*!< SDHC clock select: CLKIN (External bypass clock) */
#define SIM_ENET_RMII_CLK_SEL_CLKIN_CLK 1U   /*!< SDHC clock select: CLKIN (External bypass clock) */
#define SIM_OSC32KSEL_LPO_CLK 3U             /*!< OSC32KSEL select: LPO clock */
#define SIM_PLLFLLSEL_MCGFLLCLK_CLK 0U       /*!< PLLFLL select: MCGFLLCLK clock */
#define SIM_TRACE_CLK_DIV_1 0U               /*!< Trace clock divider divisor: divided by 1 */
#define SIM_TRACE_CLK_FRAC_1 0U              /*!< Trace clock divider fraction: multiplied by 1 */
#define SIM_TRACE_CLK_SEL_CORE_SYSTEM_CLK 1U /*!< Trace clock select: Core/system clock */
#define SIM_WDOG_CLK_SEL_LPO_CLK 0U          /*!< WDOG clock select: LPO clock */

/*******************************************************************************
 * Variables
 ******************************************************************************/
/* System clock frequency. */
extern uint32_t SystemCoreClock;

/*******************************************************************************
 * Code
 ******************************************************************************/
/*FUNCTION**********************************************************************
 *
 * Function Name : CLOCK_CONFIG_SetSimSafeDivs
 * Description   : This function sets the system clock dividers in SIM to safe
 * value.
 *
 *END**************************************************************************/
static void CLOCK_CONFIG_SetSimSafeDivs(void)
{
    SIM->CLKDIV1 = 0x01170000U;
}

/*FUNCTION**********************************************************************
 *
 * Function Name : CLOCK_CONFIG_FllStableDelay
 * Description   : This function is used to delay for FLL stable.
 *
 *END**************************************************************************/
static void CLOCK_CONFIG_FllStableDelay(void)
{
    uint32_t i = 30000U;
    while (i--)
    {
        __NOP();
    }
}

/*FUNCTION**********************************************************************
 *
 * Function Name : CLOCK_CONFIG_SetWdogClock
 * Description   : Set WDOG clock source.
 * Param src     : The value to set WDOG clock source.
 *
 *END**************************************************************************/
static void CLOCK_CONFIG_SetWdogClock(uint8_t src)
{
    SIM->WDOGC = ((SIM->WDOGC & ~SIM_WDOGC_WDOGCLKS_MASK) | SIM_WDOGC_WDOGCLKS(src));
}

/*FUNCTION**********************************************************************
 *
 * Function Name : CLOCK_CONFIG_EnableTraceDivFrac
 * Description   : Enable TRACE divider fraction and divisor.
 *
 *END**************************************************************************/
static void CLOCK_CONFIG_EnableTraceDivFrac()
{
    SIM->CLKDIV4 |= SIM_CLKDIV4_TRACEDIVEN_MASK;
}

/*FUNCTION**********************************************************************
 *
 * Function Name : CLOCK_CONFIG_SetRmii0Clock
 * Description   : Set RMII clock source.
 * Param src     : The value to set RMII clock source.
 *
 *END**************************************************************************/
static void CLOCK_CONFIG_SetRmii0Clock(uint32_t src)
{
    SIM->SOPT2 = ((SIM->SOPT2 & ~SIM_SOPT2_RMIISRC_MASK) | SIM_SOPT2_RMIISRC(src));
}

/*******************************************************************************
 ************************ BOARD_InitBootClocks function ************************
 ******************************************************************************/
void BOARD_InitBootClocks(void)
{
    BOARD_BootClockRUN();
}

/*******************************************************************************
 ********************** Configuration BOARD_BootClockRUN ***********************
 ******************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
!!Configuration
name: BOARD_BootClockRUN
called_from_default_init: true
outputs:
- {id: Bus_clock.outFreq, value: 83.88608 MHz}
- {id: CLKOUT.outFreq, value: 41.94304 MHz}
- {id: Core_clock.outFreq, value: 83.88608 MHz}
- {id: ENET1588TSCLK.outFreq, value: 50 MHz}
- {id: ERCLK32K.outFreq, value: 1 kHz}
- {id: Flash_clock.outFreq, value: 20.97152 MHz}
- {id: FlexBus_clock.outFreq, value: 41.94304 MHz}
- {id: LPO_clock.outFreq, value: 1 kHz}
- {id: MCGFFCLK.outFreq, value: 32.768 kHz}
- {id: MCGIRCLK.outFreq, value: 32.768 kHz}
- {id: PLLFLLCLK.outFreq, value: 83.88608 MHz}
- {id: RMIICLK.outFreq, value: 50 MHz}
- {id: System_clock.outFreq, value: 83.88608 MHz}
- {id: TRACECLKIN.outFreq, value: 83.88608 MHz}
- {id: WDOGCLK.outFreq, value: 1 kHz}
settings:
- {id: CLKOUTConfig, value: 'yes'}
- {id: ENETTimeSrcConfig, value: 'yes'}
- {id: MCG.FCRDIV.scale, value: '1'}
- {id: MCG.FLL_mul.scale, value: '2560', locked: true}
- {id: MCG.FRDIV.scale, value: '32'}
- {id: MCG.PRDIV.scale, value: '4'}
- {id: MCG.VDIV.scale, value: '32'}
- {id: MCG_C1_IRCLKEN_CFG, value: Enabled}
- {id: MCG_C2_RANGE0_CFG, value: High}
- {id: MCG_C2_RANGE0_FRDIV_CFG, value: High}
- {id: OSC_CR_ERCLKEN_CFG, value: Enabled}
- {id: OSC_CR_ERCLKEN_UNDIV_CFG, value: Enabled}
- {id: RMIISrcConfig, value: 'yes'}
- {id: SIM.OSC32KSEL.sel, value: PMC.LPOCLK}
- {id: SIM.OUTDIV3.scale, value: '2'}
- {id: SIM.OUTDIV4.scale, value: '4'}
- {id: SIM.RMIICLKSEL.sel, value: SIM.ENET_1588_CLK_EXT}
- {id: SIM.TIMESRCSEL.sel, value: SIM.ENET_1588_CLK_EXT}
- {id: TraceClkConfig, value: 'yes'}
- {id: WDOGClkConfig, value: 'yes'}
sources:
- {id: OSC.OSC.outFreq, value: 50 MHz}
- {id: SIM.ENET_1588_CLK_EXT.outFreq, value: 50 MHz, enabled: true}
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */

/*******************************************************************************
 * Variables for BOARD_BootClockRUN configuration
 ******************************************************************************/
const mcg_config_t mcgConfig_BOARD_BootClockRUN = {
    .mcgMode         = kMCG_ModeFEI,      /* FEI - FLL Engaged Internal */
    .irclkEnableMode = kMCG_IrclkEnable,  /* MCGIRCLK enabled, MCGIRCLK disabled in STOP mode */
    .ircs            = kMCG_IrcSlow,      /* Slow internal reference clock selected */
    .fcrdiv          = 0x0U,              /* Fast IRC divider: divided by 1 */
    .frdiv           = 0x0U,              /* FLL reference clock divider: divided by 32 */
    .drs             = kMCG_DrsHigh,      /* High frequency range */
    .dmx32           = kMCG_Dmx32Default, /* DCO has a default range of 25% */
    .pll0Config =
        {
            .enableMode = MCG_PLL_DISABLE, /* MCGPLLCLK disabled */
            .prdiv      = 0x3U,            /* PLL Reference divider: divided by 4 */
            .vdiv       = 0x10U,           /* VCO divider: multiplied by 32 */
        },
};
const sim_clock_config_t simConfig_BOARD_BootClockRUN = {
    .pllFllSel = SIM_PLLFLLSEL_MCGFLLCLK_CLK, /* PLLFLL select: MCGFLLCLK clock */
    .er32kSrc  = SIM_OSC32KSEL_LPO_CLK,       /* OSC32KSEL select: LPO clock */
    .clkdiv1   = 0x130000U,                   /* SIM_CLKDIV1 - OUTDIV1: /1, OUTDIV2: /1, OUTDIV3: /2, OUTDIV4: /4 */
};
const osc_config_t oscConfig_BOARD_BootClockRUN = {
    .freq        = 0U,           /* Oscillator frequency: 0Hz */
    .capLoad     = (OSC_CAP0P),  /* Oscillator capacity load: 0pF */
    .workMode    = kOSC_ModeExt, /* Use external clock */
    .oscerConfig = {
        .enableMode =
            kOSC_ErClkEnable, /* Enable external reference clock, disable external reference clock in STOP mode */
        .erclkDiv = 0,        /* Divider for OSCERCLK: divided by 1 */
    }};

/*******************************************************************************
 * Code for BOARD_BootClockRUN configuration
 ******************************************************************************/
void BOARD_BootClockRUN(void)
{
    /* Set the system clock dividers in SIM to safe value. */
    CLOCK_CONFIG_SetSimSafeDivs();
    /* Set MCG to FEI mode. */
#if FSL_CLOCK_DRIVER_VERSION >= MAKE_VERSION(2, 2, 0)
    CLOCK_BootToFeiMode(mcgConfig_BOARD_BootClockRUN.dmx32, mcgConfig_BOARD_BootClockRUN.drs,
                        CLOCK_CONFIG_FllStableDelay);
#else
    CLOCK_BootToFeiMode(mcgConfig_BOARD_BootClockRUN.drs, CLOCK_CONFIG_FllStableDelay);
#endif
    /* Configure the Internal Reference clock (MCGIRCLK). */
    CLOCK_SetInternalRefClkConfig(mcgConfig_BOARD_BootClockRUN.irclkEnableMode, mcgConfig_BOARD_BootClockRUN.ircs,
                                  mcgConfig_BOARD_BootClockRUN.fcrdiv);
    /* Set the clock configuration in SIM module. */
    CLOCK_SetSimConfig(&simConfig_BOARD_BootClockRUN);
    /* Set SystemCoreClock variable. */
    SystemCoreClock = BOARD_BOOTCLOCKRUN_CORE_CLOCK;
    /* Set enet timestamp clock source. */
    CLOCK_SetEnetTime0Clock(SIM_ENET_1588T_CLK_SEL_CLKIN_CLK);
    /* Set RMII clock source. */
    CLOCK_CONFIG_SetRmii0Clock(SIM_ENET_RMII_CLK_SEL_CLKIN_CLK);
    /* Set WDOG clock source. */
    CLOCK_CONFIG_SetWdogClock(SIM_WDOG_CLK_SEL_LPO_CLK);
    /* Set CLKOUT source. */
    CLOCK_SetClkOutClock(SIM_CLKOUT_SEL_FLEXBUS_CLK);
    /* Set debug trace clock source. */
    CLOCK_SetTraceClock(SIM_TRACE_CLK_SEL_CORE_SYSTEM_CLK, SIM_TRACE_CLK_DIV_1, SIM_TRACE_CLK_FRAC_1);
    /* Enable debug trace divider divisor and fraction. */
    CLOCK_CONFIG_EnableTraceDivFrac();
}

/*******************************************************************************
 ********************* Configuration BOARD_BootClockVLPR ***********************
 ******************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
!!Configuration
name: BOARD_BootClockVLPR
outputs:
- {id: Bus_clock.outFreq, value: 4 MHz}
- {id: Core_clock.outFreq, value: 4 MHz}
- {id: ERCLK32K.outFreq, value: 1 kHz}
- {id: Flash_clock.outFreq, value: 500 kHz}
- {id: FlexBus_clock.outFreq, value: 4 MHz}
- {id: LPO_clock.outFreq, value: 1 kHz}
- {id: MCGIRCLK.outFreq, value: 4 MHz}
- {id: System_clock.outFreq, value: 4 MHz, locked: true, accuracy: '0.001'}
- {id: WDOGCLK.outFreq, value: 1 kHz}
settings:
- {id: MCGMode, value: BLPI}
- {id: powerMode, value: VLPR}
- {id: MCG.CLKS.sel, value: MCG.IRCS}
- {id: MCG.FCRDIV.scale, value: '1'}
- {id: MCG.FRDIV.scale, value: '32'}
- {id: MCG.IRCS.sel, value: MCG.FCRDIV}
- {id: MCG.PRDIV.scale, value: '4'}
- {id: MCG.VDIV.scale, value: '32'}
- {id: MCG_C1_IRCLKEN_CFG, value: Enabled}
- {id: MCG_C2_RANGE0_CFG, value: High}
- {id: MCG_C2_RANGE0_FRDIV_CFG, value: High}
- {id: OSC_CR_ERCLKEN_CFG, value: Enabled}
- {id: OSC_CR_ERCLKEN_UNDIV_CFG, value: Enabled}
- {id: SIM.OSC32KSEL.sel, value: PMC.LPOCLK}
- {id: SIM.OUTDIV4.scale, value: '8'}
- {id: SIM.TIMESRCSEL.sel, value: OSC.OSCERCLK}
- {id: SIM.TRACECLKSEL.sel, value: MCG.MCGOUTCLK}
- {id: WDOGClkConfig, value: 'yes'}
sources:
- {id: OSC.OSC.outFreq, value: 50 MHz}
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */

/*******************************************************************************
 * Variables for BOARD_BootClockVLPR configuration
 ******************************************************************************/
const mcg_config_t mcgConfig_BOARD_BootClockVLPR = {
    .mcgMode         = kMCG_ModeBLPI,     /* BLPI - Bypassed Low Power Internal */
    .irclkEnableMode = kMCG_IrclkEnable,  /* MCGIRCLK enabled, MCGIRCLK disabled in STOP mode */
    .ircs            = kMCG_IrcFast,      /* Fast internal reference clock selected */
    .fcrdiv          = 0x0U,              /* Fast IRC divider: divided by 1 */
    .frdiv           = 0x0U,              /* FLL reference clock divider: divided by 32 */
    .drs             = kMCG_DrsLow,       /* Low frequency range */
    .dmx32           = kMCG_Dmx32Default, /* DCO has a default range of 25% */
    .pll0Config =
        {
            .enableMode = MCG_PLL_DISABLE, /* MCGPLLCLK disabled */
            .prdiv      = 0x3U,            /* PLL Reference divider: divided by 4 */
            .vdiv       = 0x10U,           /* VCO divider: multiplied by 32 */
        },
};
const sim_clock_config_t simConfig_BOARD_BootClockVLPR = {
    .pllFllSel = SIM_PLLFLLSEL_MCGFLLCLK_CLK, /* PLLFLL select: MCGFLLCLK clock */
    .er32kSrc  = SIM_OSC32KSEL_LPO_CLK,       /* OSC32KSEL select: LPO clock */
    .clkdiv1   = 0x70000U,                    /* SIM_CLKDIV1 - OUTDIV1: /1, OUTDIV2: /1, OUTDIV3: /1, OUTDIV4: /8 */
};
const osc_config_t oscConfig_BOARD_BootClockVLPR = {
    .freq        = 0U,           /* Oscillator frequency: 0Hz */
    .capLoad     = (OSC_CAP0P),  /* Oscillator capacity load: 0pF */
    .workMode    = kOSC_ModeExt, /* Use external clock */
    .oscerConfig = {
        .enableMode =
            kOSC_ErClkEnable, /* Enable external reference clock, disable external reference clock in STOP mode */
        .erclkDiv = 0,        /* Divider for OSCERCLK: divided by 1 */
    }};

/*******************************************************************************
 * Code for BOARD_BootClockVLPR configuration
 ******************************************************************************/
void BOARD_BootClockVLPR(void)
{
    /* Set the system clock dividers in SIM to safe value. */
    CLOCK_CONFIG_SetSimSafeDivs();
    /* Set MCG to BLPI mode. */
    CLOCK_BootToBlpiMode(mcgConfig_BOARD_BootClockVLPR.fcrdiv, mcgConfig_BOARD_BootClockVLPR.ircs,
                         mcgConfig_BOARD_BootClockVLPR.irclkEnableMode);
    /* Set the clock configuration in SIM module. */
    CLOCK_SetSimConfig(&simConfig_BOARD_BootClockVLPR);
    /* Set VLPR power mode. */
    SMC_SetPowerModeProtection(SMC, kSMC_AllowPowerModeAll);
#if (defined(FSL_FEATURE_SMC_HAS_LPWUI) && FSL_FEATURE_SMC_HAS_LPWUI)
    SMC_SetPowerModeVlpr(SMC, false);
#else
    SMC_SetPowerModeVlpr(SMC);
#endif
    while (SMC_GetPowerModeState(SMC) != kSMC_PowerStateVlpr)
    {
    }
    /* Set SystemCoreClock variable. */
    SystemCoreClock = BOARD_BOOTCLOCKVLPR_CORE_CLOCK;
    /* Set WDOG clock source. */
    CLOCK_CONFIG_SetWdogClock(SIM_WDOG_CLK_SEL_LPO_CLK);
}