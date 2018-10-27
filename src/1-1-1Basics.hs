{-# LANGUAGE OverloadedLabels  #-}
{-# LANGUAGE OverloadedStrings #-}
import qualified GI.Gtk as Gtk
import Data.GI.Base

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
