# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/local/bin/cmake

# The command to remove a file.
RM = /opt/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /opt/tools/bladerf-tun-interface

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /opt/tools/bladerf-tun-interface/build

# Include any dependencies generated for this target.
include CMakeFiles/tx.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/tx.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/tx.dir/flags.make

CMakeFiles/tx.dir/src/main_tx.c.o: CMakeFiles/tx.dir/flags.make
CMakeFiles/tx.dir/src/main_tx.c.o: ../src/main_tx.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/tools/bladerf-tun-interface/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/tx.dir/src/main_tx.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tx.dir/src/main_tx.c.o   -c /opt/tools/bladerf-tun-interface/src/main_tx.c

CMakeFiles/tx.dir/src/main_tx.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tx.dir/src/main_tx.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /opt/tools/bladerf-tun-interface/src/main_tx.c > CMakeFiles/tx.dir/src/main_tx.c.i

CMakeFiles/tx.dir/src/main_tx.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tx.dir/src/main_tx.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /opt/tools/bladerf-tun-interface/src/main_tx.c -o CMakeFiles/tx.dir/src/main_tx.c.s

CMakeFiles/tx.dir/src/main_tx.c.o.requires:

.PHONY : CMakeFiles/tx.dir/src/main_tx.c.o.requires

CMakeFiles/tx.dir/src/main_tx.c.o.provides: CMakeFiles/tx.dir/src/main_tx.c.o.requires
	$(MAKE) -f CMakeFiles/tx.dir/build.make CMakeFiles/tx.dir/src/main_tx.c.o.provides.build
.PHONY : CMakeFiles/tx.dir/src/main_tx.c.o.provides

CMakeFiles/tx.dir/src/main_tx.c.o.provides.build: CMakeFiles/tx.dir/src/main_tx.c.o


CMakeFiles/tx.dir/src/config.c.o: CMakeFiles/tx.dir/flags.make
CMakeFiles/tx.dir/src/config.c.o: ../src/config.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/tools/bladerf-tun-interface/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/tx.dir/src/config.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tx.dir/src/config.c.o   -c /opt/tools/bladerf-tun-interface/src/config.c

CMakeFiles/tx.dir/src/config.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tx.dir/src/config.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /opt/tools/bladerf-tun-interface/src/config.c > CMakeFiles/tx.dir/src/config.c.i

CMakeFiles/tx.dir/src/config.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tx.dir/src/config.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /opt/tools/bladerf-tun-interface/src/config.c -o CMakeFiles/tx.dir/src/config.c.s

CMakeFiles/tx.dir/src/config.c.o.requires:

.PHONY : CMakeFiles/tx.dir/src/config.c.o.requires

CMakeFiles/tx.dir/src/config.c.o.provides: CMakeFiles/tx.dir/src/config.c.o.requires
	$(MAKE) -f CMakeFiles/tx.dir/build.make CMakeFiles/tx.dir/src/config.c.o.provides.build
.PHONY : CMakeFiles/tx.dir/src/config.c.o.provides

CMakeFiles/tx.dir/src/config.c.o.provides.build: CMakeFiles/tx.dir/src/config.c.o


CMakeFiles/tx.dir/src/transceive.c.o: CMakeFiles/tx.dir/flags.make
CMakeFiles/tx.dir/src/transceive.c.o: ../src/transceive.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/tools/bladerf-tun-interface/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/tx.dir/src/transceive.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tx.dir/src/transceive.c.o   -c /opt/tools/bladerf-tun-interface/src/transceive.c

CMakeFiles/tx.dir/src/transceive.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tx.dir/src/transceive.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /opt/tools/bladerf-tun-interface/src/transceive.c > CMakeFiles/tx.dir/src/transceive.c.i

CMakeFiles/tx.dir/src/transceive.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tx.dir/src/transceive.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /opt/tools/bladerf-tun-interface/src/transceive.c -o CMakeFiles/tx.dir/src/transceive.c.s

CMakeFiles/tx.dir/src/transceive.c.o.requires:

.PHONY : CMakeFiles/tx.dir/src/transceive.c.o.requires

CMakeFiles/tx.dir/src/transceive.c.o.provides: CMakeFiles/tx.dir/src/transceive.c.o.requires
	$(MAKE) -f CMakeFiles/tx.dir/build.make CMakeFiles/tx.dir/src/transceive.c.o.provides.build
.PHONY : CMakeFiles/tx.dir/src/transceive.c.o.provides

CMakeFiles/tx.dir/src/transceive.c.o.provides.build: CMakeFiles/tx.dir/src/transceive.c.o


CMakeFiles/tx.dir/src/utils.c.o: CMakeFiles/tx.dir/flags.make
CMakeFiles/tx.dir/src/utils.c.o: ../src/utils.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/tools/bladerf-tun-interface/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/tx.dir/src/utils.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tx.dir/src/utils.c.o   -c /opt/tools/bladerf-tun-interface/src/utils.c

CMakeFiles/tx.dir/src/utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tx.dir/src/utils.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /opt/tools/bladerf-tun-interface/src/utils.c > CMakeFiles/tx.dir/src/utils.c.i

CMakeFiles/tx.dir/src/utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tx.dir/src/utils.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /opt/tools/bladerf-tun-interface/src/utils.c -o CMakeFiles/tx.dir/src/utils.c.s

CMakeFiles/tx.dir/src/utils.c.o.requires:

.PHONY : CMakeFiles/tx.dir/src/utils.c.o.requires

CMakeFiles/tx.dir/src/utils.c.o.provides: CMakeFiles/tx.dir/src/utils.c.o.requires
	$(MAKE) -f CMakeFiles/tx.dir/build.make CMakeFiles/tx.dir/src/utils.c.o.provides.build
.PHONY : CMakeFiles/tx.dir/src/utils.c.o.provides

CMakeFiles/tx.dir/src/utils.c.o.provides.build: CMakeFiles/tx.dir/src/utils.c.o


# Object files for target tx
tx_OBJECTS = \
"CMakeFiles/tx.dir/src/main_tx.c.o" \
"CMakeFiles/tx.dir/src/config.c.o" \
"CMakeFiles/tx.dir/src/transceive.c.o" \
"CMakeFiles/tx.dir/src/utils.c.o"

# External object files for target tx
tx_EXTERNAL_OBJECTS =

tx: CMakeFiles/tx.dir/src/main_tx.c.o
tx: CMakeFiles/tx.dir/src/config.c.o
tx: CMakeFiles/tx.dir/src/transceive.c.o
tx: CMakeFiles/tx.dir/src/utils.c.o
tx: CMakeFiles/tx.dir/build.make
tx: CMakeFiles/tx.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/opt/tools/bladerf-tun-interface/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking C executable tx"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tx.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/tx.dir/build: tx

.PHONY : CMakeFiles/tx.dir/build

CMakeFiles/tx.dir/requires: CMakeFiles/tx.dir/src/main_tx.c.o.requires
CMakeFiles/tx.dir/requires: CMakeFiles/tx.dir/src/config.c.o.requires
CMakeFiles/tx.dir/requires: CMakeFiles/tx.dir/src/transceive.c.o.requires
CMakeFiles/tx.dir/requires: CMakeFiles/tx.dir/src/utils.c.o.requires

.PHONY : CMakeFiles/tx.dir/requires

CMakeFiles/tx.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tx.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tx.dir/clean

CMakeFiles/tx.dir/depend:
	cd /opt/tools/bladerf-tun-interface/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /opt/tools/bladerf-tun-interface /opt/tools/bladerf-tun-interface /opt/tools/bladerf-tun-interface/build /opt/tools/bladerf-tun-interface/build /opt/tools/bladerf-tun-interface/build/CMakeFiles/tx.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tx.dir/depend

