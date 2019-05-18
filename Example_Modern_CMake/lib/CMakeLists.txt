cmake_minimum_required( VERSION 3.14 )

project( MyLib
         VERSION 1.0.0
         DESCRIPTION "The internal library." )

add_library( mylib STATIC )
target_sources( mylib
    PRIVATE   "src/mylib.cpp"
    PUBLIC    "${CMAKE_CURRENT_SOURCE_DIR}/include/mylib.h" )

target_include_directories( mylib
    PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include" )

# Create ALIAS target
add_library( MyLib::mylib ALIAS mylib )
