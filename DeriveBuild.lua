-- Derived from Core, This is the Application
project "Derived"
	kind "ConsoleApp"
	language "C++"
	staticruntime "off"
	
	files { "src/**.h", "src/**.cpp" }

	includedirs { "src", "core/src", IncludeDir["GLFW"], IncludeDir["GLAD"], IncludeDir["GLM"], IncludeDir["STB_image"], IncludeDir["STB_truetype"] } -- Includes the headers from the core
	links { "Core", "GLFW", "GLAD", "opengl32.lib" }

	targetdir "/output/%{prj.name}/%{cfg.buildcfg}"
	objdir "/output/%{prj.name}/obj/"
	