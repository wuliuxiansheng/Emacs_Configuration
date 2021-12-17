Emacs_Configuration
========================================

Emacs Configuration based on Purcell's Emacs Configuration. It's working for Linux, Mac and Windows.

This Emacs configuration contains useful tools, such as company, yasnippet and so on, and supports the following programming languages and framework:
  - C/C++
  - Python
  - TeX with Auctex
  - MATLAB
  - HTML
  - ROS
  - Arduino

## Requirements:
  - Emacs 24.3 or greater;
  - iPython and autopep8 are required for python, pylint is optinal for python style guide, Jedi and python-epc are required for python completion, and flake8 are required for Python syntax checking;
  - zsh is required for multi-term (Modify shell preference in `init-multi-term.el`);
  - aspell is required for spell check (Modify the path for Windows in `init-preload-local.el`);
  - Tex Live is required for Auctex, and Skim is required for Mac OS X, Okular is required for Linux and Sumatra PDF is required for Windows, and also, for Windows, download libpng binary files [here](https://sourceforge.net/projects/ezwinports/files/) and copy all DLL files in bin to Emacs bin in order to support png images for Preview;
  - For Windows, follow [these instructions](http://xn--9dbdkw.se/diary/how_to_enable_GnuTLS_for_Emacs_24_on_Windows/index.en.html) if using Emacs 24 to get TLS first. Just download gnutls and copy all DLL files in bin to Emacs bin. If using Emacs 25, download GnuTLS libraries [here](http://alpha.gnu.org/gnu/emacs/pretest/windows/). Download `emacs-25-i686-deps.zip` for 32-bit Windows OS, or download `emacs-25-x86_64-deps.zip` for 64-bit Windows OS;
  - Use blog-admin to manage blog and modify the corresponding configuration in `init-blog.el`;
  - External indexing tools, like `find` and `git` are needed for Projectile;
  - ROS support is configured only for Linux machine and ros-DISTRO-rosemacs is required. The default ROS version is Kinetic which can be modified in `init-ros.el`;
  - Arduino IDE 1.6.6 or later is required for Arduino configuration.

## Installation:
  - To install, clone this repo and move it to `~/.emacs.d`;
  - Put `utility/.gnus.el` in home directory and modify user information in .gnus.el and .emacs.d/.signature, and use gmail2bbdb to import contacts from Gmail;
  - Put `utility/config` in `~/.ssh/` and modify it for ssh host information;
  - Configure `install-mode` in `init.el` to be *full*, *programming* or *text*. Only necessary packages for programming will be configured when selecting *programming* and only necessary packages for text will be configured when selecting *text*. Default value is *full* and all packages will be configured;
  - When starting Emacs for the first time, required packages will be installed automatically;
  - For RTags users, run `M-x rtags-install` and `M-x irony-install-server` to finish RTags and Irony installation;
  - After the installation is finished, when closing Emacs after opening a `.c` or `.cpp` file with `M-x cedet-enable`, `.emacs.d/semanticdb/` is created for SemanticDB;
  - For LSP users, install `python-lsp-server` for Python3 (`python-language-server` for Python2.7) and most recent `clangd` for C/C++.

## Note:
  - The default theme for Mac OS X and Windows is light style but dark style for Linux. Modify this in init-themes.el in lisp folder if you want;
  - Change the default font setting in init-preload-local.el;
  - `multi-term` is not supported for Windows. Use `C-u M-x shell` to open a new shell;
  - Run `tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti` to solve the weird characters problem or color problem in terminal mode;
  - For Mac OS X, Add contents in [.zshenv](https://github.com/wuliuxiansheng/Emacs_Configuration/blob/master/utility/.zshenv) in `utility` to `~/.zshenv` to solve Chinese display problem in terminal mode if using Zsh;
  - Turned off alarms totally to fix the the bug of Emacs 24.5 for Capitan EI that a square pops up in the middle of the buffer obscuring the text when the visable bell is working. Get rid of this in init-preload-local.el if you really need these alarms;
  - The size of the screen does affect the popwin. If the screen is too small for the current font, the popwin won't work and user needs to change the font size in init-preload-local.el;
  - For Windows, user needs to set the path for Tex Live, GitHub, SVN and Python;
  - For Windows, if it's not installed successfully for the first time, restart Emacs and it should be working;
  - For TeX Live on Mac and Windows, using pdfsync package is also working for forward and inverse search but less accurate. Thus, I recommend generating .synctex.gz rather than using pdfsync package to generate .pdfsync for forward and inverse search;
  - TeX mode for Windows sometimes gets stuck. Try `C-g` to cancel running;
  - gnupg 2.1 is required for EasyPG in Emacs 25;
  - `.emacs.d/jedi-custom.el` can be used to customize Jedi, like adding some special **sys.path** when starting Jedi server (example is in `utility/jedi-custom.el`);
  - `.emacs.d/cc-mode-header-custom.el` can be used to customize the include paths for company-c-headers package and `.emacs.d/cc-mode-projects.el` can be used for EDE project configuration (examples are in `utility/cc-mode-header-custom.el` and `utility/cc-mode-projects.el`);
  - Arduino IDE path can be modified in `init-arduino.el`.
