#include "MyGvrApp.hpp"
#include "amorphous/3DMath/MatrixConversions.hpp"
#include "amorphous/Graphics/Mesh/BasicMesh.hpp"
#include "amorphous/Graphics/MeshUtilities.hpp"
#include "amorphous/Graphics/Shader/CommonShaders.hpp"
#include "amorphous/Graphics/Shader/MiscShaderGenerator.hpp"
#include "amorphous/Graphics/Shader/ShaderManager.hpp"
#include "amorphous/Support/Macro.h"
//#include "amorphous/Graphics/PrimitiveShapeRenderer.hpp"

using namespace std;
using namespace amorphous;


int MyGvrApp::Init() {

	m_Mesh = CreateBoxMesh( Vector3(10,1,1) );

//	m_Shader = GetNoLightingShader();
	m_Shader = CreateMiscShader( MiscShader::SINGLE_DIFFUSE_COLOR );

	return 0;
}

void MyGvrApp::Render() {

	//PrimitiveShapeRenderer renderer;

	auto pMesh = m_Mesh.GetMesh();

	if(pMesh) {

		auto pShaderMgr = m_Shader.GetShaderManager();
		if( pShaderMgr ) {
			Matrix34 pose;
			pose.vPosition = Vector3(0,0,-10);
			pShaderMgr->SetWorldTransform(ToMatrix44(pose));
			pMesh->Render(*pShaderMgr);	
		} else {
			ONCE( LOG_PRINT_ERROR("pShaderMgr == nullptr") );
		}
	}
	else {
		ONCE( LOG_PRINT_ERROR("pMesh == nullptr") );
	}

}
