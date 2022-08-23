#
# Directories
#
# Root
prefix := .
exec_prefix := $(prefix)
# Executables
bindir := $(exec_prefix)/bin
# Header files
includedir := $(prefix)/include
# Object files
libdir := $(prefix)/lib
# C files
srcdir := $(prefix)/src

# Header files
headers := hello_world.h
# Prepend each header file name with the
# include directory.
headers := $(headers:%.h=$(includedir)/%.h)

# Object files
objects := main.o hello_world.o
# Prepend each object file name with the
# lib directory.
objects := $(objects:%.o=$(libdir)/%.o)

# Executable files
executables := hello_world
# Prepend each executable file name with the
# bin directory.
executables := $(executables:%=$(bindir)/%)

# Compiler
CC := gcc
# Compiler options
# Target-specific variable values
all : CFLAGS := -Wall
debug : CFLAGS := -Wall -g

# Production build
all : directories $(executables)

# Debug build
debug : directories $(executables)

directories :
# Create bin directory if it
# does not exist.
ifeq ($(wildcard $(bindir)),)
	mkdir bin
endif
# Create include directory if it
# does not exist.
ifeq ($(wildcard $(libdir)),)
	mkdir lib
endif

# Compile executable from all prerequisites ($^).
# In this case, object files, such that an update
# in the code of any object file (C or header
# files) triggers a compilation for that object
# file and the final executable.
$(executables) : $(objects)
	$(CC) $(CFLAGS) -o $@ $^

# For each target object file in libdir,
# match C file prerequisite with same file
# name in srcdir, and also include all
# header files as prerequisites. However,
# only use the first prerequisite (the C
# file) for the recipe ($<).
$(libdir)/%.o : $(srcdir)/%.c $(headers)
	$(CC) $(CFLAGS) -o $@ -c $<

# Make clean a phony target, such that it
# is not interpreted as a file name, but
# rather a recipe to be executed explicitly
# via make, e.g. "make clean".
.PHONY : clean

# Delete bin and lib directories.
clean :
	rm -rf $(bindir) $(libdir)
