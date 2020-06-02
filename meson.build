project('vala app', 'vala', 'c', 'cpp')

# need math?
cc = meson.get_compiler('c') 
m_dep = cc.find_library('m', required : false) 

dependencies = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
#    dependency('gio-2.0'),    
#    dependency('gl'),
    dependency('osg'),
    dependency('osgDB'),
    dependency('osgFX'),
    dependency('osgViewer'),
    m_dep
]

#vapi_dir = meson.current_source_dir() / 'vapi'
#add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

sources = []

subdir('src')

executable('app_name', sources, dependencies: dependencies)
