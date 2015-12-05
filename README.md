Emacs_Configuration
========================================

Emacs Configuration based on Purcell's Emacs Configuration. It's working for Linux, Mac OS X and Windows.

This Emacs configuration contains useful tools, such as auto-complete, yasnippet, pymacs and so on, and supports the following programming language:
  - C/C++
  - Python
  - Tex with Auctex
  - MATLAB
  - HTML

## Requirements:
  - Emacs 23.3 or greater (Emacs 24 is prefered);
  - iPython, rope, ropemacs, pymacs is required for python;
  - aspell is required for spell check (Modify the path for Windows in init-preload-local.el);
  - For Windows, follow [these instructions](http://xn--9dbdkw.se/diary/how_to_enable_GnuTLS_for_Emacs_24_on_Windows/index.en.html) to get TLS first. Just download gnutls and copy all DLL files in bin to Emacs bin.

## Installation:
  - To install, clone this repo and move .emacs.d to ~/.emacs.d;
  - When starting Emacs for the first time, required packages will be installed automatically.

## Note:
  - The default theme for Mac OS X and Windows is light style but dark style for Linux. Modify this in init-themes.el in lisp folder if you want;
  - Change the default font setting in init-preload-local.el;
  - `Auctex`, `Git`, `SVN`, `multi-term` and `emacsclient` are not supported for Windows (they may come later);
  - Run `tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti` to solve the weird characters problem or color problem in terminal mode;
  - For Mac OS X, put [.zshenv](https://github.com/wuliuxiansheng/Emacs_Configuration/blob/master/utility/.zshenv) in `utility` to `~/.`to solve Chinese display problem in terminal mode;
  - Turned off alarms totally to fix the the bug of Emacs 24.5 for Capitan EI that a square pops up in the middle of the buffer obscuring the text when the visable bell is working. Get rid of this in init-preload-local.el;
  - The size of the screen does affect the popwin. If the screen is too small for the current font, the popwin won't work and user needs to change the font size in init-preload-local.el;
  - Pymacs is supported for Windows now. When opening a Python file is not successful, kill the buffer and reopen the file to load Pymacs properly;
  - For Windows, bind M-SPC to set mark or unset mark rather than using C-SPC because C-SPC is used to change the input method in Windows.
