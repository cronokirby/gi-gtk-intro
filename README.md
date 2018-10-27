## What is this?

This is an attempt to translate [this guide](https://developer.gnome.org/gtk3/stable/)
into haskell, and hopefully help people get into gui development
with `gi-gtk` in haskell.

## How is this organised?

This loosely follows the organisation of the `gtk` tutorial, but
isn't an exact 1:1 translation. I try to cover the same material,
and the guis we make are the same as in the tutorial, but the explanations
go over the haskell aspect. 

I've split things up so that each program
we produce corresponds to a single a haskell file in `src` and
a single markdown explanation in `guide`. The haskell files always
match the naming of the markdown files.

I've added a numbering system, under the following scheme:
```
section-subsection-program
```

## How do I run the examples?

I'd recommend you checkout the [haskell-gi project](https://github.com/haskell-gi/haskell-gi)
for up to date information on how to acquire the necessary dependencies,
as well as installing the haskell libraries.

## Contributing / Reporting Issues

If there's something you don't understand in the guide, or that I 
didn't explain well, or any kind of addition or issue you'd like to bring up
feel free to make a new issue on this repository.

If people want to contribute additions I'll happily accept those as well :)
