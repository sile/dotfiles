dotfiles
=========

```sh
$ mkdir ~/dev
$ cd ~/dev/
$ git clone https://github.com/sile/dotfiles.git
$ cd dotfiles/

$ ./install.sh
$ ./setup.sh

$ gh repo clone rust-lang/rust -- --filter=blob:none --sparse
$ cd rust
$ git sparse-checkout set library
```

Font
----

- https://github.com/yuru7/HackGen
  - `$ gh release download v2.10.0 -R yuru7/HackGen`
  - HackGen35Console-Regular.ttf
