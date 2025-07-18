#Description: Driver codec; user_visible: True
include_guard(GLOBAL)
message("driver_codec component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/fsl_codec_common.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/.
)

#OR Logic component
if(CONFIG_USE_component_cs42448_adapter) 
    include(component_cs42448_adapter)
endif()
if(CONFIG_USE_component_codec_adapters) 
    include(component_codec_adapters)
endif()
if(CONFIG_USE_component_wm8960_adapter) 
    include(component_wm8960_adapter)
endif()
if(CONFIG_USE_component_wm8904_adapter) 
    include(component_wm8904_adapter)
endif()
if(CONFIG_USE_component_tfa9896_adapter) 
    include(component_tfa9896_adapter)
endif()
if(CONFIG_USE_component_wm8962_adapter) 
    include(component_wm8962_adapter)
endif()

include(driver_common)
