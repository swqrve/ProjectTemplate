-- Core/Engine
project "Core"
	kind "StaticLib"
	language "C++"
	staticruntime "off"
	
	files { "src/**.h", "src/**.cpp" }
	
	includedirs { "src", "../" .. IncludeDir["GLFW"], "../" .. IncludeDir["GLAD"], "../" .. IncludeDir["GLM"], "../" .. IncludeDir["STB_image"], "../" .. IncludeDir["STB_truetype"] }
	links { "GLFW", "GLAD", "opengl32.lib" }

	targetdir "../output/%{prj.name}/%{cfg.buildcfg}"
	objdir "../output/%{prj.name}/obj/"