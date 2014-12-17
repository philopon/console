module Console
  ( IO
  , runConsole
  , (>>=), (>>>)
  , return
  ) where

import Console.Internal as I
import Graphics.Element(Element, empty)

import Native.Console

type alias IO a = I.IO a

runConsole : IO () -> Element
runConsole (I.IO m) = m (\_ -> empty)

(>>=) : IO a -> (a -> IO b) -> IO b
(>>=) (I.IO m) f = I.IO (\e -> m (\a -> I.unIO (f a) e))
infixl 1 >>=

(>>>) : IO a -> IO b -> IO b
(>>>) (I.IO m) f = I.IO (\e -> m (\_ -> I.unIO f e))
infixl 1 >>>

return : a -> IO a
return a = I.IO (\f -> f a)
