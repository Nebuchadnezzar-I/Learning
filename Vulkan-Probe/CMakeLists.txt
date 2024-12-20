cmake_minimum_required(VERSION 3.16)

project(VulkanApp LANGUAGES C)

set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include_directories(/usr/include/vulkan)

link_directories(/usr/lib)

file(GLOB_RECURSE SOURCES src/*.c)

add_executable(${PROJECT_NAME} ${SOURCES})

target_link_libraries(${PROJECT_NAME} /usr/lib/libvulkan.so glfw dl)

set_target_properties(${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)

if(CMAKE_C_COMPILER_ID MATCHES "GNU|Clang")
    target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -Wpedantic)
elseif(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE /W4)
endif()

# Custom target to copy compile_commands.json for external tools
add_custom_target(copy_compile_commands ALL
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${CMAKE_BINARY_DIR}/compile_commands.json
        ${CMAKE_SOURCE_DIR}/compile_commands.json
    DEPENDS ${PROJECT_NAME}
)

# Find clang-format
find_program(CLANG_FORMAT_EXECUTABLE NAMES clang-format)

if (CLANG_FORMAT_EXECUTABLE)
    # Custom target to run clang-format
    add_custom_target(clang-format
        COMMAND ${CLANG_FORMAT_EXECUTABLE} -i ${SOURCES}
        COMMENT "Running clang-format on source files..."
    )
else()
    message(WARNING "clang-format not found. Please install it to use the clang-format target.")
endif()
