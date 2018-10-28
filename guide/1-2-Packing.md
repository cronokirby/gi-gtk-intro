## Packing Widgets

The goal of this section is to learn how to group and fit together
multiple widgets inside another one.

At the end of this section, we should have a simple window containing
multiple widgets like this:

![](https://developer.gnome.org/gtk3/3.24/grid-packing.png)

### Setting up a window
We're going to first set up the necessary language extensions, then import the
right libraries, then finally set up a window.
We can quickly gloss over the details here, since we've seen all of this before:
```haskell
{-# LANGUAGE OverloadedLabels  #-}
{-# LANGUAGE OverloadedStrings #-}
import qualified GI.Gtk as Gtk
import Data.GI.Base

main :: IO ()
main = do
    Gtk.init Nothing

    window <- new Gtk.Window
        [ #title := "Window"
        , #borderWidth := 10
        ]
    on window #destroy Gtk.mainQuit
```

### Setting up a grid
This time we want to add multiple buttons arranged in a certain way, and a widget
to help us do that is `Gtk.Grid`:
```haskell
    grid <- new Gtk.Grid []
    #add window grid
```
We create a new `Grid` widget with no properties, and embed it in the window.
Now we can use this grid to add our buttons.

### Adding the buttons
When adding a widget to a grid, we need to worry about 2 things:
    - Where does this widget go?
    - How large is this widget?

To this effect, we'll need 4 parameters to place a widget in a grid:
the first 2 specify the column and row of the widget, and the second 2
specify the width and height of the widget in columns and rows.

Knowing this, let's look at our buttons:
```haskell
    button1 <- new Gtk.Button
        [ #label := "Button 1"
        ]
    on button1 #clicked (putStrLn "Hello 1")
    #attach grid button1 0 0 1 1

    button2 <- new Gtk.Button
        [ #label := "Button 2"
        ]
    on button2 #clicked (putStrLn "Hello 2")        
    #attach grid button2 1 0 1 1

    quit <- new Gtk.Button
        [ #label := "Quit"
        ]
    on quit #clicked (#destroy window)
    #attach grid quit 0 1 2 1
```

We first add 2 buttons side by side on row 0, each of them taking
taking 1 column and 1 row of space. Then we add a 3rd button on the row below them,
but this with a width of 2 columns, so that it stretches to match both buttons.


### Showing the widgets
As always, now that we've set it up, we need to show them, and then relinquish
control to Gtk:
```haskell
    #showAll window
    Gtk.main    
```

At this point, we should have a little gui like in the image, with 3 buttons
neatly packed into a grid.
