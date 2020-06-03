
#include <GL/gl.h>
#include <osg/Image>

extern "C"
{

void* _image_new()
{
    return (void*) new osg::Image();
}

void _image_dispose(void* image)
{
    static_cast<osg::Image*>(image)->unref();
}

const GLvoid* _image_get_data_pointer(void* image)
{
    return static_cast<osg::Image*>(image)->getDataPointer();
}

unsigned int _image_get_total_data_size(void* image)
{
    return static_cast<osg::Image*>(image)->getTotalDataSize();
}

/** Return -1 if *this < *rhs, 0 if *this==*rhs, 1 if *this>*rhs. */
int _image_compare(void* img1, void* img2)
{
    osg::Image* image1 = static_cast<osg::Image*>(img1);
    osg::Image* image2 = static_cast<osg::Image*>(img2);
    return image1->compare(*image2);
}

void _image_set_file_name(void* image, const char* file_name)
{
    std::string real_name(file_name);
    static_cast<osg::Image*>(image)->setFileName(real_name);
}

const char* _image_get_file_name(void* image)
{
    return static_cast<osg::Image*>(image)->getFileName().c_str();
}

void _image_set_write_hint(void* image, int write_hint) 
{ 
    static_cast<osg::Image*>(image)->setWriteHint((osg::Image::WriteHint) write_hint);
}

int _image_get_write_hint(void* image)
{
    return static_cast<osg::Image*>(image)->getWriteHint();
}

/** Set the method used for deleting data once it goes out of scope. */
void _image_set_allocation_mode(void* image, int mode) 
{
    static_cast<osg::Image*>(image)->setAllocationMode((osg::Image::AllocationMode) mode);
}

/** Get the method used for deleting data once it goes out of scope. */
int _image_get_allocation_mode(void* image)
{
    return static_cast<osg::Image*>(image)->getAllocationMode();
}

/** Allocate a pixel block of specified size and type. */
void _image_allocate_image(void* image, int s, int t, int r, GLenum pixel_format, GLenum type, int packing /*=1*/)
{
    return static_cast<osg::Image*>(image)->allocateImage(s, t, r, pixel_format, type, packing);
}

/** Set the image dimensions, format and data. */
void _image_set_image(void* image, int s, int t, int r, 
                            GLint internal_textureformat, GLenum pixel_format, GLenum type, unsigned char* data,
                            int mode,
                            int packing /*=1*/, int row_length /*=0*/)
{
    static_cast<osg::Image*>(image)->setImage(s, t, r, internal_textureformat, pixel_format, type, data, (osg::Image::AllocationMode) packing, row_length);
}

/** Read pixels from current frame buffer at specified position and size, using glReadPixels.
     * Create memory for storage if required, reuse existing pixel coords if possible.
*/
void _image_read_pixels(void* image, int x, int y, int width, int height, 
                            GLenum pixel_format, GLenum type, int packing /*=1*/)
{
    static_cast<osg::Image*>(image)->readPixels(x, y, width, height, pixel_format, type, packing);
}

/** Read the contents of the current bound texture, handling compressed pixel_formats if present.
     * Create memory for storage if required, reuse existing pixel coords if possible.
*/
void _image_read_image_from_current_texture(void* image, unsigned int context_id, bool copy_mip_maps_if_available, 
                                                    GLenum type /* = GL_UNSIGNED_BYTE*/, unsigned int face /*= 0*/)
{
    static_cast<osg::Image*>(image)->readImageFromCurrentTexture(context_id, copy_mip_maps_if_available, type, face);
}

/** swap the data and settings between two image objects.*/
void _image_swap(void* img1, void* img2)
{
    osg::Image* image1 = static_cast<osg::Image*>(img1);
    osg::Image* image2 = static_cast<osg::Image*>(img2);
    image1->swap(*image2);
}

/** Scale image to specified size. */
void _image_scale_image(void* image, int s, int t, int r) 
{
    static_cast<osg::Image*>(image)->scaleImage(s, t, r);
}

/** Scale image to specified size and with specified data type. */
void _image_scale_image_with_data_type(void* image, int s, int t, int r, GLenum new_data_type) 
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
void _image_copy_sub_image(void* image, int s_offset, int t_offset, int r_offset, const void* source)
{
    static_cast<osg::Image*>(image)->copySubImage(s_offset, t_offset, r_offset, static_cast<const osg::Image*>(source));
}

/** Set the origin of the image.
     * The default value is BOTTOM_LEFT and is consistent with OpenGL.
     * TOP_LEFT is used for imagery that follows standard Imagery convention, such as movies,
     * and hasn't been flipped yet.  For such images one much flip the t axis of the tex coords.
     * to handle this origin position. */
void _image_set_origin(void* image, int origin) 
{
    static_cast<osg::Image*>(image)->setOrigin((osg::Image::Origin) origin);
}

/** Get the origin of the image.*/
int _image_get_origin(void* image)
{
    return static_cast<osg::Image*>(image)->getOrigin();
}

/** Width of image. */
int _image_s(void* image) 
{ 
    return static_cast<osg::Image*>(image)->s();
}

/** Height of image. */
int _image_t(void* image)
{
    return static_cast<osg::Image*>(image)->t();
}

/** Depth of image. */
int _image_r(void* image) 
{ 
    return static_cast<osg::Image*>(image)->r(); 
}

void _image_set_row_length(void* image, int length)
{
    static_cast<osg::Image*>(image)->setRowLength(length);
}

int _image_get_row_length(void* image) 
{ 
    return static_cast<osg::Image*>(image)->getRowLength(); 
}

void _image_set_internal_texture_format(void* image, GLint format)
{
    static_cast<osg::Image*>(image)->setInternalTextureFormat(format);
}

GLint _image_get_internal_texture_format(void* image)
{ 
    return static_cast<osg::Image*>(image)->getInternalTextureFormat(); 
}

void _image_set_pixel_format(void* image, GLenum format)
{
    static_cast<osg::Image*>(image)->setPixelFormat(format);
}

GLenum _image_get_pixel_format(void* image)
{ 
    return static_cast<osg::Image*>(image)->getPixelFormat(); 
}

void _image_set_data_type(void* image, GLenum type)
{
    static_cast<osg::Image*>(image)->setDataType(type);
}

GLenum _image_get_data_type(void* image)
{ 
    return static_cast<osg::Image*>(image)->getDataType(); 
}

void _image_set_packing(void* image, unsigned int packing)
{
    static_cast<osg::Image*>(image)->setPacking(packing);
}

unsigned int _image_get_packing(void* image)
{ 
    return static_cast<osg::Image*>(image)->getPacking(); 
}

/** Return true of the pixel format is an OpenGL compressed pixel format.*/
bool _image_is_compressed(void* image)
{ 
    return static_cast<osg::Image*>(image)->isCompressed(); 
}

/** Set the pixel aspect ratio, defined as the pixel width divided by the pixel height.*/
void _image_set_pixel_aspect_ratio(void* image, float pixel_aspect_ratio)
{
    static_cast<osg::Image*>(image)->setPixelAspectRatio(pixel_aspect_ratio);
}

/** Get the pixel aspect ratio.*/
float _image_get_pixel_aspect_ratio(void* image)
{ 
    return static_cast<osg::Image*>(image)->getPixelAspectRatio(); 
}

/** Return the number of bits required for each pixel. */
unsigned int _image_get_pixel_size_in_bits(void* image)
{ 
    return static_cast<osg::Image*>(image)->getPixelSizeInBits(); 
}

/** Return the number of bytes each row of pixels occupies once it has been packed. */
unsigned int _image_get_row_size_in_bytes(void* image)
{ 
    return static_cast<osg::Image*>(image)->getRowSizeInBytes(); 
}

/** Return the number of bytes between each successive row.
     * Note, getRowSizeInBytes() will only equal getRowStepInBytes() when isDataContiguous() return true. */
unsigned int _image_get_row_step_in_bytes(void* image)
{ 
    return static_cast<osg::Image*>(image)->getRowStepInBytes(); 
}

/** Return the number of bytes each image (_s*_t) of pixels occupies. */
unsigned int _image_get_image_size_in_bytes(void* image)
{ 
    return static_cast<osg::Image*>(image)->getImageSizeInBytes(); 
}

/** Return the number of bytes between each successive image.
     * Note, getImageSizeInBytes() will only equal getImageStepInBytes() when isDataContiguous() return true. */
unsigned int _image_get_image_step_in_bytes(void* image)
{ 
    return static_cast<osg::Image*>(image)->getImageStepInBytes(); 
}

/** Return the number of bytes the whole row/image/volume of pixels occupies. */
unsigned int _image_get_total_size_in_bytes(void* image)
{ 
    return static_cast<osg::Image*>(image)->getTotalSizeInBytes(); 
}

/** Return the number of bytes the whole row/image/volume of pixels occupies, including all mip maps if included. */
unsigned int _image_get_total_size_in_bytes_including_mipmaps(void* image)
{ 
    return static_cast<osg::Image*>(image)->getTotalSizeInBytesIncludingMipmaps(); 
}

/** Return true if the Image represent a valid and usable imagery.*/
bool _image_valid(void* image)
{ 
    return static_cast<osg::Image*>(image)->valid(); 
}

/** Raw image data.
     * Note, data in successive rows may not be contiguous, isDataContiguous() return false then you should
     * take care to access the data per row rather than treating the whole data as a single block. */
unsigned char* _image_data(void* image)
{ 
    return static_cast<osg::Image*>(image)->data(); 
}

/** Raw const image data.
     * Note, data in successive rows may not be contiguous, isDataContiguous() return false then you should
     * take care to access the data per row rather than treating the whole data as a single block. */
const unsigned char* _image_const_data(void* image)
{ 
    return static_cast<osg::Image*>(image)->data(); 
}

unsigned char* _image_data_ext(void* image_ptr, unsigned int column, unsigned int row /*= 0*/, unsigned int image /*= 0*/)
{ 
    return static_cast<osg::Image*>(image_ptr)->data(column, row, image); 
}

const unsigned char* _image_const_data_ext(void* image_ptr, unsigned int column, unsigned int row /*= 0*/, unsigned int image /*= 0*/)
{ 
    return static_cast<osg::Image*>(image_ptr)->data(column, row, image); 
}

/** return true if the data stored in the image is a contiguous block of data.*/
bool _image_is_data_contiguous(void* image)
{ 
    return static_cast<osg::Image*>(image)->isDataContiguous(); 
}

/** Get the color value for specified texcoord.*/
void* _image_get_color(void* image, unsigned int s, unsigned t /*=0*/, unsigned r/*=0*/)
{
    return new osg::Vec4f(static_cast<osg::Image*>(image)->getColor(s, t, r));
}

/** Set the color value for specified texcoord.*/
void _image_set_color(void* image, void* color, unsigned int s, unsigned int t/*=0*/, unsigned int r/*=0*/)
{
    const osg::Vec4f* vec = static_cast<osg::Vec4f*>(color);
    static_cast<osg::Image*>(image)->setColor(*vec, s, t, r);
}

/** Flip the image horizontally, around s dimension. */
void _image_flip_horizontal(void* image)
{
    static_cast<osg::Image*>(image)->flipHorizontal();
}

/** Flip the image vertically, around t dimension. */
void _image_flip_vertical(void* image)
{
    static_cast<osg::Image*>(image)->flipVertical();
}

/** Flip the image around the r dimension. Only relevant for 3D textures. */
void _image_flip_depth(void* image)
{
    static_cast<osg::Image*>(image)->flipDepth();
}

/** Ensure image dimensions are a power of two.
     * Mipmapped textures require the image dimensions to be
     * power of two and are within the maximum texture size for
     * the host machine.
*/
void _image_ensure_valid_size_for_texturing(void* image, GLint max_texture_size)
{
    static_cast<osg::Image*>(image)->ensureValidSizeForTexturing(max_texture_size);
}

/*static*/ bool _image_is_packed_type(GLenum type)
{
    return osg::Image::isPackedType(type);
}

/*static*/ GLenum _image_compute_pixel_format(GLenum format)
{
    return osg::Image::computePixelFormat(format);
}

/*static*/ GLenum _image_compute_format_data_type(GLenum format)
{
    return osg::Image::computeFormatDataType(format);
}

/** return the dimensions of a block of compressed pixels */
/*static*/ void* _image_compute_block_footprint(GLenum pixel_format)
{
    return new osg::Vec3i(osg::Image::computeBlockFootprint(pixel_format));;
}

/** return the size in bytes of a block of compressed pixels */
/*static*/ unsigned int _image_compute_block_size(GLenum pixel_format, GLenum packing)
{
    return osg::Image::computeBlockSize(pixel_format, packing);
}

/*static*/ unsigned int _image_compute_num_components(GLenum pixel_format)
{
    return osg::Image::computeNumComponents(pixel_format);
}

/*static*/ unsigned int _image_compute_pixel_size_in_bits(GLenum pixel_format, GLenum type)
{
    return osg::Image::computePixelSizeInBits(pixel_format, type);
}

/*static*/ unsigned int _image_compute_row_width_in_bytes(int width, GLenum pixel_format, GLenum type, int packing)
{
    return osg::Image::computeRowWidthInBytes(width, pixel_format, type, packing);
}

/*static*/ unsigned int _image_compute_image_size_in_bytes(int width, int height, int depth, GLenum pixel_format, GLenum type, 
                                                           int packing /*= 1*/, int slice_packing /*= 1*/, int image_packing /*= 1*/)
{
    return osg::Image::computeImageSizeInBytes(width, height, depth, pixel_format, type, packing, slice_packing, image_packing);
}

/*static*/ int _image_roud_up_to_multiple(int s, int pack)
{
    return osg::Image::roudUpToMultiple(s, pack);
}

/*static*/ int _image_compute_nearest_power_of_two(int s, float bias/*=0.5f*/)
{
    return osg::Image::computeNearestPowerOfTwo(s, bias);
}

/*static*/ int _image_compute_number_of_mipmap_levels(int s, int t /*= 1*/, int r /*= 1*/)
{
    return osg::Image::computeNumberOfMipmapLevels(s, t, r);
}

bool _image_is_mipmap(void* image)
{
    return static_cast<osg::Image*>(image)->isMipmap();
}

unsigned int _image_get_num_mipmap_levels(void* image)
{
    return static_cast<osg::Image*>(image)->getNumMipmapLevels();    
}

/** Send offsets into data. It is assumed that first mipmap offset (index 0) is 0.*/
void _image_set_mipmap_levels(void* image, const unsigned int* mipmap_data_vector, int length) 
{ 
    osg::Image::MipmapDataType vector;
    for (int i = 0; i < length; ++i) 
    {
        vector.push_back(mipmap_data_vector[i]);
    }
    static_cast<osg::Image*>(image)->setMipmapLevels(vector);
}

void _image_get_mipmap_levels(void* image, unsigned int* mipmap_data_vector, int* length)
{
    osg::Image::MipmapDataType vector = static_cast<osg::Image*>(image)->getMipmapLevels();
    *length = vector.size();
    mipmap_data_vector = new unsigned int[vector.size()];
    for (int i = 0; i < *length; ++i)
    {
        mipmap_data_vector[i] = vector.data()[i];
    }
}

unsigned int _image_get_mipmap_offset(void* image, unsigned int mipmap_level)
{
    return static_cast<osg::Image*>(image)->getMipmapOffset(mipmap_level);
}

unsigned char* _image_get_mipmap_data(void* image, unsigned int mipmap_level)
{
    return static_cast<osg::Image*>(image)->getMipmapData(mipmap_level);
}

const unsigned char* _image_get_const_mipmap_data(void* image, unsigned int mipmap_level)
{
    return static_cast<osg::Image*>(image)->getMipmapData(mipmap_level);
}

/** returns false for texture formats that do not support texture subloading */
bool _image_supports_texture_subloading(void* image)
{
    return static_cast<osg::Image*>(image)->supportsTextureSubloading();
}

/** Return true if this image is translucent - i.e. it has alpha values that are less 1.0 (when normalized). */
bool _image_is_image_translucent(void* image)
{
    return static_cast<osg::Image*>(image)->isImageTranslucent();
}

/** Set the optional PixelBufferObject used to map the image memory efficiently to graphics memory. */
void _image_set_pixel_buffer_object(void* image, void* buffer)
{
    static_cast<osg::Image*>(image)->setPixelBufferObject(static_cast<osg::PixelBufferObject*>(buffer));
}

/** Get the PixelBufferObject.*/
void* _image_get_pixel_buffer_object(void* image)
{
    return static_cast<osg::Image*>(image)->getPixelBufferObject();
}

/** Get the const PixelBufferObject.*/
const void* _image_get_const_pixel_buffer_object(void* image)
{
    return static_cast<osg::Image*>(image)->getPixelBufferObject();
}

}