#ifndef __MyGvrApp_HPP__
#define __MyGvrApp_HPP__


#include "amorphous/App/GvrAppBase.hpp"
#include "amorphous/Graphics/MeshObjectHandle.hpp"
#include "amorphous/Graphics/ShaderHandle.hpp"


// namespace mygvrapp{

	
class MyGvrApp : public amorphous::GvrAppBase
{
	std::vector<amorphous::MeshHandle> m_Meshes;

	amorphous::MeshHandle m_Mesh;

	amorphous::ShaderHandle m_Shader;

public:

	MyGvrApp(){}

	~MyGvrApp(){}
	
	int Init();

	void Render();
};

	
//} // namespace mygvrapp


#endif /* __MyGvrApp_HPP__ */
