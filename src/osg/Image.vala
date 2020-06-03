
using GL;

extern void* _image_new();
extern void  _image_dispose(void* image);
extern GLvoid* _image_get_data_pointer(void* image);
extern uint  _image_get_total_data_size(void* image);
extern int   _image_compare(void* img1, void* img2);
extern void  _image_set_file_name(void* image, [CCode (array_length = false)] string file_name);
extern unowned string _image_get_file_name(void* image);
extern void  _image_set_write_hint(void* image, int write_hint) ;
extern int   _image_get_write_hint(void* image);
extern void  _image_set_allocation_mode(void* image, int mode);
extern int   _image_get_allocation_mode(void* image);
extern void  _image_allocate_image(void* image, int s, int t, int r, GLenum pixel_format, GLenum type, int packing /*=1*/);
extern void  _image_set_image(void* image, int s, int t, int r, 
                            GLint internal_textureformat, GLenum pixel_format, GLenum type, [CCode (array_length = false)] uint8[] data,
                            int mode,
                            int packing /*=1*/, int row_length /*=0*/);
extern void  _image_read_pixels(void* image, int x, int y, int width, int height, 
                            GLenum pixel_format, GLenum type, int packing /*=1*/);
extern void  _image_read_image_from_current_texture(void* image, uint context_id, bool copy_mip_maps_if_available, 
                                                    GLenum type /* = GL_UNSIGNED_BYTE*/, uint face /*= 0*/);
extern void  _image_swap(void* img1, void* img2);
extern void  _image_scale_image(void* image, int s, int t, int r);
extern void  _image_scale_image_with_data_type(void* image, int s, int t, int r, GLenum new_data_type);
extern void  _image_copy_sub_image(void* image, int s_offset, int t_offset, int r_offset, [CCode (array_length = false)] uint8[] source);
extern void  _image_set_origin(void* image, int origin);
extern int   _image_get_origin(void* image);
extern int   _image_s(void* image);
extern int   _image_t(void* image);
extern int   _image_r(void* image);
extern void  _image_set_row_length(void* image, int length);
extern int   _image_get_row_length(void* image) ;
extern void  _image_set_internal_texture_format(void* image, GLint format);
extern GLint _image_get_internal_texture_format(void* image);
extern void  _image_set_pixel_format(void* image, GLenum format);
extern GLenum _image_get_pixel_format(void* image);
extern void  _image_set_data_type(void* image, GLenum type);
extern GLenum _image_get_data_type(void* image);
extern void  _image_set_packing(void* image, uint packing);
extern uint  _image_get_packing(void* image);
extern bool  _image_is_compressed(void* image);
extern void  _image_set_pixel_aspect_ratio(void* image, float pixel_aspect_ratio);
extern float _image_get_pixel_aspect_ratio(void* image);
extern uint  _image_get_pixel_size_in_bits(void* image);
extern uint  _image_get_row_size_in_bytes(void* image);
extern uint  _image_get_row_step_in_bytes(void* image);
extern uint  _image_get_image_size_in_bytes(void* image);
extern uint  _image_get_image_step_in_bytes(void* image);
extern uint  _image_get_total_size_in_bytes(void* image);
extern uint  _image_get_total_size_in_bytes_including_mipmaps(void* image);
extern bool  _image_valid(void* image);
[CCode (array_length = false)]
extern uint8[] _image_data(void* image);
[CCode (array_length = false)]
extern uint8[] _image_data_ext(void* image_ptr, uint column, uint row /*= 0*/, uint image /*= 0*/);
extern bool  _image_is_data_contiguous(void* image);
/** Get the color value for specified texcoord.*/
extern void* _image_get_color(void* image, uint s, uint t /*=0*/, uint r/*=0*/);
/** Set the color value for specified texcoord.*/
extern void _image_set_color(void* image, void* color, uint s, uint t/*=0*/, uint r/*=0*/);
/** Flip the image horizontally, around s dimension. */
extern void _image_flip_horizontal(void* image);
/** Flip the image vertically, around t dimension. */
extern void _image_flip_vertical(void* image);
/** Flip the image around the r dimension. Only relevant for 3D textures. */
extern void _image_flip_depth(void* image);
/** Ensure image dimensions are a power of two.
     * Mipmapped textures require the image dimensions to be
     * power of two and are within the maximum texture size for
     * the host machine.
*/
extern void _image_ensure_valid_size_for_texturing(void* image, GLint max_texture_size);
extern /*static*/ bool _image_is_packed_type(GLenum type);
extern /*static*/ GLenum _image_compute_pixel_format(GLenum format);
extern /*static*/ GLenum _image_compute_format_data_type(GLenum format);
extern /** return the dimensions of a block of compressed pixels */
extern /*static*/ void* _image_compute_block_footprint(GLenum pixel_format);
extern /** return the size in bytes of a block of compressed pixels */
extern /*static*/ uint _image_compute_block_size(GLenum pixel_format, GLenum packing);
extern /*static*/ uint _image_compute_num_components(GLenum pixel_format);
extern /*static*/ uint _image_compute_pixel_size_in_bits(GLenum pixel_format, GLenum type);
extern /*static*/ uint _image_compute_row_width_in_bytes(int width, GLenum pixel_format, GLenum type, int packing);
extern /*static*/ uint _image_compute_image_size_in_bytes(int width, int height, int depth, GLenum pixel_format, GLenum type, int packing /*= 1*/, int slice_packing /*= 1*/, int image_packing /*= 1*/);
extern /*static*/ int _image_roud_up_to_multiple(int s, int pack);
extern /*static*/ int _image_compute_nearest_power_of_two(int s, float bias/*=0.5f*/);
extern /*static*/ int _image_compute_number_of_mipmap_levels(int s, int t /*= 1*/, int r /*= 1*/);
extern bool _image_is_mipmap(void* image);
extern uint _image_get_num_mipmap_levels(void* image);
/** Send offsets into data. It is assumed that first mipmap offset (index 0) is 0.*/
extern void _image_set_mipmap_levels(void* image, uint[] mipmap_data_vector);
extern void _image_get_mipmap_levels(void* image, [CCode (array_length = false)] uint[] mipmap_data_vector, int* length);
extern uint _image_get_mipmap_offset(void* image, uint mipmap_level);
[CCode (array_length = false)]
extern uint8[] _image_get_mipmap_data(void* image, uint mipmap_level);
/** returns false for texture formats that do not support texture subloading */
extern bool _image_supports_texture_subloading(void* image);
/** Return true if this image is translucent - i.e. it has alpha values that are less 1.0 (when normalized). */
extern bool _image_is_image_translucent(void* image);
/** Set the optional PixelBufferObject used to map the image memory efficiently to graphics memory. */
extern void _image_set_pixel_buffer_object(void* image, void* buffer);
/** Get the PixelBufferObject.*/
extern void* _image_get_pixel_buffer_object(void* image);


public class Image : BufferData {

    protected Image.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public Image() {
        this.from_handle(_image_new());
    }

    protected override void dispose_handle () {
        _image_dispose(handle);
    }

    ~Image() {
        base.dispose();
    }

    public GLvoid* get_data_pointer() {
        return _image_get_data_pointer(handle);
    }

    public uint get_total_data_size() {
        return _image_get_total_data_size(handle);
    }

    /** Return -1 if *this < *rhs, 0 if *this==*rhs, 1 if *this>*rhs. */
    public int compare(Image image) {
        return _image_compare(handle, image.handle);
    }

    public void set_file_name(string file_name) {
        _image_set_file_name(handle, file_name);
    }

    public unowned string get_file_name() {
        return _image_get_file_name(handle);
    }
    
    public enum WriteHint {
        NO_PREFERENCE,
        STORE_INLINE,
        EXTERNAL_FILE
    }

    public void set_write_hint(WriteHint write_hint)  {
        _image_set_write_hint(handle, write_hint);
    }

    public WriteHint get_write_hint() {
        return (WriteHint) _image_get_write_hint(handle);
    }
    
    public enum AllocationMode {
        NO_DELETE,
        USE_NEW_DELETE,
        USE_MALLOC_FREE
    }

    /** Set the method used for deleting data once it goes out of scope. */
    public void set_allocation_mode(AllocationMode mode) {
        _image_set_allocation_mode(handle, mode);
    }

    /** Get the method used for deleting data once it goes out of scope. */
    public AllocationMode get_allocation_mode() {
        return (AllocationMode) _image_get_allocation_mode(handle);
    }

    /** Allocate a pixel block of specified size and type. */
    public void allocate_image(int s, int t, int r, GLenum pixel_format, GLenum type, int packing = 1) {
        _image_allocate_image(handle, s, t, r, pixel_format, type, packing);
    }

    /** Set the image dimensions, format and data. */
    public void set_image(int s, int t, int r, 
                        GLint internal_textureformat, GLenum pixel_format, GLenum type, uint8[] data,
                        AllocationMode mode,
                        int packing = 1, int row_length = 0) {
        _image_set_image(handle, s, t, r, internal_textureformat, pixel_format, type, data, mode, packing, row_length);
    }

    /** Read pixels from current frame buffer at specified position and size, using glReadPixels.
        * Create memory for storage if required, reuse existing pixel coords if possible.
    */
    public void read_pixels(int x, int y, int width, int height, 
                            GLenum pixel_format, GLenum type, int packing = 1) {
        _image_read_pixels(handle, x, y, width, height, pixel_format, type, packing);
    }

    /** Read the contents of the current bound texture, handling compressed pixelFormats if present.
        * Create memory for storage if required, reuse existing pixel coords if possible.
    */
    public void read_image_from_current_texture(uint context_id, bool copy_mip_maps_if_available, 
                                        GLenum type = GL_UNSIGNED_BYTE, uint face = 0) {
        _image_read_image_from_current_texture(handle, context_id,copy_mip_maps_if_available, type, face);            
    }

    /** swap the data and settings between two image objects.*/
    public void swap(Image image) {
        _image_swap(handle, image.handle);
    }

    /** Scale image to specified size. */
    public void scale_image(int s, int t, int r) {
        _image_scale_image(handle, s, t, r);
    }

    /** Scale image to specified size and with specified data type. */
    public void scale_image_with_data_type(int s, int t, int r, GLenum new_data_type) {
        _image_scale_image_with_data_type(handle, s, t, r, new_data_type);
    }

    /** Copy a source Image into a subpart of this Image at specified position.
        * Typically used to copy to an already allocated image, such as creating
        * a 3D image from a stack 2D images.
        * If this Image is empty then image data is created to
        * accommodate the source image in its offset position.
        * If source is NULL then no operation happens, this Image is left unchanged.
    */
    public void copy_sub_image(int s_offset, int t_offset, int r_offset, uint8[] source) {
        _image_copy_sub_image(handle, s_offset, t_offset, r_offset, source);
    }
    
    public enum Origin {
        BOTTOM_LEFT,
        TOP_LEFT
    }

    /** Set the origin of the image.
        * The default value is BOTTOM_LEFT and is consistent with OpenGL.
        * TOP_LEFT is used for imagery that follows standard Imagery convention, such as movies,
        * and hasn't been flipped yet.  For such images one much flip the t axis of the tex coords.
        * to handle this origin position. */
    public void set_origin(Origin origin) {
        _image_set_origin(handle, origin);
    }

    /** Get the origin of the image.*/
    public int get_origin() {
        return (Origin) _image_get_origin(handle);
    }

    /** Width of image. */
    public int s() {
        return _image_s(handle);
    }

    /** Height of image. */
    public int t() {
        return _image_t(handle);
    }

    /** Depth of image. */
    public int r() {
        return _image_r(handle);
    }

    public void set_row_length(int length) {
        _image_set_row_length(handle, length);
    }

    public int get_row_length()  {
        return _image_get_row_length(handle);
    }

    public void set_internal_texture_format(GLint format) {
        _image_set_internal_texture_format(handle, format);
    }

    public GLint get_internal_texture_format() {
        return _image_get_internal_texture_format(handle);
    }

    public void set_pixel_format(GLenum format) {
        _image_set_pixel_format(handle, format);
    }

    public GLenum get_pixel_format() {
        return _image_get_pixel_format(handle);
    }

    public void set_data_type(GLenum type) {
        _image_set_data_type(handle, type);
    }

    public GLenum get_data_type() {
        return _image_get_data_type(handle);
    }

    public void set_packing(uint packing) {
        _image_set_packing(handle, packing);
    }

    public uint get_packing() {
        return _image_get_packing(handle);
    }

    /** Return true of the pixel format is an OpenGL compressed pixel format.*/
    public bool is_compressed() {
        return _image_is_compressed(handle);
    }

    /** Set the pixel aspect ratio, defined as the pixel width divided by the pixel height.*/
    public void set_pixel_aspect_ratio(float pixel_aspect_ratio) {
        _image_set_pixel_aspect_ratio(handle, pixel_aspect_ratio);
    }

    /** Get the pixel aspect ratio.*/
    public float get_pixel_aspect_ratio() {
        return _image_get_pixel_aspect_ratio(handle);
    }

    /** Return the number of bits required for each pixel. */
    public uint get_pixel_size_in_bits() {
        return _image_get_pixel_size_in_bits(handle);
    }

    /** Return the number of bytes each row of pixels occupies once it has been packed. */
    public uint get_row_size_in_bytes() {
        return _image_get_row_size_in_bytes(handle);
    }

    /** Return the number of bytes between each successive row.
        * Note, getRowSizeInBytes() will only equal getRowStepInBytes() when isDataContiguous() return true. */
    public uint get_row_step_in_bytes() {
        return _image_get_row_step_in_bytes(handle);
    }

    /** Return the number of bytes each image (_s*_t) of pixels occupies. */
    public uint get_image_size_in_bytes() {
        return _image_get_image_size_in_bytes(handle);
    }

    /** Return the number of bytes between each successive image.
        * Note, getImageSizeInBytes() will only equal getImageStepInBytes() when isDataContiguous() return true. */
    public uint get_image_step_in_bytes() {
        return _image_get_image_step_in_bytes(handle);
    }

    /** Return the number of bytes the whole row/image/volume of pixels occupies. */
    public uint get_total_size_in_bytes() {
        return _image_get_total_size_in_bytes(handle);
    }

    /** Return the number of bytes the whole row/image/volume of pixels occupies, including all mip maps if included. */
    public uint get_total_size_in_bytes_including_mipmaps() {
        return _image_get_total_size_in_bytes_including_mipmaps(handle);
    }

    /** Return true if the Image represent a valid and usable imagery.*/
    public bool valid() {
        return _image_valid(handle);
    }

    /** Raw image data.
        * Note, data in successive rows may not be contiguous, isDataContiguous() return false then you should
        * take care to access the data per row rather than treating the whole data as a single block. */
    public uint8[] data() {
        return _image_data(handle);
    }

    public uint8[] data_ext(uint column, uint row = 0, uint image = 0) {
        return _image_data_ext(handle, column, row, image);
    }

    /** return true if the data stored in the image is a contiguous block of data.*/
    public bool is_data_contiguous() {
        return _image_is_data_contiguous(handle);
    }

    /** Get the color value for specified texcoord.*/
    public Vec4f get_color(uint s, uint t = 0, uint r = 0) {
        return new Vec4f.from_handle(_image_get_color(handle, s, t, r));
    }

    /** Set the color value for specified texcoord.*/
    public void set_color(Vec4f color, uint s, uint t = 0, uint r = 0) {
        _image_set_color(handle, color.handle, s, t, r);
    }

    /** Flip the image horizontally, around s dimension. */
    public void flip_horizontal() {
        _image_flip_horizontal(handle);
    }

    /** Flip the image vertically, around t dimension. */
    public void flip_vertical() {
        _image_flip_vertical(handle);
    }

    /** Flip the image around the r dimension. Only relevant for 3D textures. */
    public void flip_depth() {
        _image_flip_depth(handle);
    }

    /** Ensure image dimensions are a power of two.
        * Mipmapped textures require the image dimensions to be
        * power of two and are within the maximum texture size for
        * the host machine.
    */
    public void ensure_valid_size_for_texturing(GLint max_texture_size) {
        _image_ensure_valid_size_for_texturing(handle, max_texture_size);
    }

    public static bool is_packed_type(GLenum type) {
        return _image_is_packed_type(type);
    }

    public static GLenum compute_pixel_format(GLenum format) {
        return _image_compute_pixel_format(format);
    }

    public static GLenum compute_format_data_type(GLenum format) {
        return _image_compute_format_data_type(format);
    }

    /** return the dimensions of a block of compressed pixels */
    public static void* compute_block_footprint(GLenum pixel_format) {
        // TODO (Vec3i)
        return null;
    }

    /** return the size in bytes of a block of compressed pixels */
    public static uint compute_block_size(GLenum pixel_format, GLenum packing) {
        return _image_compute_block_size(pixel_format, packing);
    }

    public static uint compute_num_components(GLenum pixel_format) {
        return _image_compute_num_components(pixel_format);
    }

    public static uint compute_pixel_size_in_bits(GLenum pixel_format, GLenum type) {
        return _image_compute_pixel_size_in_bits(pixel_format, type);
    }

    public static uint compute_row_width_in_bytes(int width, GLenum pixel_format, GLenum type, int packing) {
        return _image_compute_row_width_in_bytes(width, pixel_format, type, packing);
    }

    public static uint compute_image_size_in_bytes(int width, int height, int depth, 
                                                   GLenum pixel_format, GLenum type, 
                                                   int packing = 1, int slice_packing = 1, 
                                                   int image_packing = 1) {
        return _image_compute_image_size_in_bytes(width, height, depth, pixel_format, type, packing, slice_packing, image_packing);
    }

    public static int roud_up_to_multiple(int s, int pack) {
        return _image_roud_up_to_multiple(s, pack);
    }

    public static int compute_nearest_power_of_two(int s, float bias = 0.5f) {
        return _image_compute_nearest_power_of_two(s, bias);
    }

    public static int compute_number_of_mipmap_levels(int s, int t = 1, int r = 1) {
        return _image_compute_number_of_mipmap_levels(s, t, r);
    }

    public bool is_mipmap() {
        return _image_is_mipmap(handle);
    }

    public uint get_num_mipmap_levels() {
        return _image_get_num_mipmap_levels(handle);
    }

    /** Send offsets into data. It is assumed that first mipmap offset (index 0) is 0.*/
    public void set_mipmap_levels(uint[] mipmap_data_vector) {
        _image_set_mipmap_levels(handle, mipmap_data_vector);
    }

    public uint[] get_mipmap_levels() {
        uint[] mipmap_data_vector = {};
        _image_get_mipmap_levels(handle, mipmap_data_vector, &mipmap_data_vector.length);
        return mipmap_data_vector;
    }

    public uint get_mipmap_offset(uint mipmap_level) {
        return _image_get_mipmap_offset(handle, mipmap_level);
    }

    public uint8[] get_mipmap_data(uint mipmap_level) {
        return _image_get_mipmap_data(handle, mipmap_level);
    }

    /** returns false for texture formats that do not support texture subloading */
    public bool supports_texture_subloading() {
        return _image_supports_texture_subloading(handle);
    }

    /** Return true if this image is translucent - i.e. it has alpha values that are less 1.0 (when normalized). */
    public bool is_image_translucent() {
        return _image_is_image_translucent(handle);
    }

    /** Set the optional PixelBufferObject used to map the image memory efficiently to graphics memory. */
    public void set_pixel_buffer_object(void* buffer) {
        // TODO PixelBufferObject
    }

    /** Get the PixelBufferObject.*/
    public void* get_pixel_buffer_object() {
        // TODO PixelBufferObject
        return null;        
    }

}