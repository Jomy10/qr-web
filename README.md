# qr-web
A website for making QR codes writen in Ruby (running on WebAssembly) and javascript. Build on Prism and RQRCode_Core.

**The website will be published in a few days, the project is still under construction.**

## Development
This project has a development environment set up in VSCode.

All source files exist in the `src` directory. Files in the `build` directory should never be touhed.

Using the [Run on save](https://marketplace.visualstudio.com/items?itemName=emeraldwalk.RunOnSave) extension, `build.sh` is executeed whenever a file inside of the `src` directory is edited and all the necessary files are (build and) copied to the `build` directory. (Not the most efficient, but this is ok for a small project).

[LiveServer](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) is set up to serve files in the `build` directory. 

You will need to have **SASS** installed to run the build script: [sass-lang.com/install](https://sass-lang.com/install)

## Contributing
Feel free to open issues for any reason.

Also, if you want, you can work on open issues.
