xhost + # gives permissions to launch the GUI from in the docker container

# TODO: make sure that you have the freecad source code cloned locally
fc_source=~/Dev/freecad-contrib/freecad-source
fc_build=~/Dev/freecad-contrib/freecad-build
other_files=~/Dev/freecad-contrib/other

docker build -t freecad-test .

docker run -it --rm \
-v $fc_source:/mnt/source \
-v $fc_build:/mnt/build \
-v $other_files:/mnt/files \
-e "DISPLAY" -e "QT_X11_NO_MITSHM=1" -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
freecad-test

# Then build with these commands inside the container:
# cd /mnt/source
# cmake -DPYTHON_EXECUTABLE=/usr/bin/python3 -DFREECAD_USE_PYBIND11=ON /mnt/source
# make -j$(nproc --ignore=2)
#
# The binary will be located in /mnt/source/bin/FreeCAD
#
# TODO: optimize compilation time
