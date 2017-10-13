src_dir=../amorphous
dest_dir=ndk-treasurehunt/src/main/jni/amorphous
rm -rf $dest_dir
mkdir $dest_dir

# Headers
cp -rf $src_dir/framework/amorphous/*.hpp   $dest_dir/

# Support module
cp -rf $src_dir/framework/amorphous/Support $dest_dir/
rm -rf $dest_dir/Support/OpenAES
rm -rf $dest_dir/Support/AutoResourceArchiver.*
rm -rf $dest_dir/Support/CameraController*

# 3DMath module
cp -rf $src_dir/framework/amorphous/3DMath $dest_dir/
rm -rf $dest_dir/3DMath/PolygonMesh.*

# XML module
mkdir $dest_dir/XML
cp -f $src_dir/framework/amorphous/XML/fwd.hpp                    $dest_dir/XML/
cp -f $src_dir/framework/amorphous/XML/XMLNode.hpp                $dest_dir/XML/
cp -f $src_dir/framework/amorphous/XML/LoadFromXMLNode_3DMath.hpp $dest_dir/XML/

# Utilities module; this module was meant to provide high-level features for application code,
# but some of the code of Graphics module ended up using them.
# TODO: figure out a way to resolve dependencies.
mkdir $dest_dir/Utilities
cp -f $src_dir/framework/amorphous/Utilities/PerlinAux.hpp     $dest_dir/Utilities/

# Graphics module
mkdir $dest_dir/Graphics
cp -rf $src_dir/framework/amorphous/Graphics/*.*               $dest_dir/Graphics/
cp -rf $src_dir/framework/amorphous/Graphics/2DPrimitive       $dest_dir/Graphics/
cp -rf $src_dir/framework/amorphous/Graphics/Mesh              $dest_dir/Graphics/
cp -rf $src_dir/framework/amorphous/Graphics/MeshModel         $dest_dir/Graphics/
cp -rf $src_dir/framework/amorphous/Graphics/MeshGenerators    $dest_dir/Graphics/
cp -rf $src_dir/framework/amorphous/Graphics/Font              $dest_dir/Graphics/
cp -rf $src_dir/framework/amorphous/Graphics/Shader            $dest_dir/Graphics/
cp -rf $src_dir/framework/amorphous/Graphics/TextureGenerators $dest_dir/Graphics/
cp -rf $src_dir/framework/amorphous/Graphics/OpenGL            $dest_dir/Graphics/
rm -f  $dest_dir/Graphics/VarianceShadowMapManager.*
rm -f  $dest_dir/Graphics/2DGraph.*
rm -f  $dest_dir/Graphics/CorrelationGraph.*
rm -f  $dest_dir/Graphics/LinePrimitives.*
rm -f  $dest_dir/Graphics/3DRect.cpp
rm -f  $dest_dir/Graphics/PyModule_GraphicsElement.*
rm -f  $dest_dir/Graphics/2DPrimitive/2DTexturedRect.*
rm -f  $dest_dir/Graphics/MeshModel/CompositeMesh.*
rm -f  $dest_dir/Graphics/MeshModel/ShadowVolumeMeshGenerator.*
rm -f  $dest_dir/Graphics/MeshModel/TerrainMeshGenerator.*
rm -f  $dest_dir/Graphics/MeshGenerators/BrickWallMeshGenerator.*
rm -f  $dest_dir/Graphics/MeshGenerators/RandomTerrainMeshGenerator.*
rm -f  $dest_dir/Graphics/Shader/Cg*.*
rm -f  $dest_dir/Graphics/Font/ASCIIFont.cpp
rm -f  $dest_dir/Graphics/Font/UTFFont.cpp
rm -f  $dest_dir/Graphics/OpenGL/Mesh/GL2BasicMeshImpl.*
rm -f  $dest_dir/Graphics/OpenGL/Shader/GLCgEffect.*
rm -f  $dest_dir/Graphics/OpenGL/GLTextureRenderTarget.cpp
#rm -f  $dest_dir/Graphics/OpenGL/Mesh/GLCustomMeshRenderer.*
rm -f  $dest_dir/Graphics/OpenGL/Shader/GLFixedPipelineLightManager.*

mkdir $dest_dir/Graphics/Direct3D
cp -rf $src_dir/framework/amorphous/Graphics/Direct3D/fwd.hpp         $dest_dir/Graphics/Direct3D/

# Copy stubs of classes whose features at this point are difficult to port to Android,
# for a variety of reasons, e.g. classes calling OpenGL APIs that are missing in GLES 2.0,
# third-party libraries that are too bulky and laborious to port, etc.
cp -rf stubs/amorphous/*            $dest_dir/

# App module

mkdir $dest_dir/App
cp -f  $src_dir/framework/amorphous/App/GvrAppBase.*                  $dest_dir/App/
