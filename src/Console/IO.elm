module Console.IO
  ( putStr, putStrLn
  , question, readLn
  , print

  , FilePath
  , readFile, writeFile
  ) where

{-| IO actions Prelude in Haskell.

# stdout
@docs putStr, putStrLn, print

# stdin
@docs question, readLn

# file operation
@docs readFile, writeFile
-}

import Console(..)
import Console.Internal as I

import Native.Console

import String
import Result(Result)

type alias FilePath = String

{-| output to stdout without trailing LF.

this function is buggy(sometime lost input). use cafuly.
-}
putStr : String -> IO ()
putStr s = I.IO (Native.Console.writeStdOut s)

{-| output to stdout with trailing LF. -}
putStrLn : String -> IO ()
putStrLn a = putStr (String.append a "\n")

{-| read stdin with prompt. -}
question : String -> IO String
question q = I.IO (Native.Console.question q)

{-| read stdin without prompt. -}
readLn : IO String
readLn = question ""

{-| show and output to stdout with trailing LF. -}
print : a -> IO ()
print = toString >> putStrLn

{-| read file -}
readFile : FilePath -> IO (Result String String)
readFile path = I.IO (Native.Console.readFile path)

{-| write file

return Just ERR_MSG when error occured.
-}
writeFile : FilePath -> String -> IO (Maybe String)
writeFile path cont = I.IO (Native.Console.writeFile path cont)
