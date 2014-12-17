module Console.Internal
  ( IO(..), unIO
  ) where

{-| internal module to create custom IO actions.

@docs IO, unIO
-}

import Graphics.Element(Element)

type IO a = IO ((a -> Element) -> Element)

{-| unwrap IO monad -}
unIO : IO a -> ((a -> Element) -> Element)
unIO (IO m) = m
