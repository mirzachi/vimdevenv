cmake_minimum_required( VERSION 3.14 )

project( App
         VERSION 1.0
         DESCRIPTION "My fancy app." )

# app target
add_executable( app )
target_sources( app PRIVATE "src/main.cpp" )
target_link_libraries( app
	PRIVATE MyLib::mylib )

