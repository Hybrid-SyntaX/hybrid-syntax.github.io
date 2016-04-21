---
layout: post
title:  "Tests and Singletons: Singletons With Benefits!"
name: tests-and-singleton-singleton-with-benefits
author: Abbas Allahyari
date:   2016-03-18 23:02
permalink: /en/blog/tests-and-singleton-singleton-with-benefits!.html
categories:
- Soft Dev
- Unit Test
tags: unit-test c# visual-studio singleton design-pattern test
lang: en
---

So have you just created a nice shiny class implementing [SingletonPattern]{:external} and now you've got to test it? You may find to your horror that the singleton is messing up the tests! 

This is an example of an [innocent] singleton class.

```csharp
    class Singleton
    {
      private Singleton instance;
      public static Singleton Instance()
      {
        if(instance==null)
          instance=new Singleton();
        return instance;
      }
      private Singleton()
      {
      }
    }
```

The problem is when a new instance of a Singleton class is created; that stays in memory for the lifetime of application, and since each unit test is supposed to be ran independently, this charactristics of Singleton class causes problems.

A solution is to "break" the pattern and add a new method for "resetting" the Singleton instance, and use that method **only** in unit tests.

Here's the purposed solution

```csharp
    class Singleton
    {
      private Singleton instance;
      public static Singleton Instance()
      {
        if(instance==null)
          instance=new Singleton();
        return instance;
      }
      public void Reset()
      {
        instance=new Singleton();
      }
      private Singleton()
      {
      }
    }
```

[SingletonPattern]: https://en.wikipedia.org/wiki/Singleton_pattern "Singleton Pattern"
