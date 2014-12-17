elm-console
===
another implimentation IO in Elm.

install
---

```
elm-package install philopon/console
```

How to use
---

1. write code.

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

2. compile code.

```
elm-make hello.elm --output hello.js
```

3. add calling worker function.

```
echo "Elm.worker(Elm.Hello)" >> hello.js
```

4. execute

```
node hello.js
```
