CC=g++
INC=
CFLAGS=-c -Wall
LDFLAGS=-lglib-2.0 -lgobject-2.0 -losg -losgDB -losgFX -losgViewer -lOpenThreads

WRAP_OBJECTS=Vec2i_wrap.o Vec3i_wrap.o Vec4i_wrap.o Vec2f_wrap.o Vec3f_wrap.o Vec4f_wrap.o \
			 Outline_wrap.o \
			 BufferData_wrap.o Camera_wrap.o DisplaySettings_wrap.o \
			 Node_wrap.o Drawable_wrap.o Geometry_wrap.o Group_wrap.o Image_wrap.o Viewer_wrap.o

EXECUTABLE=osgoutline

all: $(WRAP_OBJECTS) $(EXECUTABLE)

clean: 
	rm *.o

#############
# CPP first #
#############

# src/osg/Math/
Vec2i_wrap.o:
	$(CC) $(INC) src/osg/Math/Vec2i_wrap.cpp $(CFLAGS)	
Vec3i_wrap.o:
	$(CC) $(INC) src/osg/Math/Vec3i_wrap.cpp $(CFLAGS)	
Vec4i_wrap.o:
	$(CC) $(INC) src/osg/Math/Vec4i_wrap.cpp $(CFLAGS) 

Vec2f_wrap.o:
	$(CC) $(INC) src/osg/Math/Vec2f_wrap.cpp $(CFLAGS)	
Vec3f_wrap.o:
	$(CC) $(INC) src/osg/Math/Vec3f_wrap.cpp $(CFLAGS) 	
Vec4f_wrap.o:
	$(CC) $(INC) src/osg/Math/Vec4f_wrap.cpp $(CFLAGS) 

#src/osg/FX
Outline_wrap.o:
	$(CC) $(INC) src/osg/FX/Outline_wrap.cpp $(CFLAGS)

#src/osg/wrappers
BufferData_wrap.o:
	$(CC) $(INC) src/osg/wrappers/BufferData_wrap.cpp $(CFLAGS)
Camera_wrap.o:
	$(CC) $(INC) src/osg/wrappers/Camera_wrap.cpp $(CFLAGS)
DisplaySettings_wrap.o:
	$(CC) $(INC) src/osg/wrappers/DisplaySettings_wrap.cpp $(CFLAGS)
Drawable_wrap.o:
	$(CC) $(INC) src/osg/wrappers/Drawable_wrap.cpp $(CFLAGS)
Geometry_wrap.o:
	$(CC) $(INC) src/osg/wrappers/Geometry_wrap.cpp $(CFLAGS)
Group_wrap.o:
	$(CC) $(INC) src/osg/wrappers/Group_wrap.cpp $(CFLAGS)
Image_wrap.o:
	$(CC) $(INC) src/osg/wrappers/Image_wrap.cpp $(CFLAGS)
Node_wrap.o:
	$(CC) $(INC) src/osg/wrappers/Node_wrap.cpp $(CFLAGS)
Viewer_wrap.o:
	$(CC) $(INC) src/osg/wrappers/Viewer_wrap.cpp $(CFLAGS)

#################
# Vala side now #
#################

VALAC=valac
VAPI_DIR='vapi/'
VCFLAGS=-c --vapidir=$(VAPI_DIR) --pkg gl
VALA_SOURCES=src/osg/OSGObject.vala \
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
			src/osgoutline.vala

VALA_OBJECTS=OSGObject.vala.o \
			Vec2i.vala.o \
			Vec3i.vala.o \
			Vec4i.vala.o \
			Vec2f.vala.o \
			Vec3f.vala.o \
			Vec4f.vala.o \
			Effect.vala.o \
			Outline.vala.o \
			BufferData.vala.o \
			Camera.vala.o \
			DisplaySettings.vala.o \
			Drawable.vala.o \
			Geometry.vala.o \
			Group.vala.o \
			Image.vala.o \
			Node.vala.o \
			Transform.vala.o \
			Viewer.vala.o \
			osgoutline.vala.o

vala_side:
	$(VALAC) $(VALA_SOURCES) $(VCFLAGS)

$(EXECUTABLE): $(WRAP_OBJECTS) vala_side
	$(CC) $(WRAP_OBJECTS) $(VALA_OBJECTS) $(LDFLAGS) -o $@
