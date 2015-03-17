---
layout: post
title:  "Building Unreal Engine 4 on Windows"
name: building-unreal-engine-4-on-windows
author: Abbas Allahyari
date:   2015-03-17 10:27:27
permalink: /en/blog/building-unreal-engine-4-on-windows
categories:
- Game Dev
lang: en
tags: ue4 unreal-engine c++
---

Windows

Install GitHub for Windows then fork and clone our repository. To use Git from the command line, see the Setting up Git and Fork a Repo articles.

If you'd prefer not to use Git, you can get the source with the 'Download ZIP' button on the right. The built-in Windows zip utility will mark the contents of zip files downloaded from the Internet as unsafe to execute, so right-click the zip file and select 'Properties...' and 'Unblock' before decompressing it. Third-party zip utilities don't normally do this.

Install Visual Studio 2013. All desktop editions of Visual Studio 2013 can build UE4, including Visual Studio Community 2013, which is available for free. Be sure to include the MFC libraries as part of the install (it's included by default), which we need for ATL support.

Open your source folder in Explorer and run Setup.bat. This will download binary content for the engine, as well as installing prerequisites and setting up Unreal file associations. On Windows 8, a warning from SmartScreen may appear. Click "More info", then "Run anyway" to continue.

A clean download of the engine binaries is currently around 2.5gb, which may take some time to complete. Subsequent checkouts only require incremental downloads and will be much quicker.

Run GenerateProjectFiles.bat to create project files for the engine. It should take less than a minute to complete.

Load the project into Visual Studio by double-clicking on the UE4.sln file. Set your solution configuration to Development Editor and your solution platform to Win64, then right click on the UE4 target and select Build. It may take anywhere between 10 and 40 minutes to finish compiling, depending on your system specs.

After compiling finishes, you can load the editor from Visual Studio by setting your startup project to UE4 and pressing F5 to debug.
