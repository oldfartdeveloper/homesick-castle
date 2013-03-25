homesick-castle
===============

See [technicalpickles/homesick](https://github.com/technicalpickles/homesick) for setup. It goes something like this:

```shell
gem install homesick

homesick clone git://github.com/jamesgary/homesick-castle.git

# For some reason, `clone` doesn't update submodules, but `pull` does
homesick pull homesick-castle

homesick symlink homesick-castle
```
