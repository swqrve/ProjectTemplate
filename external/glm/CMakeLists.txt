cmake_minimum_required(VERSION 3.1)
set(GLM_VERSION "0.9.9")

project(glm)

add_library(glm INTERFACE)


target_include_directories(glm INTERFACE include "${CMAKE_CURRENT_SOURCE_DIR}/")
