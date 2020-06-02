
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