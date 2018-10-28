{-# LANGUAGE OverloadedLabels  #-}
{-# LANGUAGE OverloadedStrings #-}
import qualified GI.Gtk as Gtk
import Data.GI.Base

main :: IO ()
main = do
    Gtk.init Nothing

    window <- new Gtk.ApplicationWindow
        [ #title := "exampleapp"
        ]
    on window #destroy Gtk.mainQuit

    #showAll window
    Gtk.main
