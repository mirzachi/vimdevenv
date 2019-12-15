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

# Option automatic documentation generation with doxygen
option(DOXYGEN_ENABLE "Build documentation" ON)

if(DOXYGEN_ENABLE)
    # Check if Doxygen is installed
    find_package(Doxygen)
    if (DOXYGEN_FOUND)
        # Set input and output files
        set(DOXYGEN_IN ${CMAKE_CURRENT_SOURCE_DIR}/docs/Doxyfile.in)
        set(DOXYGEN_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

        # Request to configure the file
        configure_file(${DOXYGEN_IN} ${DOXYGEN_OUT} @ONLY)
        message("Doxygen build started")

        # Note the option ALL which allows to build the docs together with the application
        add_custom_target( docs ALL
            COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            COMMENT "Generating API documentation with Doxygen"
            VERBATIM )
    else (DOXYGEN_FOUND)
      message("Doxygen need to be installed to generate the doxygen documentation")
    endif (DOXYGEN_FOUND)
endif (DOXYGEN_ENABLE)


