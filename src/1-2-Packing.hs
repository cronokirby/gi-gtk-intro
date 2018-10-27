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

    grid <- new Gtk.Grid []
    #add window grid

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

    #showAll window
    Gtk.main    
