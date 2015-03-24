---
layout: post
title:  "ساخت Unreal Engine 4 در ویندوز"
name: building-unreal-engine-4-on-windows
author: Abbas Allahyari
date:   2015-03-20 14:58:27
jalali_date: 1393-12-29
permalink: /fa/blog/در-ویندوز-unreal-engine-4-ساخت.html
categories:
- Game Dev
- Game Engines
tags: ue4 unreal-engine c++ visual-studio git
lang: fa
references:
- If You Love Something, Set It Free|https://www.unrealengine.com/blog/ue4-is-free
- Unreal Engine 4 on GitHub|https://www.unrealengine.com/ue4-on-github
- Unreal Engine repository page on GitHub|https://github.com/EpicGames/UnrealEngine

---

[موتور بازی سازی Unreal Engine 4 در 11 اسفند 1393 رایگان شد ][ue4-is-free]{:external}
 خود engine و کد آن در دسترس عموم قرار گرفت.
با وجود اینکه [دستور عمل لازم برای ساخت UE4 در سایت Unreal Engine][ue4-on-github]{:external}  و [صفحه آن در GitHub ][ue4-github-repo]{:external} موجود موجود است، این راهنما قصد جمع آوری تمام این مطالب در یک جا را دارد.

#### چیک لیست ####


در اینجا یک لیست و خلاصه کارهایی که برای ساخت UE4 لازم است، آمده است.

* [مرحله 1: ](#step-1) ثبت نام در وبسایت [UnrealEngine]{:external}  و [GitHub]{:external}
* [مرحله 2: ](#step-2) اضافه کردن نام کاربری GitHub خود در داشبورد UnrealEngine
* [مرحله 3: ](#step-3) دریافت کد UE4 از [مخزن UE4][ue4-github-repo]{:external}
* [مرحله 4: ](#step-4) نصب Visual Studio 2013
* [مرحله 5: ](#step-5) اجرای `Setup.bat` برای دانلود فایل های binary
* [مرحله 6: ](#step-6) اجرای `GenerateProjectFiles.bat` برای ساخت فایل های پروژه
* [مرحله 7: ](#step-7) ساخت UE4 با تنظیمات **Development Editor**  و پلتفرم **Win64**{:lang="en"}
* [مرحله 8: ](#step-8) اجرای `UE4Editor.exe` در شاخته `Engine\Binaries\Win64\`

#### مرحله 1: ثبت نام در وبسایت Unreal Engine و GitHub ####
{: #step-1}

توضیح اینکه چطور میشه در یک وبسایت از حوضه این بحث دور است....یا اصلا تو سطحش نیست...

#### مرحله 2: اضافه کردن نام کاربری GitHub خود در داشبورد UnrealEngine ####
{: #step-2}
به Dashboard خود در وبسایت Unreal Engine بروید و در تب Profile زیر«Github Account Name» نام کاربری GitHub خود را وارد کنید.

بعد یک مدت در وبسایت GitHub یک پیغام مبنی بر تایید عضویت شما در [Epic Games][EpicGamesOrg]{:external} دریافت می کنید.

![unreal-engine-account-dashboard]

#### مرحله 3: دریافت کد UE4 از مخزن UE4 ####
{: #step-3}

بعد از اینکه عضویت شما در [Epic Games][EpicGamesOrg]{:external} به صفحه UnrealEngine بروید. توجه داشته باشید اگر هنوز عضویت شما تایید نشده باشد به پیغام 404 مواجه می شوید.
`https://github.com/EpicGames/UnrealEngine`

حالا با روشی که ترجیج می دهید می توانید کد را دانلود کنید.

![retrieving-ue-source-code]

1. **Git:** آدرسی که در زیر «clone URL» آمده کپی کنید و دستور زیر را در شاخه مورد نظر وارد کنید.

    `git clone https://github.com/EpicGames/UnrealEngine.git`

2. **Git For Windows:** اگر [GitHub for Windows ][GitHubForWindows]{:external} را نصب کرده اید می توانید با کلیک بر روی «Clone in Desktop» و دنبال کردن مراحل در  نرم افزار GitHub کد را دانلود کنید.

3. **Zip:** بر روی «Download Zip» کلیک کنید؛
بعد از اینکه فایل دانلود شد آن را در محل مورد نظر از فشرده سازی در بیارید؛
این روش وقتی خوبه که سرعت اینرنت شما پایین است و/یا نمی خواهید از git استفاده کنید. در زمانی که این راهنما را نوشتم حجم این فایل zip حدود 137MB  بود.

#### مرحله 4: نصب Visual Studio 2013 ####
{: #step-4}

برای compile و ساخت UE4 نیاز به Visual Studio 2013 دارید، که نسخه های رایگان
 [Visual Studio 2013 Express for Desktop][VSED2013] و [Visual Studio 2013 Community 2013][VSC2013] هم جواب گو هستند؛
 فقط مطئن شوید که گزینه MFC Libraries هنگام نصب تیک خورد است (که به طور پیش فرض این گونه است).

#### مرحله 5: اجرای Setup.bat برای دانلود فایل های binary ####
{: #step-5}

حال به شاخه ای که در آن مخزن را از فشرده سازی در آورده یا clone کرده اید بروید . و یک فایل batch به نام `Setup.bat` را اجرا کنید.

با اجرای این script شما فایل های binary لازم براس ساخت و اجرای UE4 را دانلود می کنید که حدود3.5GB  می شود.

اگر قصد ساخت برای دیگر پلتفرم ها مانند اندروید و/یا HTML5 را دارید باید Android NDK برای اندروید و Emscripten برای HTML5 را دانلود کنید.
هنگامی که Setup.bat وجودشان را در تشخیص دهد فایل های لازم را نیز برای پشتیبانی اندروید و/یا HTML5 دانلود می کند.
برای اطلاعت بیشتر به [صفحه مخزن Unreal Engine در GitHub][ue4-github-repo]{:external} مراجعه کنید.


#### مرحله 6: اجرای GenerateProjectFiles.bat  برای ساخت فایل های پروژه  ####
{: #step-6}

بعد از دانلود فایل های `GenerateProjectFiles.bat` را اجرا کنید تا فایل های پروژه ایجاد شوند.


#### مرحله 7: ساخت Unreal Engine 4 ####
{: #step-7}

فایل `UE4.sln` را در Visual Studio باز کنید.

تنظیم مربوط به  solution configuration را روی  **Development Editor** بگذارید و  solution plaform را روی  **Win64**

![setting-solution-configuration-and-platform]

روی پروژه **UE4** کلیک راست کنید و روی **Build** کلیک کنید.

![building-ue4]

ساخت Unreal Engine 4 ممکن هست حدود یک ساعت طول بشکد که نسبت به سیستم این زمان می تواند متفاوت باشد.

کل engine بعد از دانلود فایل های binary و ساخت حدود 20GB می شود؛

پس مطمئن شوید فضای کافی دارید وگرنه فضا تمام شده و عملیت ساخت با وقفه مواجه می شود.

#### مرحله 8: اجرای UE4 Editor ####
{: #step-8}

تبریک، شما ساخت Unreal Engine 4، یکی از بهترین engine های بازی سازی در جهان را تمام کردید!

حال که ساخت تمام شده می توانید `UE4Editor.exe` را در شاخه `Engine\Binaries\Win64\` پیدا کنید و آن را اجرا کنید.

برای اطلاعات بیشتر و بروز تر می توانید منابعی که در زیر این راهنما آمده است را بخوانید.

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


[unreal-engine-account-dashboard]: http://res.cloudinary.com/hybrid-syntax/image/upload/v1426688828/hybridsyntax.com/building-unreal-engine-4-on-windows-01.jpg "Unreal Engine account dashboard"
[retrieving-ue-source-code]: http://res.cloudinary.com/hybrid-syntax/image/upload/v1426688829/hybridsyntax.com/building-unreal-engine-4-on-windows-02.jpg "Downloading UE4 source code"
[setting-solution-configuration-and-platform]: http://res.cloudinary.com/hybrid-syntax/image/upload/v1426688830/hybridsyntax.com/building-unreal-engine-4-on-windows-03.jpg "Setting solution configuration and platform"
[building-ue4]: http://res.cloudinary.com/hybrid-syntax/image/upload/v1426688835/hybridsyntax.com/building-unreal-engine-4-on-windows-04.jpg "Building Unreal Engine 4"

*[تنظیمات]: Solution Configuration
*[پلتفرم]: Platform
*[UE4]: Unreal Engine 4
*[Repo]: Repository
