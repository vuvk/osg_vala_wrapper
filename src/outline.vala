


extern void* _group_new();
extern void  _group_add_child(void* group, void* child);
class Group : Node {

    internal Group.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public Group() {
        handle = _group_new();
    }

    public virtual void add_child(Node child) {
        _group_add_child(handle, child.handle);
    }

}

class Effect : Group {

}

extern void* _outline_new();
extern void  _outline_set_width(void* outline, float w);
extern void  _outline_set_color(void* outline, void* vec4f);
extern void  _outline_add_child(void* outline, void* node);

class Outline : Effect {

    internal Outline.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public Outline () {
        handle = _outline_new();
    }

    public void set_width(float width) {
        _outline_set_width(handle, width);
    }

    public void set_color(Vec4f color) {
        _outline_set_color(handle, color.handle);
    }

    public override void add_child(Node child) {
        _outline_add_child(handle, child.handle);
    }
}

class Transform : Group {

}

extern int   _camera_get_clear_mask(void* camera);
extern void  _camera_set_clear_mask(void* camera, int mask);
extern void  _camera_set_clear_stencil(void* camera, int stencil);
class Camera : Transform {

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

extern void* _viewer_new();
extern void  _viewer_set_scene_data(void* viewer, void* node);
extern void* _viewer_get_camera(void* viewer);
extern void  _viewer_run(void* viewer);
class Viewer : OSGObject {
    private Camera camera;

    public Viewer() {
        handle = _viewer_new();
        camera = new Camera.from_handle(_viewer_get_camera(handle));
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

extern void _display_settings_set_minimum_num_stencil_bits(int num);
class DisplaySettings : Object {
    private DisplaySettings() {}

    public static void set_minimum_num_stencil_bits(int num) {
        _display_settings_set_minimum_num_stencil_bits(num);
    }
} 

const int GL_STENCIL_BUFFER_BIT	= 0x00000400;

int main(string[] args) {
    string model_file = (args.length > 1) ? args[1] : "cessnafire.osgt";

    Node model = new Node.from_file(model_file);
    if (model == null) {
        print(@"Unable to load model '$model_file'\n");
        return -1;
    }

    var outline = new Outline();
    outline.set_color(new Vec4f(1, 0, 0, 1));
    outline.set_width(8);
    outline.add_child(model);

    // create scene
    var root = new Group();
    root.add_child(outline);

    // must have stencil buffer...
    DisplaySettings.set_minimum_num_stencil_bits(1);

    // construct the viewer
    var viewer = new Viewer();
    viewer.set_scene_data(root);

    // must clear stencil buffer...
    var camera = viewer.get_camera();

    int clear_mask = camera.get_clear_mask();
    camera.set_clear_mask(clear_mask | GL_STENCIL_BUFFER_BIT);
    camera.set_clear_stencil(0);

    viewer.run();   
    
    return 0;
}