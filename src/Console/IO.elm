module Console.IO
  ( putStr, putStrLn
  , question, readLn
  , print

  , FilePath
  , readFile, writeFile
  ) where

import Console(..)
import Console.Internal as I

import Native.Console

import String
import Result(Result)

type alias FilePath = String

putStr : String -> IO ()
putStr s = I.IO (Native.Console.writeStdOut s)

putStrLn : String -> IO ()
putStrLn a = putStr (String.append a "\n")

question : String -> IO String
question q = I.IO (Native.Console.question q)

readLn : IO String
readLn = question ""

print : a -> IO ()
print = toString >> putStrLn

readFile : FilePath -> IO (Result String String)
readFile path = I.IO (Native.Console.readFile path)

writeFile : FilePath -> String -> IO (Maybe String)
writeFile path cont = I.IO (Native.Console.writeFile path cont)
