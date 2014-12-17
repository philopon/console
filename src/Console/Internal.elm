module Console.Internal
  ( IO(..), unIO
  ) where

import Graphics.Element(Element)

type IO a = IO ((a -> Element) -> Element)

unIO : IO a -> ((a -> Element) -> Element)
unIO (IO m) = m
