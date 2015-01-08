---
layout: post
title:  "How to use PHP Built-in web server"
name: how-to-use-php-built-in-web-server
date:   2014-02-09 10:27:27
categories: 
- PHP
tags: php web-server
lang: en
---
Since PHP 5.4 onward; PHP has been geared with a built-in server, which will come in handy when you want to test things quickly or just don’t feel like installing a web server!

This is how it’s done, go in the directory you want to start a web server and type following command.



    php -S <IP Address>:<Port>

Replace IP Address with either “localhost” or anything ranging from 127.0.0.1 to 127.255.255.254 and Port with any number as the port number.



    php -S localhost:8008

Now if you open localhost:8008 in your browser you should be able to see your PHP files inside the chosen directory; It’s cool isn’t it?

You can learn more about this on [PHP built-in server in the PHP website](http://www.php.net/manual/en/features.commandline.webserver.php)