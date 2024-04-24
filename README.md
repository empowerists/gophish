![gophish logo](https://raw.github.com/gophish/gophish/master/static/images/gophish_purple.png)

Gophish
=======

![Build Status](https://github.com/gophish/gophish/workflows/CI/badge.svg) [![GoDoc](https://godoc.org/github.com/gophish/gophish?status.svg)](https://godoc.org/github.com/gophish/gophish)

Gophish: Open-Source Phishing Toolkit

[Gophish](https://getgophish.com) is an open-source phishing toolkit designed for businesses and penetration testers. It provides the ability to quickly and easily setup and execute phishing engagements and security awareness training.

### Install

Installation of Gophish is dead-simple - just download and extract the zip containing the [release for your system](https://github.com/gophish/gophish/releases/), and run the binary. Gophish has binary releases for Windows, Mac, and Linux platforms.

### Building From Source
**If you are building from source, please note that Gophish requires Go v1.10 or above!**

To build GophishLastPlus from source, simply run ```git clone https://github.com/Nitraxenius/gophishLastPLUS.git``` and ```cd``` into the project source directory. Then, run ```go build```. After this, you should have a binary called ```gophish``` in the current directory.

### Docker
You can also use Gophish via the official Docker container [here](https://hub.docker.com/r/gophish/gophish/).

### Setup
After running the Gophish binary, open an Internet browser to https://localhost:3333 and login with the default username and password listed in the log output.
e.g.
```
time="2024-08-29T01:20:19Z" level=info msg="Please login with the username admin and the password 5213j428914767gy"
```

Releases of Gophish prior to v0.10.1 have a default username of `admin` and password of `gophish`.
## NEW FEATURES
Thank you to gleenzw for this enhancement. I had the opportunity to fix some bugs and put your pull request in the actual last version of gophish.

Pull request reference: [Gleenzw Pull Request](https://github.com/gophish/gophish/pull/1929)

This fork adds the ability to create new events such as Word Document Opened, for example.

To do this, it's very simple, there's nothing to do on the server side, everything is automatically handled on the client side with `/event` (not `/arbevent` ;) ) and you add the parameters of your request to give an example:
```
http://localhost/event?rid=Hgdu1S&title=Word Document Opened&label=label-clicked&icon=fa-file-word-o&color=%23F39C12&ua=0
```

Breaking down this URL, we have the following parameters:

- `rid` - the unique campaign RID
- `title` - the title of the event to display in the event list and status
- `label` - label color for the status
- `icon` - the icon to use in the event list
- `color` - color to use in the timeline graph and donuts
- `ua` - either 0 or 1, whether or not to display the user agent. Defaults to 0.

And just with that, a new entry will appear.

**Word Macros Enabled**

```
http://localhost/arbevent?rid=aIakOWF&title=Word Macros Enabled&label=label-danger&icon=fa-file-word-o&color=%23ff0000&sub_text=Username: Bob&sub_icon=fa fa-user&sub_text=PC Name: DESKTOP-4C&sub_icon=fa fa-desktop
```

Having a look at this URL, we have the extra parameters to display the text and icons under the main event heading:

- `sub_text` - the sub text
- `sub_icon` - the sub icon

You can pass multiple values using the same parameter name, in the order you want them to appear (as is done in the above example). They are assembled into a pair of arrays server side, one for the text one for the icons.

In the database:
Events are stored with a message of "Arbitrary Event" in the database to distinguish them from other events. Their URL payload is parsed to render them. For example, here's the database entry for the 'Word Document Opened' event.

```
1140|130|gophish.test.9001+7@gmail.com|2020-08-08 20:30:51.377489+00:00|Arbitrary Event|{"payload":{"color":["#F39C12"],"icon":["fa-file-word-o"],"label":["label-clicked"],"rid":["aIakOWF"],"title":["Word Document Opened"],"ua":["1"]},"browser":{"address":"::1","user-agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36"}}
```

### Documentation

Documentation can be found on our [site](http://getgophish.com/documentation). Find something missing? Let us know by filing an issue!

### Issues

Find a bug? Want more features? Find something missing in the documentation? Let us know! Please don't hesitate to [file an issue](https://github.com/gophish/gophish/issues/new) and we'll get right on it.

### License
```
Gophish - Open-Source Phishing Framework

The MIT License (MIT)

Copyright (c) 2013 - 2020 Jordan Wright

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software ("Gophish Community Edition") and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
