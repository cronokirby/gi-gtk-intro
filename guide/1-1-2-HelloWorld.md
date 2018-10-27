## Basic Callbacks

The goal of this section is to learn about some the basic button widget,
as well as how to set callbacks to be able to run certain actions when the user
interactions with our application.

### Boilerplate

Like [last time](1-1-1-Basics.md) we need to set the right language
extensions, and import the necessary libraries:
```haskell
{-# LANGUAGE OverloadedLabels  #-}
{-# LANGUAGE OverloadedStrings #-}
import qualified GI.Gtk as Gtk
import Data.GI.Base
```

### Setting up a window
Once again the first step is to setup `Gtk` itself:
```haskell
main :: IO ()
main = do
    Gtk.init Nothing
```

And then we can create the window like last time:
```haskell
    window <- new Gtk.Window 
        [ #title := "Window"
        , #defaultWidth := 200
        , #defaultHeight := 200
        ]
    on window #destroy Gtk.mainQuit
```
Notice that we've added an extra line to this sequence compared to last time:
`on` lets us set a callback to a certain widget's property. In this case, when
the window gets destroyed, the action `Gtk.mainQuit` is run, correctly closing
Gtk's main loop. 

The callback action can be anything of type `IO ()`, from
`Gtk.mainQuit` to `dangerouslyFireMissiles` :)

Last time, we didn't have any such logic, so when the user closed the window,
our application would sit there hanging. This time however, we do the cleanup correctly,
and quit the main loop once our window gets destroyed.

This is an example of using callbacks with widgets, we'll see a few more quite soon.

### Setting up a button
Gtk comes with widgets that let us wrap other widgets. We want to add a button
to this window, but it will look nicer if we wrap it in a box specifically designed
to contain buttons:
```haskell
    buttonBox <- new Gtk.ButtonBox
        [ #orientation := Gtk.OrientationHorizontal
        ]
    #add window buttonBox
```
We set the orientation to horizontal, which tells us how buttons will be layed out,
although we'll only need one button anyways. Then we use the `add` property
on our window to put our mint buttonBox into our window.

Now it's time for the button itself:
```haskell
    button <- new Gtk.Button
        [ #label := "Hello World"
        ]
    on button #clicked (putStrLn "Hello")
    on button #clicked (#destroy window)
    #add buttonBox button
```
The label property lets us put some text on the button for the user.

More interesting are the callbacks: this time we've attached 2 actions to the same
property. Whenever the button gets clicked, both will fire. As mentioned previously,
this are just normal `IO` actions. The first will print a message, and the second
will destroy our window, and thus close our application.

### Showing our work
All that's left is to show the main widget, and enter the main loop:
```haskell
    #showAll window
    Gtk.main
```

If you run the program, you should see something like this:

![](https://developer.gnome.org/gtk3/stable/hello-world.png)

If you click on the button, the window closes, a nice greeting arrives in your
terminal, and the application closes. Very nice!
