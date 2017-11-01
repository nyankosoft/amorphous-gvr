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

	const int num_meshes = 8;

	//m_Meshes.resize(num_meshes);

	//m_Meshes[0] = CreateBoxMesh( Vector3(10,1,1) );
	//m_Meshes[1] = CreateBoxMesh( Vector3(3,3,3) );//CreateSphereMesh( 1 );
	//m_Meshes[2] = CreateBoxMesh( Vector3(3,6,3) );//CreateConeMesh();
	//m_Meshes[3] = CreateBoxMesh( Vector3(2,4,8) );//CreateCylinderMesh();

	m_Mesh = CreateBoxMesh( Vector3(10,1,1) );

//	m_Shader = GetNoLightingShader();
	m_Shader = CreateMiscShader( MiscShader::SINGLE_DIFFUSE_COLOR );

	return 0;
}

void MyGvrApp::Render() {

	//PrimitiveShapeRenderer renderer;
	auto pShaderMgr = m_Shader.GetShaderManager();
	if( !pShaderMgr ) {
		ONCE( LOG_PRINT_ERROR("pShaderMgr == nullptr") );
		return;
	}

	Vector3 mesh_positions[] = {
		Vector3(  0, 0,-10),
		Vector3(  0, 0, 10),
		Vector3( 10, 0,  0),
		Vector3(-10, 0,  0),
		Vector3(  7, 0,-7),
		Vector3(  7, 0, 7),
		Vector3( -7, 0,-7),
		Vector3( -7, 0, 7),
	};
	
	int i=0;
//	for( auto mesh : m_Meshes ) {

//		auto pMesh = mesh.GetMesh();
		auto pMesh = m_Mesh.GetMesh();

		if(pMesh) {

			Matrix34 pose;
			pose.vPosition = Vector3(0,0,-3);//mesh_positions[i];
			i += 1;
			pShaderMgr->SetWorldTransform(ToMatrix44(pose));
			pMesh->Render(*pShaderMgr);	
		}
		else {
			//ONCE( LOG_PRINT_ERROR("pMesh == nullptr") );
		}
//	}

}
