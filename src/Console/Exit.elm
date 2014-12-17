module Console.Exit
  ( exitWith
  , exitFailure
  , exitSuccess
  ) where

{-| exit.

@docs exitWith, exitFailure, exitSuccess.
-}

import Console(..)
import Console.Internal as I

import Native.Console

{-| exit with provided exit code -}
exitWith : Int -> IO ()
exitWith i = I.IO (Native.Console.exitWith i)

{-| exit with exit code 1 -}
exitFailure : IO ()
exitFailure = exitWith 1

{-| exit with exit code 0 -}
exitSuccess : IO ()
exitSuccess = exitWith 0
