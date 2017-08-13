Emacs_Configuration
========================================

Emacs Configuration based on Purcell's Emacs Configuration. It's working for Linux, Mac and Windows.

This Emacs configuration contains useful tools, such as company, yasnippet and so on, and supports the following programming language:
  - C/C++
  - Python
  - Tex with Auctex
  - MATLAB
  - HTML

## Requirements:
  - Emacs 24.1 or greater;
  - iPython and autopep8 are required for python, pylint is optinal for python style guide, and Jedi and python-epc are required for python completion;
  - zsh is required for multi-term (Modify shell preference in `init-multi-term.el`);
  - aspell is required for spell check (Modify the path for Windows in `init-preload-local.el`);
  - Tex Live is required for Auctex, and Skim is required for Mac OS X, Okular is required for Linux and Sumatra PDF is required for Windows, and also, for Windows, download libpng binary files [here](https://sourceforge.net/projects/ezwinports/files/) and copy all DLL files in bin to Emacs bin in order to support png images for Preview;
  - For Windows, follow [these instructions](http://xn--9dbdkw.se/diary/how_to_enable_GnuTLS_for_Emacs_24_on_Windows/index.en.html) to get TLS first. Just download gnutls and copy all DLL files in bin to Emacs bin;
  - Use blog-admin to manage blog and modify the corresponding configuration in `init-blog.el`;
  - External indexing tools, like `find` and `git` are needed for Projectile.

## Installation:
  - To install, clone this repo and move it to `~/.emacs.d`;
  - Put `utility/.gnus.el` in home directory and modify user information in .gnus.el and .emacs.d/.signature, and use gmail2bbdb to import contacts from Gmail;
  - Put `utility/config` in `~/.ssh/` and modify it for ssh host information;
  - Configure `install-mode` in `init.el` to be *full*, *programming* or *text*. Only necessary packages for programming will be configured when selecting *programming* and only necessary packages for text will be configured when selecting *text*. Default value is *full* and all packages will be configured;
  - When starting Emacs for the first time, required packages will be installed automatically;
  - After the installation is finished, when closing Emacs after opening a `.c` or `.cpp` file, `.emacs.d/semanticdb/` is created for SemanticDB.

## Note:
  - The default theme for Mac OS X and Windows is light style but dark style for Linux. Modify this in init-themes.el in lisp folder if you want;
  - Change the default font setting in init-preload-local.el;
  - `multi-term` is not supported for Windows. Use `C-u M-x shell` to open a new shell;
  - Run `tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti` to solve the weird characters problem or color problem in terminal mode;
  - For Mac OS X, put [.zshenv](https://github.com/wuliuxiansheng/Emacs_Configuration/blob/master/utility/.zshenv) in `utility` to `~/.`to solve Chinese display problem in terminal mode;
  - Turned off alarms totally to fix the the bug of Emacs 24.5 for Capitan EI that a square pops up in the middle of the buffer obscuring the text when the visable bell is working. Get rid of this in init-preload-local.el if you really need these alarms;
  - The size of the screen does affect the popwin. If the screen is too small for the current font, the popwin won't work and user needs to change the font size in init-preload-local.el;
  - For Windows, user needs to set the path for Tex Live, GitHub, SVN and Python;
  - For Windows, if it's not installed successfully for the first time, restart Emacs and it should be working;
  - For TeX Live on Mac and Windows, using pdfsync package is also working for forward and inverse search but less accurate. Thus, I recommend generating .synctex.gz rather than using pdfsync package to generate .pdfsync for forward and inverse search;
  - TeX mode for Windows sometimes gets stuck. Try `C-g` to cancel running;
  - gnupg 2.1 is required for EasyPG in Emacs 25;
  - `jedi-custom.el` can be used to customize Jedi, like adding some special **sys.path** when starting Jedi server (example is in `utility/jedi-custom.el`);
  - `cc-mode-header-custom.el` can be used to customize the include paths for company-c-headers package and `cc-mode-projects.el` can be used for EDE project configuration (examples are in `utility/cc-mode-header-custom.el` and `utility/cc-mode-projects.el`).
