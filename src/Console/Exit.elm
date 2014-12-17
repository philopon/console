module Console.Exit
  ( exitWith
  , exitFailure
  , exitSuccess
  ) where

import Console(..)
import Console.Internal as I

import Native.Console

exitWith : Int -> IO ()
exitWith i = I.IO (Native.Console.exitWith i)

exitFailure : IO ()
exitFailure = exitWith 1

exitSuccess : IO ()
exitSuccess = exitWith 0
