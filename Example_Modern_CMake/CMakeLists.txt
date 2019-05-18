cmake_minimum_required(VERSION 3.14)
project( Example_Modern_CMake
         VERSION 1.0
         DESCRIPTION "Example project for Modern CMake." )

# Allow ycm to use clang C/C++ semantic parsing
set( CMAKE_EXPORT_COMPILE_COMMANDS ON )

# Always use '-fPIC'/'-fPIE' option.
set( CMAKE_POSITION_INDEPENDENT_CODE ON )

# Create targets for building the (local) libraries.
add_subdirectory( lib )

# Create the targets for the entire app.
add_subdirectory( app )

