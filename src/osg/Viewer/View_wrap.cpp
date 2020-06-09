
#include <osg/View>


extern "C"
{

void* _view_new()
{
    return new osg::View();
}

void _view_dispose(void* view)
{
    static_cast<osg::View*>(view)->unref();
}

/** Take all the settings, Camera and Slaves from the passed in view, leaving it empty. */
void _view_take(void* view, void* rhs)
{
    static_cast<osg::View*>(view)->take(*(static_cast<osg::View*>(rhs)));
}

/** Set the Stats object used to collect various frame related timing and scene graph stats.*/
void _view_set_stats(void* view, void* stats)
{
    static_cast<osg::View*>(view)->setStats(static_cast<osg::Stats*>(stats));
}

/** Get the Viewers Stats object.*/
void* _view_get_stats(void* view)
{
    return static_cast<osg::View*>(view)->getStats();
}

/** Set the global lighting to use for this view.
     * Defaults to headlight. */
void _view_set_lighting_mode(void* view, int lighting_mode)
{
    static_cast<osg::View*>(view)->setLightingMode((osg::View::LightingMode)lighting_mode);
}

/** Get the global lighting used for this view.*/
int _view_get_lighting_mode(void* view)
{
    return (int) static_cast<osg::View*>(view)->getLightingMode();
}

/** Get the global light.*/
void _view_set_light(void* view, void* light)
{
    static_cast<osg::View*>(view)->setLight(static_cast<osg::Light*>(light));
}

/** Get the global lighting if assigned.*/
void* _view_get_light(void* view)
{
    return static_cast<osg::View*>(view)->getLight();
}

/** Set the master camera of the view. */
void _view_set_camera(void* view, void* camera)
{
    static_cast<osg::View*>(view)->setCamera(static_cast<osg::Camera*>(camera));
}

/** Get the master camera of the view. */
void* _view_get_camera(void* view)
{
    return static_cast<osg::View*>(view)->getCamera();
}

/** Set the frame stamp of the view. */
void _view_set_frame_stamp(void* view, void* fs)
{
    static_cast<osg::View*>(view)->setFrameStamp(static_cast<osg::FrameStamp*>(fs));
}

/** Get the frame stamp of the view. */
void* _view_get_frame_stamp(void* view)
{
    return static_cast<osg::View*>(view)->getFrameStamp();
}

bool _view_add_slave(void* view, void* camera, bool use_masters_sceneData/*=true*/)
{
    return static_cast<osg::View*>(view)->addSlave(static_cast<osg::Camera*>(camera), use_masters_sceneData);
}

bool _view_add_slave_ext(void* view, void* camera, void* projection_offset, void* view_offset, bool use_masters_sceneData/*=true*/)
{
    return static_cast<osg::View*>(view)->addSlave(
        static_cast<osg::Camera*>(camera), 
        *static_cast<osg::Matrix*>(projection_offset), 
        *static_cast<osg::Matrix*>(view_offset),         
        use_masters_sceneData
    );
}

bool _view_remove_slave(void* view, unsigned int pos)
{
    return static_cast<osg::View*>(view)->removeSlave(pos);
}

unsigned int _view_get_num_slaves(void* view)
{
    return static_cast<osg::View*>(view)->getNumSlaves();
}

//Slave& _view_getSlave(void* view, unsigned int pos) { return _slaves[pos]; }

unsigned int _view_find_slave_index_for_camera(void* view, void* camera)
{
    return static_cast<osg::View*>(view)->findSlaveIndexForCamera(static_cast<osg::Camera*>(camera));
}

//Slave * _view_findSlaveForCamera(void* view, osg::Camera* camera);

void _view_update_slaves(void* view)
{
    static_cast<osg::View*>(view)->updateSlaves();
}

void _view_resize_gl_object_buffers(void* view, unsigned int max_size)
{
    static_cast<osg::View*>(view)->resizeGLObjectBuffers(max_size);
}

void _view_release_gl_objects(void* view, void* state/* = 0*/)
{
    static_cast<osg::View*>(view)->releaseGLObjects(static_cast<osg::State*>(state));
}

}
