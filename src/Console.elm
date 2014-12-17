module Console
  ( IO
  , runConsole
  , (>>=), (>>>)
  , return
  ) where

{-| another implimentation IO in Elm. no npm dependencies.

Example

```
module Hello where

import Console(..)
import Console.Exit(exitSuccess)
import Console.IO as IO

main = runConsole <|
  IO.question "name? "   >>= \name ->
  IO.putStr   "Hello, "  >>>
  IO.putStrLn name       >>>
  exitSuccess
```

compile and add worker, then execute.

```
elm-make hello.elm --output hello.js
echo "Elm.worker(Elm.Hello)" >> hello.js
node hello.js
```

you can create custom IO functions. see Console.Internal, predefined IO actions, and Native module.

# execute IO
@docs runConsole

# monadic operators
@docs (>>=), (>>>), return
-}

import Console.Internal as I
import Graphics.Element(Element, empty)

import Native.Console

type alias IO a = I.IO a

{-| run IO action. return empty Element to use as main function.
-}
runConsole : IO () -> Element
runConsole (I.IO m) = m (\_ -> empty)

{-| monadic bind. -}
(>>=) : IO a -> (a -> IO b) -> IO b
(>>=) (I.IO m) f = I.IO (\e -> m (\a -> I.unIO (f a) e))
infixl 1 >>=

{-| monadic bind. without argument. (>>) in Haskell. -}
(>>>) : IO a -> IO b -> IO b
(>>>) (I.IO m) f = I.IO (\e -> m (\_ -> I.unIO f e))
infixl 1 >>>

{-| return value to IO monad. -}
return : a -> IO a
return a = I.IO (\f -> f a)
