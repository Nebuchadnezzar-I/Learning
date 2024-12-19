# Minimum CMake version
cmake_minimum_required(VERSION 3.16)

# Project name and settings
project(VulkanApp LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Enable compile_commands.json for LSP
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Include Vulkan headers
include_directories(/usr/include/vulkan)

# Link Vulkan library
link_directories(/usr/lib)

# Source files
file(GLOB_RECURSE SOURCES src/*.cpp)

# Add executable
add_executable(${PROJECT_NAME} ${SOURCES})

# Link Vulkan and other libraries
target_link_libraries(${PROJECT_NAME} /usr/lib/libvulkan.so glfw dl)

# Set output directories
set_target_properties(${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)

# Enable warnings
if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -Wpedantic)
elseif(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE /W4)
endif()

# Optional: Copy compile_commands.json to the source root for LSP
add_custom_target(copy_compile_commands ALL
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${CMAKE_BINARY_DIR}/compile_commands.json
        ${CMAKE_SOURCE_DIR}/compile_commands.json
    DEPENDS ${PROJECT_NAME}
)

