# qr-web
A website for making QR codes writen in Ruby (running on WebAssembly) and javascript. Built on Prism and RQRCode_Core.

[Visit the website](https://qr.jonaseveraert.be)

## Development
This project has a development environment set up in VSCode.

All source files exist in the `src` directory. Files in the `build` directory should never be touched.

Using the [Run on save](https://marketplace.visualstudio.com/items?itemName=emeraldwalk.RunOnSave) extension, `build.sh` is executeed whenever a file inside of the `src` directory is edited and all the necessary files are (build and) copied to the `build` directory. (Not the most efficient, but this is ok for a small project).

[LiveServer](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) is set up to serve files in the `build` directory. 

You will need to have **SASS** installed to run the build script: [sass-lang.com/install](https://sass-lang.com/install)

**NOTE**: When you open a pull request, Netlify will generate a preview site. If you did not run the the `build.sh` script before pushing your changes, the preview will not reflect your changes. (If anyone has experience with netlify build commands, let me know).

## Contributing
Feel free to open issues for any reason.

Also, if you want, you can work on open issues.
