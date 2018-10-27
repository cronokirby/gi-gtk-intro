Before reading this, check out the [README](../README.md) for instructions
on installing the necessary libraries to run the code examples.

This section corresponds to the first example in [this page](https://developer.gnome.org/gtk3/stable/gtk-getting-started.html)


## Basic Window
The goal of this section is to set up a basic window as an example
of how to interact with the gtk api. By the end of this section,
we should have a window like this
![](https://developer.gnome.org/gtk3/stable/window-default.png)


### Necessary Language Extensions

We first need this extension:
```haskell
{-# LANGUAGE OverloadedLabels #-}
```
Without going into the *how* of this extension (which remains more
or less magic to me anyways), the *why* of this extension is that it lets
us get some nice syntax for interacting with properties of objects,
as we'll see later.

And then good old `OverloadedStrings` to let us use string literals
for `Text` values:
```haskell
{-# LANGUAGE OverloadedStrings #-}
```

### Necessary Imports

Now it's time to import the libraries we'll be using:
```haskell
import qualified GI.Gtk as Gtk
import Data.GI.Base
```
We import the `Gtk` bindings themselves qualified, but import utility
functions for working with `GObject` stuff verbatim.

### Setting up the window

This part is simple enough to just have it all in one block, so here we go:
```haskell
main :: IO ()
main = do
    Gtk.init Nothing
    win <- new Gtk.Window
        [ #title := "Window"
        , #defaultWidth := 200
        , #defaultHeight := 200
        ]
    #showAll win
    Gtk.main
```

At the beginning of the main function, we need to call `Gtk.init` to set
everything up, and then at the end, we relinquish control to its main
loop with `Gtk.main`.

The interesting part is the creation of the window. Thanks to
`OverloadedLabels` We can create a new window and set its properties in
a nice way. As you might've guessed, we've created a window with a certain
title and default dimensions.

The final step is to show the window, which we do again using 
`OverloadedLabels` to access a "method" of the object.
