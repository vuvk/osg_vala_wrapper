
extern int   _camera_get_clear_mask(void* camera);
extern void  _camera_set_clear_mask(void* camera, int mask);
extern void  _camera_set_clear_stencil(void* camera, int stencil);
public class Camera : Transform {

    internal Camera.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public int get_clear_mask() {
        return _camera_get_clear_mask(handle);
    }

    public void set_clear_mask(int mask) {
        _camera_set_clear_mask(handle, mask);
    }

    public void set_clear_stencil(int stencil) {
        _camera_set_clear_stencil(handle, stencil);
    }
}