-- Main Build Script
workspace "Project Template"
	configurations { "Debug", "Release", "Distribution" }
	language "C++"
	startproject "Derived"
	
	filter "configurations:Debug"
		defines { "DEBUG" }
		runtime "Debug"
		symbols "On"
		
	filter "configurations:Release"
		defines { "RELEASE" }
		runtime "Release"
		symbols "On"
		
	filter "configurations:Distribution"
		defines { "DISTRIBUTION" }
		runtime "Release"
		symbols "On"

-- External Libraries Includes
IncludeDir = {}
IncludeDir["GLFW"] = "external/GLFW/include"
IncludeDir["GLAD"] = "external/GLAD/include"
IncludeDir["GLM"] = "external/GLM/glm"
IncludeDir["STB_image"] = "external/STB_image/src"
IncludeDir["STB_truetype"] = "external/STB_truetype/src"

-- External Libraries Projects
include "external/GLFW/premake5.lua"
include "external/GLAD/premake5.lua"

include "core/CoreBuild.lua"
include "DeriveBuild.lua"