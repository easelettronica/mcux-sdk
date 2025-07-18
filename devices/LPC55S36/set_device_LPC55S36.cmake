include_guard(GLOBAL)


if (CONFIG_USE_middleware_baremetal)
# Add set(CONFIG_USE_middleware_baremetal true) in config.cmake to use this component

message("middleware_baremetal component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSDK_OS_BAREMETAL
  )

endif()


endif()


if (CONFIG_USE_utilities_misc_utilities)
# Add set(CONFIG_USE_utilities_misc_utilities true) in config.cmake to use this component

message("utilities_misc_utilities component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_TOOLCHAIN STREQUAL armgcc)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/../../utilities/misc_utilities/fsl_sbrk.c
      ${CMAKE_CURRENT_LIST_DIR}/../../utilities/misc_utilities/fsl_syscall_stub.c
  )
endif()

if((CONFIG_TOOLCHAIN STREQUAL armgcc OR CONFIG_TOOLCHAIN STREQUAL mcux) AND CONFIG_CORE STREQUAL cm33)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/../../utilities/misc_utilities/fsl_memcpy.S
  )
endif()


endif()


if (CONFIG_USE_utilities_unity)
# Add set(CONFIG_USE_utilities_unity true) in config.cmake to use this component

message("utilities_unity component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_TOOLCHAIN STREQUAL mcux)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/../../utilities/unity/linkscripts/main_text.ldt
  )
endif()

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/unity/unity.c
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/unity/gcov_support.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/unity/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  if(CONFIG_TOOLCHAIN STREQUAL mcux)
    target_compile_options(${MCUX_SDK_PROJECT_NAME} PUBLIC
    )
  endif()

endif()


endif()


if (CONFIG_USE_driver_rtt_template)
# Add set(CONFIG_USE_driver_rtt_template true) in config.cmake to use this component

message("driver_rtt_template component is included from ${CMAKE_CURRENT_LIST_FILE}.")

add_config_file(${CMAKE_CURRENT_LIST_DIR}/../../components/rtt/template/SEGGER_RTT_Conf.h ${CMAKE_CURRENT_LIST_DIR}/../../components/rtt/template driver_rtt_template.LPC55S36)


endif()


if (CONFIG_USE_driver_nand_flash-common)
# Add set(CONFIG_USE_driver_nand_flash-common true) in config.cmake to use this component

message("driver_nand_flash-common component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/flash/nand/.
)


endif()


if (CONFIG_USE_driver_nor_flash-common)
# Add set(CONFIG_USE_driver_nor_flash-common true) in config.cmake to use this component

message("driver_nor_flash-common component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/flash/nor/.
)


endif()


if (CONFIG_USE_driver_icm42688p)
# Add set(CONFIG_USE_driver_icm42688p true) in config.cmake to use this component

message("driver_icm42688p component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/icm42688p/fsl_icm42688p.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/icm42688p/.
)


endif()


if (CONFIG_USE_component_mflash_common)
# Add set(CONFIG_USE_component_mflash_common true) in config.cmake to use this component

message("component_mflash_common component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/flash/mflash/.
)


endif()


if (CONFIG_USE_driver_mx25r_flash)
# Add set(CONFIG_USE_driver_mx25r_flash true) in config.cmake to use this component

message("driver_mx25r_flash component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/mx25r_flash/mx25r_flash.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/mx25r_flash/.
)


endif()


if (CONFIG_USE_driver_pf1550)
# Add set(CONFIG_USE_driver_pf1550 true) in config.cmake to use this component

message("driver_pf1550 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/pf1550/fsl_pf1550.c
  ${CMAKE_CURRENT_LIST_DIR}/../../components/pf1550/fsl_pf1550_charger.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/pf1550/.
)


endif()


if (CONFIG_USE_driver_pf3000)
# Add set(CONFIG_USE_driver_pf3000 true) in config.cmake to use this component

message("driver_pf3000 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/pf3000/fsl_pf3000.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/pf3000/.
)


endif()


if (CONFIG_USE_DEVICES_Project_Template_LPC55S36)
# Add set(CONFIG_USE_DEVICES_Project_Template_LPC55S36 true) in config.cmake to use this component

message("DEVICES_Project_Template_LPC55S36 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_component_usart_adapter AND (CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_device_LPC55S36_startup AND CONFIG_USE_driver_clock AND CONFIG_USE_driver_common AND CONFIG_USE_driver_flexcomm_i2c AND CONFIG_USE_driver_flexcomm_spi AND CONFIG_USE_driver_flexcomm_usart AND CONFIG_USE_driver_lpc_gpio AND CONFIG_USE_driver_lpc_iocon AND CONFIG_USE_driver_power AND CONFIG_USE_driver_reset AND ((CONFIG_USE_component_serial_manager AND CONFIG_USE_utility_assert AND CONFIG_USE_utility_debug_console) OR (CONFIG_USE_utility_assert_lite AND CONFIG_USE_utility_debug_console_lite)))

add_config_file(${CMAKE_CURRENT_LIST_DIR}/project_template/board.h "" DEVICES_Project_Template_LPC55S36.LPC55S36)
add_config_file(${CMAKE_CURRENT_LIST_DIR}/project_template/board.c "" DEVICES_Project_Template_LPC55S36.LPC55S36)
add_config_file(${CMAKE_CURRENT_LIST_DIR}/project_template/clock_config.h "" DEVICES_Project_Template_LPC55S36.LPC55S36)
add_config_file(${CMAKE_CURRENT_LIST_DIR}/project_template/clock_config.c "" DEVICES_Project_Template_LPC55S36.LPC55S36)
add_config_file(${CMAKE_CURRENT_LIST_DIR}/project_template/pin_mux.h "" DEVICES_Project_Template_LPC55S36.LPC55S36)
add_config_file(${CMAKE_CURRENT_LIST_DIR}/project_template/pin_mux.c "" DEVICES_Project_Template_LPC55S36.LPC55S36)
add_config_file(${CMAKE_CURRENT_LIST_DIR}/project_template/peripherals.h "" DEVICES_Project_Template_LPC55S36.LPC55S36)
add_config_file(${CMAKE_CURRENT_LIST_DIR}/project_template/peripherals.c "" DEVICES_Project_Template_LPC55S36.LPC55S36)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/project_template/.
)

else()

message(SEND_ERROR "DEVICES_Project_Template_LPC55S36.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_device_LPC55S36_startup)
# Add set(CONFIG_USE_device_LPC55S36_startup true) in config.cmake to use this component

message("device_LPC55S36_startup component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_device_LPC55S36_system)

if(CONFIG_TOOLCHAIN STREQUAL armgcc)
  add_config_file(${CMAKE_CURRENT_LIST_DIR}/./gcc/startup_LPC55S36.S "" device_LPC55S36_startup.LPC55S36)
endif()

if(CONFIG_TOOLCHAIN STREQUAL mcux)
  add_config_file(${CMAKE_CURRENT_LIST_DIR}/./mcuxpresso/startup_lpc55s36.c "" device_LPC55S36_startup.LPC55S36)
  add_config_file(${CMAKE_CURRENT_LIST_DIR}/./mcuxpresso/startup_lpc55s36.cpp "" device_LPC55S36_startup.LPC55S36)
endif()

else()

message(SEND_ERROR "device_LPC55S36_startup.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_device_LPC55S36_CMSIS)
# Add set(CONFIG_USE_device_LPC55S36_CMSIS true) in config.cmake to use this component

message("device_LPC55S36_CMSIS component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_CMSIS_Include_core_cm AND (CONFIG_DEVICE_ID STREQUAL LPC55S36))

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./.
)

else()

message(SEND_ERROR "device_LPC55S36_CMSIS.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_clock)
# Add set(CONFIG_USE_driver_clock true) in config.cmake to use this component

message("driver_clock component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_power AND CONFIG_USE_driver_common AND (CONFIG_DEVICE_ID STREQUAL LPC55S36))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/drivers/fsl_clock.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/drivers/.
)

else()

message(SEND_ERROR "driver_clock.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_RTE_Device)
# Add set(CONFIG_USE_RTE_Device true) in config.cmake to use this component

message("RTE_Device component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_lpc_dma)

add_config_file(${CMAKE_CURRENT_LIST_DIR}/template/RTE_Device.h "" RTE_Device.LPC55S36)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/template/.
)

else()

message(SEND_ERROR "RTE_Device.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_serial_manager_uart)
# Add set(CONFIG_USE_component_serial_manager_uart true) in config.cmake to use this component

message("component_serial_manager_uart component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_component_usart_adapter AND CONFIG_USE_component_serial_manager AND (CONFIG_USE_driver_flexcomm_usart))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/serial_manager/fsl_component_serial_port_uart.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/serial_manager/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSERIAL_PORT_TYPE_UART=1
  )

endif()

else()

message(SEND_ERROR "component_serial_manager_uart.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_utility_debug_console_lite)
# Add set(CONFIG_USE_utility_debug_console_lite true) in config.cmake to use this component

message("utility_debug_console_lite component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_component_usart_adapter AND (CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common AND CONFIG_USE_utility_str)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/debug_console_lite/fsl_debug_console.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/debug_console_lite
)

else()

message(SEND_ERROR "utility_debug_console_lite.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_prince)
# Add set(CONFIG_USE_driver_prince true) in config.cmake to use this component

message("driver_prince component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_component_els_pkc AND CONFIG_USE_driver_mem_interface AND (CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/prince/fsl_prince.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/prince/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DFFR_INCLUDE="fsl_flash_ffr.h"
  )

endif()

else()

message(SEND_ERROR "driver_prince.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_dmic_dma)
# Add set(CONFIG_USE_driver_dmic_dma true) in config.cmake to use this component

message("driver_dmic_dma component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_lpc_dma AND CONFIG_USE_driver_dmic)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/dmic/fsl_dmic_dma.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/dmic/.
)

else()

message(SEND_ERROR "driver_dmic_dma.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_flexspi_dma)
# Add set(CONFIG_USE_driver_flexspi_dma true) in config.cmake to use this component

message("driver_flexspi_dma component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_lpc_dma AND CONFIG_USE_driver_flexspi)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexspi/fsl_flexspi_dma.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexspi/.
)

else()

message(SEND_ERROR "driver_flexspi_dma.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_flexcomm_i2c_dma)
# Add set(CONFIG_USE_driver_flexcomm_i2c_dma true) in config.cmake to use this component

message("driver_flexcomm_i2c_dma component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_lpc_dma AND CONFIG_USE_driver_flexcomm AND CONFIG_USE_driver_common AND CONFIG_USE_driver_flexcomm_i2c)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/i2c/fsl_i2c_dma.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/i2c/.
)

else()

message(SEND_ERROR "driver_flexcomm_i2c_dma.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_flexcomm_i2s_dma)
# Add set(CONFIG_USE_driver_flexcomm_i2s_dma true) in config.cmake to use this component

message("driver_flexcomm_i2s_dma component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_lpc_dma AND CONFIG_USE_driver_flexcomm_i2s)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/i2s/fsl_i2s_dma.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/i2s/.
)

else()

message(SEND_ERROR "driver_flexcomm_i2s_dma.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_flexcomm_spi_dma)
# Add set(CONFIG_USE_driver_flexcomm_spi_dma true) in config.cmake to use this component

message("driver_flexcomm_spi_dma component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_lpc_dma AND CONFIG_USE_driver_flexcomm AND CONFIG_USE_driver_flexcomm_spi)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/spi/fsl_spi_dma.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/spi/.
)

else()

message(SEND_ERROR "driver_flexcomm_spi_dma.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_flexcomm_usart_dma)
# Add set(CONFIG_USE_driver_flexcomm_usart_dma true) in config.cmake to use this component

message("driver_flexcomm_usart_dma component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_lpc_dma AND CONFIG_USE_driver_flexcomm AND CONFIG_USE_driver_flexcomm_usart)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/usart/fsl_usart_dma.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/usart/.
)

else()

message(SEND_ERROR "driver_flexcomm_usart_dma.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_utility_notifier)
# Add set(CONFIG_USE_utility_notifier true) in config.cmake to use this component

message("utility_notifier component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/notifier/fsl_notifier.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/notifier/.
)

else()

message(SEND_ERROR "utility_notifier.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_inputmux_connections)
# Add set(CONFIG_USE_driver_inputmux_connections true) in config.cmake to use this component

message("driver_inputmux_connections component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND (CONFIG_DEVICE_ID STREQUAL LPC55S36))

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/drivers/.
)

else()

message(SEND_ERROR "driver_inputmux_connections.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_fro_calib)
# Add set(CONFIG_USE_driver_fro_calib true) in config.cmake to use this component

message("driver_fro_calib component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./drivers
)

if(CONFIG_TOOLCHAIN STREQUAL mcux)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./mcuxpresso/libfro_calib_hardabi.a
      ${CMAKE_CURRENT_LIST_DIR}/./mcuxpresso/libfro_calib_softabi.a
      -Wl,--end-group
  )
endif()

if(CONFIG_TOOLCHAIN STREQUAL armgcc)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./gcc/libfro_calib_hardabi.a
      ${CMAKE_CURRENT_LIST_DIR}/./gcc/libfro_calib_softabi.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "driver_fro_calib.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_common)
# Add set(CONFIG_USE_driver_common true) in config.cmake to use this component

message("driver_common component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_reset AND CONFIG_USE_driver_clock AND CONFIG_USE_device_LPC55S36_CMSIS)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/common/fsl_common.c
)

if(CONFIG_CORE STREQUAL cm33)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/../../drivers/common/fsl_common_arm.c
  )
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/common/.
)

else()

message(SEND_ERROR "driver_common.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_device_LPC55S36_system)
# Add set(CONFIG_USE_device_LPC55S36_system true) in config.cmake to use this component

message("device_LPC55S36_system component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_device_LPC55S36_CMSIS)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./system_LPC55S36.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./.
)

else()

message(SEND_ERROR "device_LPC55S36_system.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_utility_assert)
# Add set(CONFIG_USE_utility_assert true) in config.cmake to use this component

message("utility_assert component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_utility_debug_console AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/assert/fsl_assert.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/assert/.
)

else()

message(SEND_ERROR "utility_assert.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_utility_assert_lite)
# Add set(CONFIG_USE_utility_assert_lite true) in config.cmake to use this component

message("utility_assert_lite component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_utility_debug_console_lite AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/assert/fsl_assert.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/assert/.
)

else()

message(SEND_ERROR "utility_assert_lite.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_utility_str)
# Add set(CONFIG_USE_utility_str true) in config.cmake to use this component

message("utility_str component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/str/fsl_str.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/str
)

else()

message(SEND_ERROR "utility_str.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_utility_debug_console)
# Add set(CONFIG_USE_utility_debug_console true) in config.cmake to use this component

message("utility_debug_console component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_component_serial_manager AND CONFIG_USE_driver_common AND CONFIG_USE_utility_str)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/debug_console/fsl_debug_console.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/debug_console
)

else()

message(SEND_ERROR "utility_debug_console.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_rtt)
# Add set(CONFIG_USE_driver_rtt true) in config.cmake to use this component

message("driver_rtt component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_rtt_template)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/rtt/RTT/SEGGER_RTT.c
  ${CMAKE_CURRENT_LIST_DIR}/../../components/rtt/RTT/SEGGER_RTT_printf.c
)

if((CONFIG_TOOLCHAIN STREQUAL armgcc OR CONFIG_TOOLCHAIN STREQUAL mcux))
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/../../components/rtt/Syscalls/SEGGER_RTT_Syscalls_GCC.c
  )
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/rtt/RTT
)

else()

message(SEND_ERROR "driver_rtt.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_cmsis_flexcomm_i2c)
# Add set(CONFIG_USE_driver_cmsis_flexcomm_i2c true) in config.cmake to use this component

message("driver_cmsis_flexcomm_i2c component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_flexcomm_i2c_dma AND CONFIG_USE_CMSIS_Driver_Include_I2C AND CONFIG_USE_RTE_Device)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../cmsis_drivers/flexcomm/fsl_i2c_cmsis.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../cmsis_drivers/flexcomm/.
)

else()

message(SEND_ERROR "driver_cmsis_flexcomm_i2c.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_cmsis_flexcomm_spi)
# Add set(CONFIG_USE_driver_cmsis_flexcomm_spi true) in config.cmake to use this component

message("driver_cmsis_flexcomm_spi component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_flexcomm_spi_dma AND CONFIG_USE_CMSIS_Driver_Include_SPI AND CONFIG_USE_RTE_Device)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../cmsis_drivers/flexcomm/fsl_spi_cmsis.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../cmsis_drivers/flexcomm/.
)

else()

message(SEND_ERROR "driver_cmsis_flexcomm_spi.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_cmsis_flexcomm_usart)
# Add set(CONFIG_USE_driver_cmsis_flexcomm_usart true) in config.cmake to use this component

message("driver_cmsis_flexcomm_usart component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_flexcomm_usart_dma AND CONFIG_USE_CMSIS_Driver_Include_USART AND CONFIG_USE_RTE_Device)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../cmsis_drivers/flexcomm/fsl_usart_cmsis.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../cmsis_drivers/flexcomm/.
)

else()

message(SEND_ERROR "driver_cmsis_flexcomm_usart.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_audio_flexcomm_i2s_dma_adapter)
# Add set(CONFIG_USE_component_audio_flexcomm_i2s_dma_adapter true) in config.cmake to use this component

message("component_audio_flexcomm_i2s_dma_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_driver_flexcomm_i2s_dma)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/audio/fsl_adapter_flexcomm_i2s.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/audio/.
)

else()

message(SEND_ERROR "component_audio_flexcomm_i2s_dma_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_button)
# Add set(CONFIG_USE_component_button true) in config.cmake to use this component

message("component_button component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_timer_manager AND (CONFIG_USE_component_lpc_gpio_adapter))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/button/fsl_component_button.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/button/.
)

else()

message(SEND_ERROR "component_button.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_codec)
# Add set(CONFIG_USE_driver_codec true) in config.cmake to use this component

message("driver_codec component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND (CONFIG_USE_component_wm8904_adapter OR CONFIG_USE_component_wm8960_adapter OR CONFIG_USE_component_sgtl_adapter OR CONFIG_USE_component_da7212_adapter OR CONFIG_USE_component_cs42888_adapter OR CONFIG_USE_component_codec_adapters))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/fsl_codec_common.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSDK_I2C_BASED_COMPONENT_USED=1
  )

endif()

else()

message(SEND_ERROR "driver_codec.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_codec_adapters)
# Add set(CONFIG_USE_component_codec_adapters true) in config.cmake to use this component

message("component_codec_adapters component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_USE_driver_codec AND CONFIG_USE_component_wm8904_adapter) OR (CONFIG_USE_driver_codec AND CONFIG_USE_component_wm8960_adapter) OR (CONFIG_USE_driver_codec AND CONFIG_USE_component_sgtl_adapter) OR (CONFIG_USE_driver_codec AND CONFIG_USE_component_da7212_adapter) OR (CONFIG_USE_driver_codec AND CONFIG_USE_component_cs42888_adapter))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port/fsl_codec_adapter.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DCODEC_MULTI_ADAPTERS=1
  )

endif()

else()

message(SEND_ERROR "component_codec_adapters.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_wm8904_adapter)
# Add set(CONFIG_USE_component_wm8904_adapter true) in config.cmake to use this component

message("component_wm8904_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_wm8904 AND CONFIG_USE_driver_codec)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port/wm8904/fsl_codec_wm8904_adapter.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port/wm8904
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port
)

else()

message(SEND_ERROR "component_wm8904_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_wm8960_adapter)
# Add set(CONFIG_USE_component_wm8960_adapter true) in config.cmake to use this component

message("component_wm8960_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_wm8960 AND CONFIG_USE_driver_codec)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port/wm8960/fsl_codec_wm8960_adapter.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port/wm8960
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port
)

else()

message(SEND_ERROR "component_wm8960_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_cs42888_adapter)
# Add set(CONFIG_USE_component_cs42888_adapter true) in config.cmake to use this component

message("component_cs42888_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_cs42888 AND CONFIG_USE_driver_codec)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port/cs42888/fsl_codec_cs42888_adapter.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port/cs42888
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port
)

else()

message(SEND_ERROR "component_cs42888_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_sgtl_adapter)
# Add set(CONFIG_USE_component_sgtl_adapter true) in config.cmake to use this component

message("component_sgtl_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_sgtl5000 AND CONFIG_USE_driver_codec)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port/sgtl5000/fsl_codec_sgtl_adapter.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port/sgtl5000
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port
)

else()

message(SEND_ERROR "component_sgtl_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_da7212_adapter)
# Add set(CONFIG_USE_component_da7212_adapter true) in config.cmake to use this component

message("component_da7212_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_dialog7212 AND CONFIG_USE_driver_codec)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port/da7212/fsl_codec_da7212_adapter.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port/da7212
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/port
)

else()

message(SEND_ERROR "component_da7212_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_codec_i2c)
# Add set(CONFIG_USE_component_codec_i2c true) in config.cmake to use this component

message("component_codec_i2c component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND (CONFIG_USE_component_flexcomm_i2c_adapter OR CONFIG_USE_component_i3c_adapter))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/i2c/fsl_codec_i2c.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/i2c/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSDK_I2C_BASED_COMPONENT_USED=1
  )

endif()

else()

message(SEND_ERROR "component_codec_i2c.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_crc_adapter)
# Add set(CONFIG_USE_component_crc_adapter true) in config.cmake to use this component

message("component_crc_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_driver_crc)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/crc/fsl_adapter_crc.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/crc/.
)

else()

message(SEND_ERROR "component_crc_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_software_crc_adapter)
# Add set(CONFIG_USE_component_software_crc_adapter true) in config.cmake to use this component

message("component_software_crc_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/crc/fsl_adapter_software_crc.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/crc/.
)

else()

message(SEND_ERROR "component_software_crc_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_cs42888)
# Add set(CONFIG_USE_driver_cs42888 true) in config.cmake to use this component

message("driver_cs42888 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_codec_i2c)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/cs42888/fsl_cs42888.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/cs42888/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSDK_I2C_BASED_COMPONENT_USED=1
    -DCODEC_CS42888_ENABLE
  )

endif()

else()

message(SEND_ERROR "driver_cs42888.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_dialog7212)
# Add set(CONFIG_USE_driver_dialog7212 true) in config.cmake to use this component

message("driver_dialog7212 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_codec_i2c)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/da7212/fsl_dialog7212.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/da7212/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSDK_I2C_BASED_COMPONENT_USED=1
    -DBOARD_USE_CODEC=1
    -DCODEC_DA7212_ENABLE
  )

endif()

else()

message(SEND_ERROR "driver_dialog7212.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_nand_flash-controller-flexspi)
# Add set(CONFIG_USE_driver_nand_flash-controller-flexspi true) in config.cmake to use this component

message("driver_nand_flash-controller-flexspi component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_nand_flash-common AND CONFIG_USE_driver_flexspi)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/flash/nand/flexspi/fsl_flexspi_nand_flash.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/flash/nand/flexspi/.
)

else()

message(SEND_ERROR "driver_nand_flash-controller-flexspi.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_nor_flash-controller-flexspi)
# Add set(CONFIG_USE_driver_nor_flash-controller-flexspi true) in config.cmake to use this component

message("driver_nor_flash-controller-flexspi component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_nor_flash-common AND CONFIG_USE_driver_flexspi)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/flash/nor/flexspi/fsl_flexspi_nor_flash.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/flash/nor/flexspi/.
)

else()

message(SEND_ERROR "driver_nor_flash-controller-flexspi.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_ft5406)
# Add set(CONFIG_USE_driver_ft5406 true) in config.cmake to use this component

message("driver_ft5406 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/ft5406/fsl_ft5406.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/ft5406/.
)

else()

message(SEND_ERROR "driver_ft5406.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_ft6x06)
# Add set(CONFIG_USE_driver_ft6x06 true) in config.cmake to use this component

message("driver_ft6x06 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_CMSIS_Driver_Include_I2C)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/ft6x06/fsl_ft6x06.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/ft6x06/.
)

else()

message(SEND_ERROR "driver_ft6x06.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_fxos8700cq)
# Add set(CONFIG_USE_driver_fxos8700cq true) in config.cmake to use this component

message("driver_fxos8700cq component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/fxos8700cq/fsl_fxos.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/fxos8700cq/.
)

else()

message(SEND_ERROR "driver_fxos8700cq.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_lpc_gpio_adapter)
# Add set(CONFIG_USE_component_lpc_gpio_adapter true) in config.cmake to use this component

message("component_lpc_gpio_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_lpc_gpio AND CONFIG_USE_driver_inputmux AND CONFIG_USE_driver_pint)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/gpio/fsl_adapter_lpc_gpio.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/gpio/.
)

else()

message(SEND_ERROR "component_lpc_gpio_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_gint_adapter)
# Add set(CONFIG_USE_component_gint_adapter true) in config.cmake to use this component

message("component_gint_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_gint)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/gpio/fsl_adapter_gint.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/gpio/.
)

else()

message(SEND_ERROR "component_gint_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_flexcomm_i2c_adapter)
# Add set(CONFIG_USE_component_flexcomm_i2c_adapter true) in config.cmake to use this component

message("component_flexcomm_i2c_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_driver_flexcomm_i2c)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/i2c/fsl_adapter_flexcomm_i2c.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/i2c/.
)

else()

message(SEND_ERROR "component_flexcomm_i2c_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_i3c_adapter)
# Add set(CONFIG_USE_component_i3c_adapter true) in config.cmake to use this component

message("component_i3c_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_driver_i3c)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/i2c/fsl_adapter_i3c.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/i2c/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSDK_I3C_BASED_COMPONENT_USED=1
  )

endif()

else()

message(SEND_ERROR "component_i3c_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_i3c_bus)
# Add set(CONFIG_USE_component_i3c_bus true) in config.cmake to use this component

message("component_i3c_bus component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_lists)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/i3c_bus/fsl_component_i3c.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/i3c_bus/.
)

else()

message(SEND_ERROR "component_i3c_bus.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_i3c_bus_adapter)
# Add set(CONFIG_USE_component_i3c_bus_adapter true) in config.cmake to use this component

message("component_i3c_bus_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_i3c AND CONFIG_USE_component_i3c_bus)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/i3c_bus/fsl_component_i3c_adapter.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/i3c_bus/.
)

else()

message(SEND_ERROR "component_i3c_bus_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_ili9341)
# Add set(CONFIG_USE_driver_ili9341 true) in config.cmake to use this component

message("driver_ili9341 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/ili9341/fsl_ili9341.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/ili9341/.
)

else()

message(SEND_ERROR "driver_ili9341.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_led)
# Add set(CONFIG_USE_component_led true) in config.cmake to use this component

message("component_led component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_timer_manager AND (CONFIG_USE_component_lpc_gpio_adapter))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/led/fsl_component_led.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/led/.
)

else()

message(SEND_ERROR "component_led.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_lists)
# Add set(CONFIG_USE_component_lists true) in config.cmake to use this component

message("component_lists component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/lists/fsl_component_generic_list.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/lists/.
)

else()

message(SEND_ERROR "component_lists.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_log)
# Add set(CONFIG_USE_component_log true) in config.cmake to use this component

message("component_log component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_utility_str)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/log/fsl_component_log.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/log/.
)

else()

message(SEND_ERROR "component_log.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_log_backend_debugconsole)
# Add set(CONFIG_USE_component_log_backend_debugconsole true) in config.cmake to use this component

message("component_log_backend_debugconsole component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_log AND CONFIG_USE_utility_debug_console)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/log/fsl_component_log_backend_debugconsole.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/log/.
)

else()

message(SEND_ERROR "component_log_backend_debugconsole.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_log_backend_debugconsole_lite)
# Add set(CONFIG_USE_component_log_backend_debugconsole_lite true) in config.cmake to use this component

message("component_log_backend_debugconsole_lite component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_log AND CONFIG_USE_utility_debug_console_lite)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/log/fsl_component_log_backend_debugconsole.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/log/.
)

else()

message(SEND_ERROR "component_log_backend_debugconsole_lite.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_log_backend_ringbuffer)
# Add set(CONFIG_USE_component_log_backend_ringbuffer true) in config.cmake to use this component

message("component_log_backend_ringbuffer component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_log)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/log/fsl_component_log_backend_ringbuffer.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/log/.
)

else()

message(SEND_ERROR "component_log_backend_ringbuffer.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_mem_manager)
# Add set(CONFIG_USE_component_mem_manager true) in config.cmake to use this component

message("component_mem_manager component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_lists)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/mem_manager/fsl_component_mem_manager.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/mem_manager/.
)

else()

message(SEND_ERROR "component_mem_manager.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_mem_manager_light)
# Add set(CONFIG_USE_component_mem_manager_light true) in config.cmake to use this component

message("component_mem_manager_light component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_lists)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/mem_manager/fsl_component_mem_manager_light.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/mem_manager/.
)

else()

message(SEND_ERROR "component_mem_manager_light.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_mem_manager_freertos)
# Add set(CONFIG_USE_component_mem_manager_freertos true) in config.cmake to use this component

message("component_mem_manager_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_middleware_freertos-kernel)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/mem_manager/fsl_component_mem_manager_freertos.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/mem_manager/.
)

else()

message(SEND_ERROR "component_mem_manager_freertos.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_mflash_file)
# Add set(CONFIG_USE_component_mflash_file true) in config.cmake to use this component

message("component_mflash_file component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_component_mflash_lpc55s3x OR CONFIG_USE_component_mflash_lpc55s3x_flexspi)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/flash/mflash/mflash_file.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/flash/mflash/.
)

else()

message(SEND_ERROR "component_mflash_file.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_mflash_dummy)
# Add set(CONFIG_USE_component_mflash_dummy true) in config.cmake to use this component

message("component_mflash_dummy component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_component_mflash_file)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/flash/mflash/mflash_dummy.c
)

else()

message(SEND_ERROR "component_mflash_dummy.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_mflash_lpc55s3x)
# Add set(CONFIG_USE_component_mflash_lpc55s3x true) in config.cmake to use this component

message("component_mflash_lpc55s3x component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_component_mflash_common AND (CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_flashiap)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/flash/mflash/lpc55s3x/mflash_drv.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/flash/mflash/lpc55s3x/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DMFLASH_FILE_BASEADDR=131072
  )

endif()

else()

message(SEND_ERROR "component_mflash_lpc55s3x.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_mflash_lpc55s3x_flexspi)
# Add set(CONFIG_USE_component_mflash_lpc55s3x_flexspi true) in config.cmake to use this component

message("component_mflash_lpc55s3x_flexspi component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_component_mflash_common AND (CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_flashiap)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/flash/mflash/lpc55s3x_flexspi/mflash_drv.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/flash/mflash/lpc55s3x_flexspi/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DMFLASH_FILE_BASEADDR=134217728
  )

endif()

else()

message(SEND_ERROR "component_mflash_lpc55s3x_flexspi.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_mma8451q)
# Add set(CONFIG_USE_driver_mma8451q true) in config.cmake to use this component

message("driver_mma8451q component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/mma8451q/fsl_mma.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/mma8451q/.
)

else()

message(SEND_ERROR "driver_mma8451q.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_mma8652fc)
# Add set(CONFIG_USE_driver_mma8652fc true) in config.cmake to use this component

message("driver_mma8652fc component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/mma8652fc/fsl_mma.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/mma8652fc/.
)

else()

message(SEND_ERROR "driver_mma8652fc.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_panic)
# Add set(CONFIG_USE_component_panic true) in config.cmake to use this component

message("component_panic component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/panic/fsl_component_panic.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/panic/.
)

else()

message(SEND_ERROR "component_panic.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_pwm_ctimer_adapter)
# Add set(CONFIG_USE_component_pwm_ctimer_adapter true) in config.cmake to use this component

message("component_pwm_ctimer_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_driver_ctimer)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/pwm/fsl_adapter_pwm_ctimer.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/pwm/.
)

else()

message(SEND_ERROR "component_pwm_ctimer_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_reset_adapter)
# Add set(CONFIG_USE_component_reset_adapter true) in config.cmake to use this component

message("component_reset_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/reset/fsl_adapter_reset.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/reset/.
)

else()

message(SEND_ERROR "component_reset_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_software_rng_adapter)
# Add set(CONFIG_USE_component_software_rng_adapter true) in config.cmake to use this component

message("component_software_rng_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/rng/fsl_adapter_software_rng.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/rng/.
)

else()

message(SEND_ERROR "component_software_rng_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_serial_manager)
# Add set(CONFIG_USE_component_serial_manager true) in config.cmake to use this component

message("component_serial_manager component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_lists AND (CONFIG_USE_component_serial_manager_uart OR CONFIG_USE_component_serial_manager_usb_cdc OR CONFIG_USE_component_serial_manager_virtual OR CONFIG_USE_component_serial_manager_swo OR CONFIG_USE_component_serial_manager_spi))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/serial_manager/fsl_component_serial_manager.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/serial_manager/.
)

else()

message(SEND_ERROR "component_serial_manager.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_serial_manager_spi)
# Add set(CONFIG_USE_component_serial_manager_spi true) in config.cmake to use this component

message("component_serial_manager_spi component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_component_serial_manager AND ((CONFIG_USE_driver_flexcomm_spi AND CONFIG_USE_component_flexcomm_spi_adapter)))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/serial_manager/fsl_component_serial_port_spi.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/serial_manager/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSERIAL_PORT_TYPE_SPI=1
    -DSERIAL_PORT_TYPE_SPI_MASTER=1
    -DSERIAL_PORT_TYPE_SPI_SLAVE=1
    -DSERIAL_MANAGER_NON_BLOCKING_MODE=1
  )

endif()

else()

message(SEND_ERROR "component_serial_manager_spi.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_serial_manager_usb_cdc)
# Add set(CONFIG_USE_component_serial_manager_usb_cdc true) in config.cmake to use this component

message("component_serial_manager_usb_cdc component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_component_serial_manager AND CONFIG_USE_middleware_usb_device_cdc_external AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/serial_manager/fsl_component_serial_port_usb.c
  ${CMAKE_CURRENT_LIST_DIR}/../../components/serial_manager/usb_cdc_adapter/usb_device_descriptor.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/serial_manager/.
  ${CMAKE_CURRENT_LIST_DIR}/../../components/serial_manager/usb_cdc_adapter
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSERIAL_PORT_TYPE_USBCDC=1
    -DDEBUG_CONSOLE_TRANSFER_NON_BLOCKING
    -DUSB_DEVICE_CONFIG_CDC_ACM=1
  )

endif()

else()

message(SEND_ERROR "component_serial_manager_usb_cdc.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_serial_manager_virtual)
# Add set(CONFIG_USE_component_serial_manager_virtual true) in config.cmake to use this component

message("component_serial_manager_virtual component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_component_serial_manager AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/serial_manager/fsl_component_serial_port_virtual.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/serial_manager/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSERIAL_PORT_TYPE_VIRTUAL=1
    -DDEBUG_CONSOLE_TRANSFER_NON_BLOCKING
  )

endif()

else()

message(SEND_ERROR "component_serial_manager_virtual.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_serial_manager_swo)
# Add set(CONFIG_USE_component_serial_manager_swo true) in config.cmake to use this component

message("component_serial_manager_swo component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_CORE STREQUAL cm33) AND CONFIG_USE_driver_common AND CONFIG_USE_component_serial_manager)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/serial_manager/fsl_component_serial_port_swo.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/serial_manager/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSERIAL_PORT_TYPE_SWO=1
  )

endif()

else()

message(SEND_ERROR "component_serial_manager_swo.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_sgtl5000)
# Add set(CONFIG_USE_driver_sgtl5000 true) in config.cmake to use this component

message("driver_sgtl5000 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_codec_i2c)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/sgtl5000/fsl_sgtl5000.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/sgtl5000/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSDK_I2C_BASED_COMPONENT_USED=1
    -DBOARD_USE_CODEC=1
    -DCODEC_SGTL5000_ENABLE
  )

endif()

else()

message(SEND_ERROR "driver_sgtl5000.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_utility_shell)
# Add set(CONFIG_USE_utility_shell true) in config.cmake to use this component

message("utility_shell component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_utility_str AND CONFIG_USE_component_lists AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/shell/fsl_shell.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../utilities/shell/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DDEBUG_CONSOLE_RX_ENABLE=0
  )

endif()

else()

message(SEND_ERROR "utility_shell.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_flexcomm_spi_adapter)
# Add set(CONFIG_USE_component_flexcomm_spi_adapter true) in config.cmake to use this component

message("component_flexcomm_spi_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_driver_flexcomm_spi)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/spi/fsl_adapter_flexcomm_spi.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/spi/.
)

else()

message(SEND_ERROR "component_flexcomm_spi_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_ctimer_adapter)
# Add set(CONFIG_USE_component_ctimer_adapter true) in config.cmake to use this component

message("component_ctimer_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_driver_ctimer)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/timer/fsl_adapter_ctimer.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/timer/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DTIMER_PORT_TYPE_CTIMER=1
  )

endif()

else()

message(SEND_ERROR "component_ctimer_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_mrt_adapter)
# Add set(CONFIG_USE_component_mrt_adapter true) in config.cmake to use this component

message("component_mrt_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_driver_mrt)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/timer/fsl_adapter_mrt.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/timer/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DTIMER_PORT_TYPE_MRT=1
  )

endif()

else()

message(SEND_ERROR "component_mrt_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_ostimer_adapter)
# Add set(CONFIG_USE_component_ostimer_adapter true) in config.cmake to use this component

message("component_ostimer_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_driver_ostimer)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/timer/fsl_adapter_ostimer.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/timer/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DTIMER_PORT_TYPE_OSTIMER=1
  )

endif()

else()

message(SEND_ERROR "component_ostimer_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_timer_manager)
# Add set(CONFIG_USE_component_timer_manager true) in config.cmake to use this component

message("component_timer_manager component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_lists AND (CONFIG_USE_component_ctimer_adapter OR CONFIG_USE_component_mrt_adapter OR CONFIG_USE_component_ostimer_adapter))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/timer_manager/fsl_component_timer_manager.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/timer_manager/.
)

else()

message(SEND_ERROR "component_timer_manager.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_usart_adapter)
# Add set(CONFIG_USE_component_usart_adapter true) in config.cmake to use this component

message("component_usart_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_driver_flexcomm_usart AND CONFIG_USE_driver_flexcomm)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/uart/fsl_adapter_usart.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/uart/.
)

else()

message(SEND_ERROR "component_usart_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_component_usart_dma_adapter)
# Add set(CONFIG_USE_component_usart_dma_adapter true) in config.cmake to use this component

message("component_usart_dma_adapter component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_component_usart_adapter AND CONFIG_USE_component_timer_manager AND CONFIG_USE_driver_flexcomm_usart_dma)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/uart/fsl_adapter_usart.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/uart/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DHAL_UART_DMA_ENABLE=1
  )

endif()

else()

message(SEND_ERROR "component_usart_dma_adapter.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_wm8904)
# Add set(CONFIG_USE_driver_wm8904 true) in config.cmake to use this component

message("driver_wm8904 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_codec_i2c)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/wm8904/fsl_wm8904.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/wm8904/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSDK_I2C_BASED_COMPONENT_USED=1
    -DBOARD_USE_CODEC=1
    -DCODEC_WM8904_ENABLE
  )

endif()

else()

message(SEND_ERROR "driver_wm8904.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_wm8960)
# Add set(CONFIG_USE_driver_wm8960 true) in config.cmake to use this component

message("driver_wm8960 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND CONFIG_USE_component_codec_i2c)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/wm8960/fsl_wm8960.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../components/codec/wm8960/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSDK_I2C_BASED_COMPONENT_USED=1
    -DBOARD_USE_CODEC=1
    -DCODEC_WM8960_ENABLE
  )

endif()

else()

message(SEND_ERROR "driver_wm8960.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_aoi)
# Add set(CONFIG_USE_driver_aoi true) in config.cmake to use this component

message("driver_aoi component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/aoi/fsl_aoi.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/aoi/.
)

else()

message(SEND_ERROR "driver_aoi.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_crc)
# Add set(CONFIG_USE_driver_crc true) in config.cmake to use this component

message("driver_crc component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/crc/fsl_crc.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/crc/.
)

else()

message(SEND_ERROR "driver_crc.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_dac_1)
# Add set(CONFIG_USE_driver_dac_1 true) in config.cmake to use this component

message("driver_dac_1 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/dac_1/fsl_dac.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/dac_1/.
)

else()

message(SEND_ERROR "driver_dac_1.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_enc)
# Add set(CONFIG_USE_driver_enc true) in config.cmake to use this component

message("driver_enc component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/enc/fsl_enc.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/enc/.
)

else()

message(SEND_ERROR "driver_enc.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_flexspi)
# Add set(CONFIG_USE_driver_flexspi true) in config.cmake to use this component

message("driver_flexspi component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexspi/fsl_flexspi.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexspi/.
)

else()

message(SEND_ERROR "driver_flexspi.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_irtc)
# Add set(CONFIG_USE_driver_irtc true) in config.cmake to use this component

message("driver_irtc component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/irtc/fsl_irtc.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/irtc/.
)

else()

message(SEND_ERROR "driver_irtc.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_lpadc)
# Add set(CONFIG_USE_driver_lpadc true) in config.cmake to use this component

message("driver_lpadc component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/lpadc/fsl_lpadc.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/lpadc/.
)

else()

message(SEND_ERROR "driver_lpadc.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_pwm)
# Add set(CONFIG_USE_driver_pwm true) in config.cmake to use this component

message("driver_pwm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/pwm/fsl_pwm.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/pwm/.
)

else()

message(SEND_ERROR "driver_pwm.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_vref_1)
# Add set(CONFIG_USE_driver_vref_1 true) in config.cmake to use this component

message("driver_vref_1 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/vref_1/fsl_vref.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/vref_1/.
)

else()

message(SEND_ERROR "driver_vref_1.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_anactrl)
# Add set(CONFIG_USE_driver_anactrl true) in config.cmake to use this component

message("driver_anactrl component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/anactrl/fsl_anactrl.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/anactrl/.
)

else()

message(SEND_ERROR "driver_anactrl.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_cache_cache64)
# Add set(CONFIG_USE_driver_cache_cache64 true) in config.cmake to use this component

message("driver_cache_cache64 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/cache/cache64/fsl_cache.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/cache/cache64/.
)

else()

message(SEND_ERROR "driver_cache_cache64.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_cache_lpcac)
# Add set(CONFIG_USE_driver_cache_lpcac true) in config.cmake to use this component

message("driver_cache_lpcac component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/cache/lpcac_n4a_mcxn/fsl_cache_lpcac.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/cache/lpcac_n4a_mcxn/.
)

else()

message(SEND_ERROR "driver_cache_lpcac.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_cdog)
# Add set(CONFIG_USE_driver_cdog true) in config.cmake to use this component

message("driver_cdog component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/cdog/fsl_cdog.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/cdog/.
)

else()

message(SEND_ERROR "driver_cdog.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_cmp_1)
# Add set(CONFIG_USE_driver_cmp_1 true) in config.cmake to use this component

message("driver_cmp_1 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/cmp_1/fsl_cmp.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/cmp_1/.
)

else()

message(SEND_ERROR "driver_cmp_1.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_ctimer)
# Add set(CONFIG_USE_driver_ctimer true) in config.cmake to use this component

message("driver_ctimer component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/ctimer/fsl_ctimer.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/ctimer/.
)

else()

message(SEND_ERROR "driver_ctimer.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_dmic)
# Add set(CONFIG_USE_driver_dmic true) in config.cmake to use this component

message("driver_dmic component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/dmic/fsl_dmic.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/dmic/.
)

else()

message(SEND_ERROR "driver_dmic.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_flexcomm)
# Add set(CONFIG_USE_driver_flexcomm true) in config.cmake to use this component

message("driver_flexcomm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND (CONFIG_DEVICE_ID STREQUAL LPC55S36))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/fsl_flexcomm.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/.
)

else()

message(SEND_ERROR "driver_flexcomm.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_gint)
# Add set(CONFIG_USE_driver_gint true) in config.cmake to use this component

message("driver_gint component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/gint/fsl_gint.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/gint/.
)

else()

message(SEND_ERROR "driver_gint.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_hscmp)
# Add set(CONFIG_USE_driver_hscmp true) in config.cmake to use this component

message("driver_hscmp component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/hscmp/fsl_hscmp.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/hscmp/.
)

else()

message(SEND_ERROR "driver_hscmp.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_flexcomm_i2c)
# Add set(CONFIG_USE_driver_flexcomm_i2c true) in config.cmake to use this component

message("driver_flexcomm_i2c component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_flexcomm AND CONFIG_USE_driver_common AND (CONFIG_DEVICE_ID STREQUAL LPC55S36))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/i2c/fsl_i2c.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/i2c/.
)

else()

message(SEND_ERROR "driver_flexcomm_i2c.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_flexcomm_i2s)
# Add set(CONFIG_USE_driver_flexcomm_i2s true) in config.cmake to use this component

message("driver_flexcomm_i2s component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_flexcomm AND CONFIG_USE_driver_common AND (CONFIG_DEVICE_ID STREQUAL LPC55S36))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/i2s/fsl_i2s.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/i2s/.
)

else()

message(SEND_ERROR "driver_flexcomm_i2s.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_i3c)
# Add set(CONFIG_USE_driver_i3c true) in config.cmake to use this component

message("driver_i3c component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND (CONFIG_DEVICE_ID STREQUAL LPC55S36))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/i3c/fsl_i3c.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/i3c/.
)

else()

message(SEND_ERROR "driver_i3c.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_i3c_dma)
# Add set(CONFIG_USE_driver_i3c_dma true) in config.cmake to use this component

message("driver_i3c_dma component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_i3c AND CONFIG_USE_driver_lpc_dma)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/i3c/fsl_i3c_dma.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/i3c/.
)

else()

message(SEND_ERROR "driver_i3c_dma.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_inputmux)
# Add set(CONFIG_USE_driver_inputmux true) in config.cmake to use this component

message("driver_inputmux component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common AND CONFIG_USE_driver_inputmux_connections)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/inputmux/fsl_inputmux.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/inputmux/.
)

else()

message(SEND_ERROR "driver_inputmux.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_iped)
# Add set(CONFIG_USE_driver_iped true) in config.cmake to use this component

message("driver_iped component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common AND CONFIG_USE_component_els_pkc AND CONFIG_USE_driver_flashiap AND CONFIG_USE_driver_mem_interface)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/iped/fsl_iped.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/iped/.
)

else()

message(SEND_ERROR "driver_iped.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_itrc)
# Add set(CONFIG_USE_driver_itrc true) in config.cmake to use this component

message("driver_itrc component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/itrc/fsl_itrc.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/itrc/.
)

else()

message(SEND_ERROR "driver_itrc.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_lpc_dma)
# Add set(CONFIG_USE_driver_lpc_dma true) in config.cmake to use this component

message("driver_lpc_dma component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/lpc_dma/fsl_dma.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/lpc_dma/.
)

else()

message(SEND_ERROR "driver_lpc_dma.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_lpc_freqme)
# Add set(CONFIG_USE_driver_lpc_freqme true) in config.cmake to use this component

message("driver_lpc_freqme component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/lpc_freqme/fsl_freqme.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/lpc_freqme/.
)

else()

message(SEND_ERROR "driver_lpc_freqme.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_lpc_gpio)
# Add set(CONFIG_USE_driver_lpc_gpio true) in config.cmake to use this component

message("driver_lpc_gpio component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/lpc_gpio/fsl_gpio.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/lpc_gpio/.
)

else()

message(SEND_ERROR "driver_lpc_gpio.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_lpc_iocon)
# Add set(CONFIG_USE_driver_lpc_iocon true) in config.cmake to use this component

message("driver_lpc_iocon component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/lpc_iocon/.
)

else()

message(SEND_ERROR "driver_lpc_iocon.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_mcan)
# Add set(CONFIG_USE_driver_mcan true) in config.cmake to use this component

message("driver_mcan component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/mcan/fsl_mcan.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/mcan/.
)

else()

message(SEND_ERROR "driver_mcan.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_mrt)
# Add set(CONFIG_USE_driver_mrt true) in config.cmake to use this component

message("driver_mrt component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/mrt/fsl_mrt.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/mrt/.
)

else()

message(SEND_ERROR "driver_mrt.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_opamp)
# Add set(CONFIG_USE_driver_opamp true) in config.cmake to use this component

message("driver_opamp component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/opamp/fsl_opamp.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/opamp/.
)

else()

message(SEND_ERROR "driver_opamp.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_ostimer)
# Add set(CONFIG_USE_driver_ostimer true) in config.cmake to use this component

message("driver_ostimer component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/ostimer/fsl_ostimer.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/ostimer/.
)

else()

message(SEND_ERROR "driver_ostimer.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_pint)
# Add set(CONFIG_USE_driver_pint true) in config.cmake to use this component

message("driver_pint component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/pint/fsl_pint.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/pint/.
)

else()

message(SEND_ERROR "driver_pint.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_powerquad)
# Add set(CONFIG_USE_driver_powerquad true) in config.cmake to use this component

message("driver_powerquad component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/powerquad/fsl_powerquad_data.c
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/powerquad/fsl_powerquad_basic.c
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/powerquad/fsl_powerquad_math.c
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/powerquad/fsl_powerquad_matrix.c
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/powerquad/fsl_powerquad_filter.c
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/powerquad/fsl_powerquad_transform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/powerquad/.
)

else()

message(SEND_ERROR "driver_powerquad.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_powerquad_cmsis)
# Add set(CONFIG_USE_driver_powerquad_cmsis true) in config.cmake to use this component

message("driver_powerquad_cmsis component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_powerquad AND CONFIG_USE_CMSIS_DSP_Include)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/powerquad/fsl_powerquad_cmsis.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/powerquad/.
)

else()

message(SEND_ERROR "driver_powerquad_cmsis.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_puf_v3)
# Add set(CONFIG_USE_driver_puf_v3 true) in config.cmake to use this component

message("driver_puf_v3 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/puf_v3/fsl_puf_v3.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/puf_v3/.
)

else()

message(SEND_ERROR "driver_puf_v3.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_sctimer)
# Add set(CONFIG_USE_driver_sctimer true) in config.cmake to use this component

message("driver_sctimer component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/sctimer/fsl_sctimer.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/sctimer/.
)

else()

message(SEND_ERROR "driver_sctimer.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_flexcomm_spi)
# Add set(CONFIG_USE_driver_flexcomm_spi true) in config.cmake to use this component

message("driver_flexcomm_spi component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_flexcomm AND CONFIG_USE_driver_common AND (CONFIG_DEVICE_ID STREQUAL LPC55S36))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/spi/fsl_spi.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/spi/.
)

else()

message(SEND_ERROR "driver_flexcomm_spi.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_sysctl)
# Add set(CONFIG_USE_driver_sysctl true) in config.cmake to use this component

message("driver_sysctl component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/sysctl/fsl_sysctl.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/sysctl/.
)

else()

message(SEND_ERROR "driver_sysctl.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_flexcomm_usart)
# Add set(CONFIG_USE_driver_flexcomm_usart true) in config.cmake to use this component

message("driver_flexcomm_usart component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_flexcomm AND (CONFIG_DEVICE_ID STREQUAL LPC55S36))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/usart/fsl_usart.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/flexcomm/usart/.
)

else()

message(SEND_ERROR "driver_flexcomm_usart.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_flexcomm_usart_freertos)
# Add set(CONFIG_USE_driver_flexcomm_usart_freertos true) in config.cmake to use this component

message("driver_flexcomm_usart_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_flexcomm AND CONFIG_USE_driver_flexcomm_usart AND CONFIG_USE_middleware_freertos-kernel)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/drivers/fsl_usart_freertos.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/drivers/.
)

else()

message(SEND_ERROR "driver_flexcomm_usart_freertos.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_utick)
# Add set(CONFIG_USE_driver_utick true) in config.cmake to use this component

message("driver_utick component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/utick/fsl_utick.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/utick/.
)

else()

message(SEND_ERROR "driver_utick.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_wwdt)
# Add set(CONFIG_USE_driver_wwdt true) in config.cmake to use this component

message("driver_wwdt component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL LPC55S36) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/wwdt/fsl_wwdt.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/../../drivers/wwdt/.
)

else()

message(SEND_ERROR "driver_wwdt.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_flashiap)
# Add set(CONFIG_USE_driver_flashiap true) in config.cmake to use this component

message("driver_flashiap component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/drivers/flash/src/fsl_flash.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/drivers/flash
)

else()

message(SEND_ERROR "driver_flashiap.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_mem_interface)
# Add set(CONFIG_USE_driver_mem_interface true) in config.cmake to use this component

message("driver_mem_interface component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/drivers/mem_interface/src/fsl_mem_interface.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/drivers/mem_interface
  ${CMAKE_CURRENT_LIST_DIR}/drivers/flash
  ${CMAKE_CURRENT_LIST_DIR}/drivers/nboot
)

else()

message(SEND_ERROR "driver_mem_interface.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_runbootloader)
# Add set(CONFIG_USE_driver_runbootloader true) in config.cmake to use this component

message("driver_runbootloader component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/drivers/runbootloader/src/fsl_runbootloader.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/drivers/mem_interface
  ${CMAKE_CURRENT_LIST_DIR}/drivers/flash
  ${CMAKE_CURRENT_LIST_DIR}/drivers/nboot
  ${CMAKE_CURRENT_LIST_DIR}/drivers/runbootloader
)

else()

message(SEND_ERROR "driver_runbootloader.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_reset)
# Add set(CONFIG_USE_driver_reset true) in config.cmake to use this component

message("driver_reset component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND (CONFIG_DEVICE_ID STREQUAL LPC55S36))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/drivers/fsl_reset.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/drivers/.
)

else()

message(SEND_ERROR "driver_reset.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_driver_power)
# Add set(CONFIG_USE_driver_power true) in config.cmake to use this component

message("driver_power component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_driver_common AND (CONFIG_DEVICE_ID STREQUAL LPC55S36))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/drivers/fsl_power.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/drivers/.
)

else()

message(SEND_ERROR "driver_power.LPC55S36 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()

