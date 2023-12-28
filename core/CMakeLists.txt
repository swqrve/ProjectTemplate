cmake_minimum_required(VERSION 3.16)

set(CORE_LIBRARY_NAME "core") # Core is the default name, change the library name in CMakeList if this is changed
set(CORE_VERSION_NUMBER "1.0.0")

file(GLOB_RECURSE CORE_SRCS CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")

add_library(${CORE_LIBRARY_NAME} STATIC)

set_property(TARGET ${CORE_LIBRARY_NAME} PROPERTY CXX_STANDARD 17)

target_include_directories(${CORE_LIBRARY_NAME} PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/src")
target_sources("${CORE_LIBRARY_NAME}" PRIVATE ${CORE_SRCS} )

target_link_libraries(${CORE_LIBRARY_NAME} PRIVATE glfw glad glm stb_image stb_truetype)
