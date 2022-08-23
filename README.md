# Learn GNU make

## Table of Contents

1. [Objective](#1-objective)
2. [Implementation](#2-implementation)
3. [Instructions](#3-instructions)
4. [Footnotes](#4-footnotes)

## 1. Objective

The purpose of this project is for me to learn [GNU make](https://www.gnu.org/software/make/manual/html_node/index.html) to complement my learning of the [C language](https://beej.us/guide/bgc/) by creating a `Makefile` that will automate the compilation of my builds in a structured, scalable and portable<sup>1</sup> manner.

## 2. Implementation

The C code is just a simple `"Hello, world!"` program that calls the `hello_world()` function from `main()` by including the `hello_world.h` header file.

The directory structure for each file extension follows the structure implied by [GNU's Directory Variables](https://www.gnu.org/software/make/manual/html_node/Directory-Variables.html#Directory-Variables). That is,
- `bin`<sup>2</sup> for executables
- `include` for header files
- `lib`<sup>2</sup> for object files
- `src` for C files

Both the program dependency and directory structure above are intentionally more complex than required for this simple C program to fulfill the need for structured, scalable and portable builds that future larger projects may require and for which I intend to fork this project as a baseline skeleton.

The `Makefile` is intentionally heavily-commented for instructional purposes and as a reminder of what is occurring at each step of the code, so please check it to better understand its inner workings.

## 3. Instructions

- Clone this repository.

```
git clone https://github.com/quietinvestor/learnmake.git
```

- Change into the newly-cloned repo directory in your local storage.

```
cd learnmake
```

- Type `make` to compile the `hello_world` executable and prerequisite object files<sup>2</sup>.

- Alternatively, type `make debug` to compile the `hello_world` executable and prerequisite object files<sup>2</sup> using the debug target, which in turn uses the `-g` compilation flag, for debugging with the [GNU Debugger (gdb)](https://beej.us/guide/bggdb/).

- Type `make clean` to delete the directories that contain the compiled executable and object files<sup>2</sup>.

## 4. Footnotes

<sup>1</sup> The `Makefile` is not yet portable to other Operating Systems (OSes), but I will amend that in the future when I need it.

<sup>2</sup> Both `bin` and `lib` directories are automatically created when running `make` and deleted when running `make clean`.
