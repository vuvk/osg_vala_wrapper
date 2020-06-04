#!/bin/sh

export VAPI_DIR='vapi/'
export INCLUDE_DIR=''
export LIB_DIR=''
export FLAGS='-O3'
export OSG='osg'
export OSG_FX='osgFX'
export OSG_DB='osgDB'
export OSG_VIEWER='osgViewer'
export OPEN_THREADS='OpenThreads'

mkdir build

echo vala side
valac --vapidir=$VAPI_DIR \
	--pkg gl \
	src/osg/OSGObject.vala \
	src/osg/Math/Vec2i.vala \
	src/osg/Math/Vec3i.vala \
	src/osg/Math/Vec4i.vala \
	src/osg/Math/Vec2f.vala \
	src/osg/Math/Vec3f.vala \
	src/osg/Math/Vec4f.vala \
	src/osg/FX/Effect.vala \
	src/osg/FX/Outline.vala \
	src/osg/BufferData.vala \
	src/osg/Camera.vala \
	src/osg/DisplaySettings.vala \
	src/osg/Drawable.vala \
	src/osg/Geometry.vala \
	src/osg/Group.vala \
	src/osg/Image.vala \
	src/osg/Node.vala \
	src/osg/Transform.vala \
	src/osg/Viewer.vala \
	src/osgoutline.vala \
	-c

echo cpp wrappers
g++ -o Vec2i_wrap.o src/osg/Math/Vec2i_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 
g++ -o Vec3i_wrap.o src/osg/Math/Vec3i_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 
g++ -o Vec4i_wrap.o src/osg/Math/Vec4i_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 
g++ -o Vec2f_wrap.o src/osg/Math/Vec2f_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 
g++ -o Vec3f_wrap.o src/osg/Math/Vec3f_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 
g++ -o Vec4f_wrap.o src/osg/Math/Vec4f_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 

g++ -o BufferData_wrap.o src/osg/wrappers/BufferData_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 
g++ -o Camera_wrap.o src/osg/wrappers/Camera_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 
g++ -o DisplaySettings_wrap.o src/osg/wrappers/DisplaySettings_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 
g++ -o Drawable_wrap.o src/osg/wrappers/Drawable_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 
g++ -o Geometry_wrap.o src/osg/wrappers/Geometry_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 
g++ -o Group_wrap.o src/osg/wrappers/Group_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 
g++ -o Image_wrap.o src/osg/wrappers/Image_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 
g++ -o Node_wrap.o src/osg/wrappers/Node_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 
g++ -o Viewer_wrap.o src/osg/wrappers/Viewer_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 

g++ -o Outline_wrap.o src/osg/FX/Outline_wrap.cpp -c -I $INCLUDE_DIR -L $LIB_DIR 

mv *.o build/

echo now compilation
cd build
g++ -o osgoutline \
	BufferData.vala.o  DisplaySettings.vala.o  Effect.vala.o    Group_wrap.o  Node_wrap.o       Transform.vala.o  Vec2i_wrap.o  Vec3i_wrap.o  Vec4i_wrap.o \
	BufferData_wrap.o  DisplaySettings_wrap.o  Geometry.vala.o  Image.vala.o  OSGObject.vala.o  Vec2f.vala.o      Vec3f.vala.o  Vec4f.vala.o  Viewer.vala.o \
	Camera.vala.o      Drawable.vala.o         Geometry_wrap.o  Image_wrap.o  Outline.vala.o    Vec2f_wrap.o      Vec3f_wrap.o  Vec4f_wrap.o  Viewer_wrap.o \
	Camera_wrap.o      Drawable_wrap.o         Group.vala.o     Node.vala.o   Outline_wrap.o    Vec2i.vala.o      Vec3i.vala.o  Vec4i.vala.o \
	osgoutline.vala.o \
	 -I $INCLUDE_DIR -L $LIB_DIR \
	-lglib-2.0 -lgobject-2.0 \
	-l$OSG -l$OSG_FX -l$OSG_DB -l$OSG_VIEWER -l$OPEN_THREADS \
	$FLAGS