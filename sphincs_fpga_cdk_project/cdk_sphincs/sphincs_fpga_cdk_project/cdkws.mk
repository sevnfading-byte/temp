.PHONY: clean All Project_Title Project_Build Project_PostBuild

All: Project_Title Project_Build Project_PostBuild

Project_Title:
	@echo "----------Building project:[ smartl_e906fd-hello_world - BuildSet ]----------"

Project_Build:
	@make -r -f smartl_e906fd-hello_world.mk -j 8 -C  smartl_e906fd-hello_world/projects/examples/hello_world/CDK 

Project_PostBuild:
	@echo Executing Post Build commands ...
	@cd "smartl_e906fd-hello_world\projects\examples\hello_world\CDK" && export CDKPath="D:/C-Sky/CDK" CDK_VERSION="V2.16.1" ProjectPath="C:/Users/23005/Desktop/PQC/sphincs_fpga/sphincs_fpga_cdk_project_01/workplace_4/sphincs_fpga_cdk_project/cdk_sphincs/sphincs_fpga_cdk_project/smartl_e906fd-hello_world/projects/examples/hello_world/CDK/" && "C:/Users/23005/Desktop/PQC/sphincs_fpga/sphincs_fpga_cdk_project_01/workplace_4/sphincs_fpga_cdk_project/cdk_sphincs/sphincs_fpga_cdk_project/smartl_e906fd-hello_world/projects/examples/hello_world/CDK/../../../../utilities//aft_build.sh" 
	@echo Done


clean:
	@echo "----------Cleaning project:[ smartl_e906fd-hello_world - BuildSet ]----------"

