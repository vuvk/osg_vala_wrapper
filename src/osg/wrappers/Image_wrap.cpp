
#include <GL/gl.h>
#include <osg/Image>


extern "C"
{

inline void* _image_new()
{
    return (void*) new osg::Image();
}

inline void _image_dispose(void* image)
{
    static_cast<osg::Image*>(image)->unref();
}

inline const GLvoid* _image_get_data_pointer(void* image)
{
    return static_cast<osg::Image*>(image)->getDataPointer();
}

inline unsigned int _image_get_total_data_size(void* image)
{
    return static_cast<osg::Image*>(image)->getTotalDataSize();
}

/** Return -1 if *this < *rhs, 0 if *this==*rhs, 1 if *this>*rhs. */
inline int _image_compare(void* img1, void* img2)
{
    osg::Image* image1 = static_cast<osg::Image*>(img1);
    osg::Image* image2 = static_cast<osg::Image*>(img2);
    return image1->compare(*image2);
}

inline void _image_set_file_name(void* image, const char* file_name)
{
    std::string real_name(file_name);
    static_cast<osg::Image*>(image)->setFileName(real_name);
}

inline const char* _image_get_file_name(void* image)
{
    return static_cast<osg::Image*>(image)->getFileName().c_str();
}

inline void _image_set_write_hint(void* image, int write_hint) 
{ 
    static_cast<osg::Image*>(image)->setWriteHint((osg::Image::WriteHint) write_hint);
}

inline int _image_get_write_hint(void* image)
{
    return static_cast<osg::Image*>(image)->getWriteHint();
}

/** Set the method used for deleting data once it goes out of scope. */
inline void _image_set_allocation_mode(void* image, int mode) {
    static_cast<osg::Image*>(image)->setAllocationMode((osg::Image::AllocationMode) mode);
}

/** Get the method used for deleting data once it goes out of scope. */
inline int _image_get_allocation_mode(void* image)
{
    return static_cast<osg::Image*>(image)->getAllocationMode();
}

/** Allocate a pixel block of specified size and type. */
inline void _image_allocate_image(void* image, int s, int t, int r, GLenum pixel_format, GLenum type, int packing /*=1*/)
{
    return static_cast<osg::Image*>(image)->allocateImage(s, t, r, pixel_format, type, packing);
}


/** Set the image dimensions, format and data. */
virtual void setImage(int s,int t,int r,
                GLint internalTextureformat,
                GLenum pixelFormat,GLenum type,
                unsigned char* data,
                AllocationMode mode,
                int packing=1, int rowLength=0);

/** Read pixels from current frame buffer at specified position and size, using glReadPixels.
     * Create memory for storage if required, reuse existing pixel coords if possible.
*/
virtual void readPixels(int x,int y,int width,int height,
                GLenum pixelFormat, GLenum type, int packing=1);


/** Read the contents of the current bound texture, handling compressed pixelFormats if present.
     * Create memory for storage if required, reuse existing pixel coords if possible.
*/
virtual void readImageFromCurrentTexture(unsigned int contextID, bool copyMipMapsIfAvailable, GLenum type = GL_UNSIGNED_BYTE, unsigned int face = 0);

/** swap the data and settings between two image objects.*/
void swap(osg::Image& rhs);

/** Scale image to specified size. */
void scaleImage(int s,int t,int r) { scaleImage(s,t,r, getDataType()); }

/** Scale image to specified size and with specified data type. */
virtual void scaleImage(int s,int t,int r, GLenum newDataType);

/** Copy a source Image into a subpart of this Image at specified position.
     * Typically used to copy to an already allocated image, such as creating
     * a 3D image from a stack 2D images.
     * If this Image is empty then image data is created to
     * accommodate the source image in its offset position.
     * If source is NULL then no operation happens, this Image is left unchanged.
*/
virtual void copySubImage(int s_offset, int t_offset, int r_offset, const osg::Image* source);


enum Origin
{
    BOTTOM_LEFT,
    TOP_LEFT
};

/** Set the origin of the image.
     * The default value is BOTTOM_LEFT and is consistent with OpenGL.
     * TOP_LEFT is used for imagery that follows standard Imagery convention, such as movies,
     * and hasn't been flipped yet.  For such images one much flip the t axis of the tex coords.
     * to handle this origin position. */
void setOrigin(Origin origin) { _origin = origin; }

/** Get the origin of the image.*/
Origin getOrigin() const { return _origin; }


/** Width of image. */
inline int s() const { return _s; }

/** Height of image. */
inline int t() const { return _t; }

/** Depth of image. */
inline int r() const { return _r; }

void setRowLength(int length);
inline int getRowLength() const { return _rowLength; }

void setInternalTextureFormat(GLint internalFormat);
inline GLint getInternalTextureFormat() const { return _internalTextureFormat; }

void setPixelFormat(GLenum pixelFormat);
inline GLenum getPixelFormat() const { return _pixelFormat; }

void setDataType(GLenum dataType);
inline GLenum getDataType() const { return _dataType; }

void setPacking(unsigned int packing) { _packing = packing; }
inline unsigned int getPacking() const { return _packing; }

/** Return true of the pixel format is an OpenGL compressed pixel format.*/
bool isCompressed() const;

/** Set the pixel aspect ratio, defined as the pixel width divided by the pixel height.*/
inline void setPixelAspectRatio(float pixelAspectRatio) { _pixelAspectRatio = pixelAspectRatio; }

/** Get the pixel aspect ratio.*/
inline float getPixelAspectRatio() const { return _pixelAspectRatio; }

/** Return the number of bits required for each pixel. */
inline unsigned int getPixelSizeInBits() const { return computePixelSizeInBits(_pixelFormat,_dataType); }

/** Return the number of bytes each row of pixels occupies once it has been packed. */
inline unsigned int getRowSizeInBytes() const { return computeRowWidthInBytes(_s,_pixelFormat,_dataType,_packing); }

/** Return the number of bytes between each successive row.
     * Note, getRowSizeInBytes() will only equal getRowStepInBytes() when isDataContiguous() return true. */
inline unsigned int getRowStepInBytes() const { return computeRowWidthInBytes(_rowLength==0?_s:_rowLength,_pixelFormat,_dataType,_packing); }

/** Return the number of bytes each image (_s*_t) of pixels occupies. */
inline unsigned int getImageSizeInBytes() const { return getRowSizeInBytes()*_t; }

/** Return the number of bytes between each successive image.
     * Note, getImageSizeInBytes() will only equal getImageStepInBytes() when isDataContiguous() return true. */
inline unsigned int getImageStepInBytes() const { return getRowStepInBytes()*_t; }

/** Return the number of bytes the whole row/image/volume of pixels occupies. */
inline unsigned int getTotalSizeInBytes() const { return getImageSizeInBytes()*_r; }

/** Return the number of bytes the whole row/image/volume of pixels occupies, including all mip maps if included. */
unsigned int getTotalSizeInBytesIncludingMipmaps() const;

/** Return true if the Image represent a valid and usable imagery.*/
bool valid() const { return _s!=0 && _t!=0 && _r!=0 && _data!=0 && _dataType!=0; }

/** Raw image data.
     * Note, data in successive rows may not be contiguous, isDataContiguous() return false then you should
     * take care to access the data per row rather than treating the whole data as a single block. */
inline unsigned char* data() { return _data; }

/** Raw const image data.
     * Note, data in successive rows may not be contiguous, isDataContiguous() return false then you should
     * take care to access the data per row rather than treating the whole data as a single block. */
inline const unsigned char* data() const { return _data; }

inline unsigned char* data(unsigned int column, unsigned int row = 0, unsigned int image = 0)
{
    if (!_data) return NULL;
    return _data+(column*getPixelSizeInBits())/8+row*getRowStepInBytes()+image*getImageSizeInBytes();
}

inline const unsigned char* data(unsigned int column, unsigned int row = 0, unsigned int image = 0) const
{
    if (!_data) return NULL;
    return _data+(column*getPixelSizeInBits())/8+row*getRowStepInBytes()+image*getImageSizeInBytes();
}

/** return true if the data stored in the image is a contiguous block of data.*/
bool isDataContiguous() const { return _rowLength==0 || _rowLength==_s; }

}