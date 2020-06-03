
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
inline void _image_set_image(void* image, int s, int t, int r, 
                            GLint internal_textureformat, GLenum pixel_format, GLenum type, unsigned char* data,
                            int mode,
                            int packing /*=1*/, int row_length /*=0*/)
{
    static_cast<osg::Image*>(image)->setImage(s, t, r, internal_textureformat, pixel_format, type, data, (osg::Image::AllocationMode) packing, row_length);
}

/** Read pixels from current frame buffer at specified position and size, using glReadPixels.
     * Create memory for storage if required, reuse existing pixel coords if possible.
*/
inline void _image_read_pixels(void* image, int x, int y, int width, int height, 
                            GLenum pixel_format, GLenum type, int packing /*=1*/)
{
    static_cast<osg::Image*>(image)->readPixels(x, y, width, height, pixel_format, type, packing);
}

/** Read the contents of the current bound texture, handling compressed pixelFormats if present.
     * Create memory for storage if required, reuse existing pixel coords if possible.
*/
inline void _image_read_image_from_current_texture(void* image, unsigned int context_id, bool copy_mip_maps_if_available, 
                                                    GLenum type /* = GL_UNSIGNED_BYTE*/, unsigned int face /*= 0*/)
{
    static_cast<osg::Image*>(image)->readImageFromCurrentTexture(context_id, copy_mip_maps_if_available, type, face);
}

/** swap the data and settings between two image objects.*/
inline void _image_swap(void* img1, void* img2)
{
    osg::Image* image1 = static_cast<osg::Image*>(img1);
    osg::Image* image2 = static_cast<osg::Image*>(img2);
    image1->swap(*image2);
}

/** Scale image to specified size. */
inline void _image_scale_image(void* image, int s, int t, int r) 
{
    static_cast<osg::Image*>(image)->scaleImage(s, t, r);
}

/** Scale image to specified size and with specified data type. */
inline void _image_scale_image_with_data_type(void* image, int s, int t, int r, GLenum new_data_type) 
{
    static_cast<osg::Image*>(image)->scaleImage(s, t, r, new_data_type);
}

/** Copy a source Image into a subpart of this Image at specified position.
     * Typically used to copy to an already allocated image, such as creating
     * a 3D image from a stack 2D images.
     * If this Image is empty then image data is created to
     * accommodate the source image in its offset position.
     * If source is NULL then no operation happens, this Image is left unchanged.
*/
inline void _image_copy_sub_image(void* image, int s_offset, int t_offset, int r_offset, const void* source)
{
    static_cast<osg::Image*>(image)->copySubImage(s_offset, t_offset, r_offset, static_cast<const osg::Image*>(source));
}

/** Set the origin of the image.
     * The default value is BOTTOM_LEFT and is consistent with OpenGL.
     * TOP_LEFT is used for imagery that follows standard Imagery convention, such as movies,
     * and hasn't been flipped yet.  For such images one much flip the t axis of the tex coords.
     * to handle this origin position. */
inline void _image_set_origin(void* image, int origin) 
{
    static_cast<osg::Image*>(image)->setOrigin((osg::Image::Origin) origin);
}

/** Get the origin of the image.*/
inline int _image_get_origin(void* image)
{
    return static_cast<osg::Image*>(image)->getOrigin();
}

/** Width of image. */
inline int _image_s(void* image) 
{ 
    return static_cast<osg::Image*>(image)->s();
}

/** Height of image. */
inline int _image_t(void* image)
{
    return static_cast<osg::Image*>(image)->t();
}

/** Depth of image. */
inline int _image_r(void* image) 
{ 
    return static_cast<osg::Image*>(image)->r(); 
}

inline void _image_set_row_length(void* image, int length)
{
    static_cast<osg::Image*>(image)->setRowLength(length);
}

inline int _image_get_row_length(void* image) 
{ 
    return static_cast<osg::Image*>(image)->getRowLength(); 
}

inline void _image_set_internal_texture_format(void* image, GLint format)
{
    static_cast<osg::Image*>(image)->setInternalTextureFormat(format);
}

inline GLint _image_get_internal_texture_format(void* image)
{ 
    return static_cast<osg::Image*>(image)->getInternalTextureFormat(); 
}

inline void _image_set_pixel_format(void* image, GLenum format)
{
    static_cast<osg::Image*>(image)->setPixelFormat(format);
}

inline GLenum _image_get_pixel_format(void* image)
{ 
    return static_cast<osg::Image*>(image)->getPixelFormat(); 
}

inline void _image_set_data_type(void* image, GLenum type)
{
    static_cast<osg::Image*>(image)->setDataType(type);
}

inline GLenum _image_get_data_type(void* image)
{ 
    return static_cast<osg::Image*>(image)->getDataType(); 
}

inline void _image_set_packing(void* image, unsigned int packing)
{
    static_cast<osg::Image*>(image)->setPacking(packing);
}

inline unsigned int _image_get_packing(void* image)
{ 
    return static_cast<osg::Image*>(image)->getPacking(); 
}

/** Return true of the pixel format is an OpenGL compressed pixel format.*/
inline bool _image_is_compressed(void* image)
{ 
    return static_cast<osg::Image*>(image)->isCompressed(); 
}

/** Set the pixel aspect ratio, defined as the pixel width divided by the pixel height.*/
inline void _image_set_pixel_aspect_ratio(void* image, float pixel_aspect_ratio)
{
    static_cast<osg::Image*>(image)->setPixelAspectRatio(pixel_aspect_ratio);
}

/** Get the pixel aspect ratio.*/
inline float _image_get_pixel_aspect_ratio(void* image)
{ 
    return static_cast<osg::Image*>(image)->getPixelAspectRatio(); 
}

/** Return the number of bits required for each pixel. */
inline unsigned int _image_get_pixel_size_in_bits(void* image)
{ 
    return static_cast<osg::Image*>(image)->getPixelSizeInBits(); 
}

/** Return the number of bytes each row of pixels occupies once it has been packed. */
inline unsigned int _image_get_row_size_in_bytes(void* image)
{ 
    return static_cast<osg::Image*>(image)->getRowSizeInBytes(); 
}

/** Return the number of bytes between each successive row.
     * Note, getRowSizeInBytes() will only equal getRowStepInBytes() when isDataContiguous() return true. */
inline unsigned int _image_get_row_step_in_bytes(void* image)
{ 
    return static_cast<osg::Image*>(image)->getRowStepInBytes(); 
}

/** Return the number of bytes each image (_s*_t) of pixels occupies. */
inline unsigned int _image_get_image_size_in_bytes(void* image)
{ 
    return static_cast<osg::Image*>(image)->getImageSizeInBytes(); 
}

/** Return the number of bytes between each successive image.
     * Note, getImageSizeInBytes() will only equal getImageStepInBytes() when isDataContiguous() return true. */
inline unsigned int _image_get_image_step_in_bytes(void* image)
{ 
    return static_cast<osg::Image*>(image)->getImageStepInBytes(); 
}

/** Return the number of bytes the whole row/image/volume of pixels occupies. */
inline unsigned int _image_get_total_size_in_bytes(void* image)
{ 
    return static_cast<osg::Image*>(image)->getTotalSizeInBytes(); 
}

/** Return the number of bytes the whole row/image/volume of pixels occupies, including all mip maps if included. */
inline unsigned int _image_get_total_size_in_bytes_including_mipmaps(void* image)
{ 
    return static_cast<osg::Image*>(image)->getTotalSizeInBytesIncludingMipmaps(); 
}

/** Return true if the Image represent a valid and usable imagery.*/
inline bool _image_valid(void* image)
{ 
    return static_cast<osg::Image*>(image)->valid(); 
}

/** Raw image data.
     * Note, data in successive rows may not be contiguous, isDataContiguous() return false then you should
     * take care to access the data per row rather than treating the whole data as a single block. */
inline unsigned char* _image_data(void* image)
{ 
    return static_cast<osg::Image*>(image)->data(); 
}

/** Raw const image data.
     * Note, data in successive rows may not be contiguous, isDataContiguous() return false then you should
     * take care to access the data per row rather than treating the whole data as a single block. */
inline const unsigned char* _image_const_data(void* image)
{ 
    return static_cast<osg::Image*>(image)->data(); 
}

inline unsigned char* _image_data_ext(void* image_ptr, unsigned int column, unsigned int row /*= 0*/, unsigned int image /*= 0*/)
{ 
    return static_cast<osg::Image*>(image_ptr)->data(column, row, image); 
}

inline const unsigned char* _image_const_data_ext(void* image_ptr, unsigned int column, unsigned int row /*= 0*/, unsigned int image /*= 0*/)
{ 
    return static_cast<osg::Image*>(image_ptr)->data(column, row, image); 
}

/** return true if the data stored in the image is a contiguous block of data.*/
inline bool _image_is_data_contiguous(void* image)
{ 
    return static_cast<osg::Image*>(image)->isDataContiguous(); 
}

}