{-# LANGUAGE OverloadedLabels  #-}
{-# LANGUAGE OverloadedStrings #-}
import qualified GI.Gtk as Gtk
import Data.GI.Base

main :: IO ()
main = do
    Gtk.init Nothing

    window <- new Gtk.Window 
        [ #title := "Window"
        , #defaultWidth := 200
        , #defaultHeight := 200
        ]
    on window #destroy Gtk.mainQuit

    buttonBox <- new Gtk.ButtonBox
        [ #orientation := Gtk.OrientationHorizontal
        ]
    #add window buttonBox

    button <- new Gtk.Button
        [ #label := "Hello World"
        ]
    on button #clicked (putStrLn "Hello World")
    on button #clicked (#destroy window)
    #add buttonBox button

    #showAll window
    Gtk.main
