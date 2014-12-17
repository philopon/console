module Hello where

import Console(..)
import Console.Exit(exitSuccess)
import Console.IO as IO

main = runConsole <|
  IO.question "name? "   >>= \name ->
  IO.putStr   "Hello, "  >>>
  IO.putStrLn name       >>>
  exitSuccess
