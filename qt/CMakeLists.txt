cmake_minimum_required(VERSION 3.14)
project(my_project)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Find Qt6 packages
find_package(Qt6 REQUIRED COMPONENTS Core Quick Qml Widgets)

# Add your executable
add_executable(my_project src/main.cpp)

# Link against Qt6 libraries
target_link_libraries(my_project Qt6::Core Qt6::Gui Qt6::Widgets Qt6::Qml)
