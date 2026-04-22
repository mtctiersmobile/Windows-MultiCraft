#! /bin/bash -e

mkdir cmakebuild
cd cmakebuild
CMAKE_GENERATOR=${CMAKE_GENERATOR:-Ninja}

cmake -G "${CMAKE_GENERATOR}" -DCMAKE_BUILD_TYPE=Debug \
	-DUSE_SDL=ON \
	-DIRRLICHT_SOURCE_DIR="../deps/Irrlicht" \
	-DRUN_IN_PLACE=TRUE -DENABLE_GETTEXT=TRUE \
	-DBUILD_UNITTESTS=TRUE \
	-DBUILD_SERVER=TRUE \
	-DENABLE_CCACHE=ON ${CMAKE_FLAGS} ..
cmake --build . --parallel 2
