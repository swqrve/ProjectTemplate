project "GLAD"
    kind "StaticLib"
    language "C"
    staticruntime "off"
    warnings "off"

	targetdir "../../output/%{prj.name}/%{cfg.buildcfg}"
	objdir "../../output/%{prj.name}/obj/"
	
    files { "include/glad/glad.h", "include/KHR/khrplatform.h", "src/glad.c" }
	includedirs { "include", "src" }
	
	filter "system:windows"
		systemversion "latest"