---
layout: post
title:  "Building Unreal Engine 4 on Windows"
name: building-unreal-engine-4-on-windows
author: Abbas Allahyari
date:   2015-03-18 16:45:27
permalink: /en/blog/building-unreal-engine-4-on-windows
categories:
- Game Dev
- Game Engines
tags: ue4 unreal-engine c++ visual-studio git
lang: en
references:
- If You Love Something, Set It Free|https://www.unrealengine.com/blog/ue4-is-free
- Unreal Engine 4 on GitHub|https://www.unrealengine.com/ue4-on-github
- Unreal Engine repository page on GitHub|https://github.com/EpicGames/UnrealEngine

---



[Unreal Engine 4 went free][ue4-is-free]{:external} on March 2, 2015, and both the engine and its source code were made available to the public, although [the instructions provided by Unreal Engine website][ue4-on-github]{:external} and [Unreal Engine's GitHub repository page][ue4-github-repo]{:external} are clear enough; this guide aims to brings them all together in one place.

#### Check list ####

Here's a check list and summary of things that needs to be done in order to build UE4.

* [Step 1: ](#step-1) Register an account at [UnrealEngine]{:external} and [GitHub]{:external}
* [Step 2: ](#step-2) Add your GitHub username to in your UnrealEngine profile under your dashboard
* [Step 3: ](#step-3) Download the source code from [UE4 Repo][ue4-github-repo]{:external}
* [Step 4: ](#step-4) Install Visual Studio 2013
* [Step 5: ](#step-5) Run `Setup.bat` to download binary files
* [Step 6: ](#step-6) Run `GenerateProjectFiles.bat` to make project files
* [Step 7: ](#step-7) Building Unreal Engine 4 with **Development Editor** configuration and **Win64** Platform
* [Step 8: ](#step-8) Run the `UE4Editor.exe` from `Engine\Binaries\Win64\` subdirectory

#### Step 1: Register an account at UnrealEngine and GitHub ####
{: #step-1}

Explaining how to register on a website is beyond the scope of this guide...or below it for that matter.

#### Step 2: Add your GitHub username to in your UnrealEngine profile under your dashboard ####
{: #step-2}
Go to your Dashboard and then Profile tab and enter your github username under "Github Account Name".

Shortly after entering your username you will receive a message approving your request to join [Epic Games organization][EpicGamesOrg]{:external} on GitHub.

![unreal-engine-account-dashboard]

#### Step 3: Download the source code from UE4 Repo ####
{: #step-3}

After you got approved into the organization you need to go to UnrealEngine page. (if you are yet to be approved you'll get a 404 page not found error)

`https://github.com/EpicGames/UnrealEngine`

Now depending on the way you prefer to download the source code you can use any of these methods.

![retrieving-ue-source-code]

1. **Git:** Copy the url under "clone URL" and run the following command in your desired directory
    `git clone https://github.com/EpicGames/UnrealEngine.git`

2. **Git For Windows:** In case you have [GitHub for Windows ][GitHubForWindows]{:external} installed you can retrieve the source code by clicking on "Clone in Desktop" and proceeding in GitHub program.

3. **Zip:** Click on "Download Zip"; after the file is downloaded extract it in your desired directory; This method is desirable when your internet speed is slow, and/or you don't want to use git; At the time of writing this guide, the size of source code is about 137MB.

#### Step 4: Install Visual Studio 2013 ####
{: #step-4}

In order to compile and build UE4 you need Visual Studio 2013 at least, which is possible by both free versions of [Visual Studio 2013 Express for Desktop][VSED2013] and [Visual Studio 2013 Community 2013][VSC2013]; just make sure you install MFC libraries (which is checked by default).

#### Step 5: Run Setup.bat to download binary files ####
{: #step-5}

Now you go the directory which you cloned/extracted the repository and run a batch scrip named `Setup.bat`
By running this script, you download necessary binary files in order build and run UE4, which is roughly around 3.5GB.

If you're going to develop for other platforms such as Android and/or HTML5 you need to download Android NDK and Emscripten respectively; once Setup.bat detects their presence it will download the necessary files for Android and/or HTML5 support; you can visit [Unreal Engine's GitHub repository page][ue4-github-repo]{:external} for my information.

#### Step 6: Run GenerateProjectFiles.bat to make project files ####
{: #step-6}

After you're done downloading binary files, run `GenerateProjectFiles.bat` batch script to generate project files for UE4

#### Step 7: Building Unreal Engine 4 ####
{: #step-7}

Open `UE4.sln` file in Visual Studio

Set the solution configuration to **Development Editor** and solution plaform to **Win64**

![setting-solution-configuration-and-platform]

Right click on the **UE4** project and click **Build**

![building-ue4]

Building Unreal Engine 4 may takes near an hour depending on your system specs, and the whole engine will be around 20GB after downloading binary files and build; so make sure you have enough disk space before building or you'll run out of space and the build process is interrupted.

#### Step 8: Run UE4 Editor ####
{: #step-8}

Congratulations, you just build Unreal Engine 4 one of the best game engines in the world!

Now the build is done, you can find `UE4Editor.exe` under `Engine\Binaries\Win64\` subdirectory, and run the editor.

You can always refer to the references listed below for the most up-to-date information.

{:external: rel="external" target="_blank" }

[UnrealEngine]: https://www.unrealengine.com "UnrealEngine"
[GitHub]: https://www.github.com "GitHub"
[ue4-is-free]: https://www.unrealengine.com/blog/ue4-is-free "If You Love Something, Set It Free"
[ue4-on-github]: https://www.unrealengine.com/ue4-on-github "Unreal Engine 4 on GitHub"
[ue4-github-repo]: https://github.com/EpicGames/UnrealEngine "Unreal Engine 4 repository on GitHub"
[GitHubForWindows]: https://windows.github.com/ "GitHub for Windows"
[VSC2013]: https://www.visualstudio.com/products/visual-studio-community-vs "Visual Studio Community 2013"
[VSED2013]: https://www.visualstudio.com/en-us/products/visual-studio-express-vs.aspx "Visual Studio Express 2013 for Desktop"

[EpicGamesOrg]: https://github.com/EpicGames "Epic Games Organization"

[unreal-engine-account-dashboard]: https://dl.dropboxusercontent.com/u/22236346/hybridsyntax.com/building-unreal-engine-4-on-windows-01.jpg
[retrieving-ue-source-code]: https://dl.dropboxusercontent.com/u/22236346/hybridsyntax.com/building-unreal-engine-4-on-windows-02.jpg
[setting-solution-configuration-and-platform]: https://dl.dropboxusercontent.com/u/22236346/hybridsyntax.com/building-unreal-engine-4-on-windows-03.jpg
[building-ue4]: https://dl.dropboxusercontent.com/u/22236346/hybridsyntax.com/building-unreal-engine-4-on-windows-04.jpg "Building Unreal Engine 4"


*[UE4]: Unreal Engine 4
*[Repo]: Repository
