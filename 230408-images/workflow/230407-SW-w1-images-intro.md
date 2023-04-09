*********************
  2023-04-07  21:19
*********************
#PIL library

When developers write a Python module that they think others might find useful, they publish it in PyPI -- also known as the Python Package Index (https://pypi.org)

In this module, we’re going to be transforming and converting images using a popular library for image manipulation: the Python Imaging Library (PIL). 
The original PIL library hasn't been updated since 2009 and does not support Python 3.

There's a current fork of PIL called *Pillow*
		https://pypi.org/project/Pillow/
		https://pillow.readthedocs.io/en/stable/index.html
The Pillow library is packaged with the name `pillow`, but the module name in Python is still *PIL*.

On Linux it’s usually available as a native package
	$ sudo apt install python3-pil
For other environments, you should use Python's package installer, pip3
	$ pip3 install pillow
	$ python3
>>> import PIL

*********************
  2023-04-07  21:39
*********************
#API

When you write a program, you typically use a bunch of existing libraries for the programming language of your choice. These libraries provide APIs in the form of external or public functions, classes, and methods that other code can use to get their job done without having to create a lot of repeated code.

APIs can also be used by other pieces of software, even if they were written in a completely different programming language. For example, Cloud services use APIs that your programs can communicate with by making web calls.

An API is sort of like a promise. Even if the library's internal code changes, you expect the function to keep accepting the same parameters and returning the same results. That provides a stable *interface* to write your code with.
 
 Library authors are free to make improvements and changes to the code behind the interface, but they shouldn't make changes to the way the functions are called or the results they provide. Because this would break the code that depends on that library. When a library author needs to make a breaking change to an API, then they need to have a plan in place for communicating that change to their users. That's why breaking changes should be saved for major version increments of a library.
 
 https://semver.org/#summary
# Given a version number MAJOR.MINOR.PATCH, increment the:
    MAJOR version when you make incompatible API changes
    MINOR version when you add functionality in a backwards compatible manner
    PATCH version when you make backwards compatible bug fixes


*********************
  2023-04-07  21:52
*********************
# How to Make Sense of an API?
 
It might take you a bit of time to familiarize yourself with how the *library* operates.
In general, a good API should be descriptive. You should be able to look at a function's name and have a pretty good idea of what it will do. A well-designed API will follow patterns and *naming conventions*. That means that the functions, classes and methods should have names that help you understand what to expect from them. And when the name isn’t enough, you should have access to the documentation for each of the functions that will help you figure out what they do.

https://pillow.readthedocs.io/en/stable/reference/Image.html
	*Image Module*
The Image module provides a class with the same name which is used to represent a PIL image. The module also provides a number of factory functions, including functions to load images from files, and to create new images.

	$ ./01-rotate.py
нужен файл 'example.jpg'
This piece of code is pretty straightforward. Even without having seen this library before, you can probably guess that it opens an image called *.jpg, rotates it 45 degrees, and then shows it on the screen.

	$ ./02-rotate.py 
The following script creates nice thumbnails of all JPEG images in the current directory preserving aspect ratios with 128x128 max resolution.

Pillow's full documentation is published here:
		https://pillow.readthedocs.io/en/stable/index.html