
# CMake GLFW Project Template

This project is just a basic starting point for a project structure that I enjoy, and loads a few libraries. Uses CMake.

#### Libraries: GLM, GLFW, openGL, STB_IMAGE, and STB_TRUETYPE

I straight up have 0 cmake knowledge as of the first commit, so everything here was cobbled together with what little I understood from the documentation, and other projects. It's mostly an edit of another persons template "MeemKnight" with a LOT of edits to match up with what I assume is better cmake practice (I could be so wrong) and a project structure which most c++ devs would probably cry when looking at *(I'm a java dev, sue me)*.

Basically, all "core" functionality, so for example, a window wrapper, or shader class, would go in the core project folder. The actual program built on top of these just goes in the src folder.

**Inside of the main CMakeLists.txt, you can edit the project name and version, same goes for the core, if you edit the core name, make sure you change the target in the main cmakelist to reflect that change.**

