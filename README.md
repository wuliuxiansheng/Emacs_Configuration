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
  - Emacs 23.3 or greater(Emacs 24 is prefered);
  - rope, ropemacs, pymacs is required for python;
  - aspell is required for spell check;
  - For Windows, follow [these instructions](http://xn--9dbdkw.se/diary/how_to_enable_GnuTLS_for_Emacs_24_on_Windows/index.en.html) to get TLS first. Just download gnutls and copy all DLL files in bin to Emacs bin.
  
## Installation:
  - To install, clone this repo and move .emacs.d to ~/.emacs.d;
  - When starting Emacs for the first time, required packages will be installed automatically.

## Note:
  - The default theme for Mac OS X and Windows is light style but dark style for Linux. Modify this in init-themes.el in lisp folder if you want;
  - Change the default font setting in init-preload-local.el;
  - Pymacs is not supported for Windows;
  - git, github and server configurations are not supported for Windows.


