# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/admiralcapo/Personal/Learning/Vulkan-Probe

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/admiralcapo/Personal/Learning/Vulkan-Probe/build

# Utility rule file for copy_compile_commands.

# Include any custom commands dependencies for this target.
include CMakeFiles/copy_compile_commands.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/copy_compile_commands.dir/progress.make

CMakeFiles/copy_compile_commands: bin/VulkanApp
	/usr/bin/cmake -E copy_if_different /home/admiralcapo/Personal/Learning/Vulkan-Probe/build/compile_commands.json /home/admiralcapo/Personal/Learning/Vulkan-Probe/compile_commands.json

CMakeFiles/copy_compile_commands.dir/codegen:
.PHONY : CMakeFiles/copy_compile_commands.dir/codegen

copy_compile_commands: CMakeFiles/copy_compile_commands
copy_compile_commands: CMakeFiles/copy_compile_commands.dir/build.make
.PHONY : copy_compile_commands

# Rule to build all files generated by this target.
CMakeFiles/copy_compile_commands.dir/build: copy_compile_commands
.PHONY : CMakeFiles/copy_compile_commands.dir/build

CMakeFiles/copy_compile_commands.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/copy_compile_commands.dir/cmake_clean.cmake
.PHONY : CMakeFiles/copy_compile_commands.dir/clean

CMakeFiles/copy_compile_commands.dir/depend:
	cd /home/admiralcapo/Personal/Learning/Vulkan-Probe/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/admiralcapo/Personal/Learning/Vulkan-Probe /home/admiralcapo/Personal/Learning/Vulkan-Probe /home/admiralcapo/Personal/Learning/Vulkan-Probe/build /home/admiralcapo/Personal/Learning/Vulkan-Probe/build /home/admiralcapo/Personal/Learning/Vulkan-Probe/build/CMakeFiles/copy_compile_commands.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/copy_compile_commands.dir/depend

