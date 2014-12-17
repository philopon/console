Elm.Native.Console = {};

Elm.Native.Console.make = function(elm) {
  elm.Native = elm.Native || {};
  elm.Native.Console = elm.Native.Console || {};
  if (elm.Native.Console.values) return elm.Native.Console.values;

  var readline = require('readline');
  var fs       = require('fs');
  var Result   = Elm.Result.make(elm);
  var Maybe    = Elm.Maybe.make(elm);

  function writeStdOut(a, next){
    var flushed = process.stdout.write(a);
    if(flushed) {
      return next();
    } else {
      process.stdout.on('drain', next);
    }
  }

  function question(prompt, next){
    var reader = readline.createInterface({
      input: process.stdin,
      output: process.stdout
    });

    reader.question(prompt, function(line){
      reader.close();
      return next(line);
    });

  }

  function exitWith(code, next){
    process.exit(code);
    return next();
  }

  function readFile(path, next){
    fs.readFile(path, function(err, data){
      if(!!err) {
        return next(Result.Err(err.toString()));
      } else {
        return next(Result.Ok(data.toString()));
      }
    });
  }

  function writeFile(path, cont, next){
    fs.writeFile(path, cont, function(err){
      if(!!err){
        return next(Maybe.Just(err.toString()));
      } else {
        return next(Maybe.Nothing);
      }
    });
  }

  return elm.Native.Console.values = {
    writeStdOut: F2(writeStdOut),
    question:    F2(question),
    exitWith:    F2(exitWith),
    readFile:    F2(readFile),
    writeFile:   F3(writeFile)
  };
};
