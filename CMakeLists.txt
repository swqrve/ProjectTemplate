cmake_minimum_required(VERSION 3.16)

set(PROJECT_NAME "ProjectTemplate")
set(PROJECT_VERSION_NUMBER "1.0.0")

option(EXEC_BUILD "Whether or not this is a release build" OFF) # Delete out folder if changing to ON - Used for updating the resource path

set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebug")
else ()
    set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")
endif ()

project(${PROJECT_NAME} VERSION ${PROJECT_VERSION_NUMBER})

file(GLOB_RECURSE SRCS CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp") # SRCS

#GLFW
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(GLFW_INSTALL OFF CACHE BOOL "" FORCE)
set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)

add_subdirectory(external/glfw)	        # GLFW - Window Handling
add_subdirectory(external/glad)			# GLAD - OpenGL Loader
add_subdirectory(external/glm)			# GLM - All Things Math
add_subdirectory(external/stb_image)	# STB_I - Image Loader
add_subdirectory(external/stb_truetype)	# STB_T - TTF Loader (Fonts)

add_subdirectory(core) # Core Library

add_executable("${CMAKE_PROJECT_NAME}" ${SRCS})

set_property(TARGET "${CMAKE_PROJECT_NAME}" PROPERTY CXX_STANDARD 17)


if (EXEC_BUILD)
	target_compile_definitions("${CMAKE_PROJECT_NAME}" PUBLIC RESOURCES_PATH="./resources/") 
	target_compile_definitions("${CMAKE_PROJECT_NAME}" PUBLIC EXEC_BUILD=1) 
else()
	target_compile_definitions("${CMAKE_PROJECT_NAME}" PUBLIC RESOURCES_PATH="${CMAKE_CURRENT_SOURCE_DIR}/resources/")
	target_compile_definitions("${CMAKE_PROJECT_NAME}" PUBLIC EXEC_BUILD=0) 
endif()

target_include_directories("${CMAKE_PROJECT_NAME}" PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/src/")
target_sources("${CMAKE_PROJECT_NAME}" PRIVATE ${SRCS} )

target_link_libraries("${CMAKE_PROJECT_NAME}" PRIVATE core glfw glad glm stb_image stb_truetype)