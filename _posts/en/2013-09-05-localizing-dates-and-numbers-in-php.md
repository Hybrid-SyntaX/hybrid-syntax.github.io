---
layout: post
title:  "Localizing Dates and Numbers in PHP"
name: localizing-dates-and-numbers-in-php
date:   2013-09-05 10:27:27
permalink: /en/blog/localizing-dates-and-numbers-in-php.html
author: Abbas Allahyari
categories:
- Web Dev
- PHP
tags: i18n internationalization locale localization php
lang: en
references:
- Internationalization|http://php.net/manual/en/book.intl.php
- IntlDateFormatter class|http://php.net/manual/en/class.intldateformatter.php
- icu::SimpleDateFormat Class Reference|http://icu-project.org/apiref/icu4c/classSimpleDateFormat.html
- NumberFormatter class|http://php.net/manual/en/class.numberformatter.php
---
There are times that English isn’t just the only language in the world, and Gregorian calendar isn’t just the only calendar out there! What would you do in such situation?

The answer is simple PHP [Internationalization](http://php.net/manual/en/book.intl.php){:external}, which utilizes ICU library.

This is how it’s done. first of all you got to make sure that extension enabled. try running this code; In the returned array you should be able to find “intl”.


```php
get_loaded_extensions();
```

if it’s not there, you got to edit php.ini file and uncomment  the following line.



    extension=php_intl.dll

Also in the case you’re using XAMPP, you should include the path to php folder in your PATH system environment variable.

Restart the server, and now you’re ready to see some magic!

Now you use [IntlDateFormatter class](http://php.net/manual/en/class.intldateformatter.php){:external}, in order to localize dates; The following code snippet shows how it’s done.


```php
$date_format='EEEE، d MMMM Y';

$fmt = new IntlDateFormatter("fa_IR@calendar=persian", IntlDateFormatter::FULL, IntlDateFormatter::FULL,

"Asia/Tehran", IntlDateFormatter::TRADITIONAL,$date_format);

 echo $fmt->format(intval(time()));
```

And now you get the today’s date in Persian calendar which is



    پنجشنبه، ۱۴ شهریور ۱۳۹۲

For more info on dates format you may take a look at [icu::SimpleDateFormat Class Reference](http://icu-project.org/apiref/icu4c/classSimpleDateFormat.html){:external}.

Localizing numbers

The good news, you still use the same extension that you just enabled earlier. no more hassle.

This time you use [NumberFormatter class](http://php.net/manual/en/class.numberformatter.php){:external}. the following code prints 1337 number in Persian.


```php
$persianNumberFormatter=new NumberFormatter("fa_IR",NumberFormatter::IGNORE);
echo $persianNumberFormatter->format(1337);
```

which results in



    ۱۳۳۷

Now, there’s this cool value which $style parameter gets is NumberFormatter::SPELLOUT. swap the NumberFormatter::IGNORE for that, and see the magic happen!



    یک هزار و سیصد و سی و هفت

Isn’t that awesome?!

{:external: rel="external" target="_blank" }
