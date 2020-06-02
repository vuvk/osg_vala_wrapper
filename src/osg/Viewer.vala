
extern void* _viewer_new();
extern void  _viewer_dispose(void* viewer);
extern void  _viewer_set_scene_data(void* viewer, void* node);
extern void* _viewer_get_camera(void* viewer);
extern void  _viewer_run(void* viewer);

public class Viewer : OSGObject {
    private Camera camera;

    public Viewer() {
        handle = _viewer_new();
        camera = new Camera.from_handle(_viewer_get_camera(handle));
        set_disposable(true);
    }

    protected override void dispose_handle() {
        _viewer_dispose(handle);
    }

    ~Viewer() {
        base.dispose();
    }

    public void set_scene_data(Node node) {
        _viewer_set_scene_data(handle, node.handle);
    }

    public Camera get_camera() {
        return camera;
    }

    public void run() {
        _viewer_run(handle);
    }
}