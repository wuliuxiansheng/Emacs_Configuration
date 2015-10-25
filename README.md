Emacs_Configuration
========================================

Emacs Configuration based on Purcell's Emacs Configuration. It's working for Linux and Mac OS X. It should work for Windows but hasn't been tested yet.

## Requirements:
  - Emacs 23.3 or greater(Emacs 24 is prefered);
  - rope, ropemacs, pymacs is required for python;
  - For windows, follow [these instructions](http://xn--9dbdkw.se/diary/how_to_enable_GnuTLS_for_Emacs_24_on_Windows/index.en.html) to get TLS first. Just download gnutls and copy all DLL files in bin to Emacs bin.
  
## Installation:
  - To install, clone this repo and move .emacs.d to ~/.emacs.d;
  - When starting Emacs for the first time, required packages will be installed automatically.

## Note:
  - The default theme for Mac OS X and Windows is light style but dark style for Linux. Modify this in init-themes.el in lisp folder if you want.
  - Pymacs is not supported for Windows;
  - git, github and server configurations are not supported for Windows.


