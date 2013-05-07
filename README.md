# swig-cli [![Build Status](https://travis-ci.org/Petrlds/swig-cli.png?branch=master)](https://travis-ci.org/Petrlds/swig-cli)

render JSON data with a Swig template file (see [http://paularmstrong.github.io/swig/](http://paularmstrong.github.io/swig/)) from the command line

## Examples
Specify input file, output file and swig template
```
swig -f input.json -o output.html swig_template.html
```
Use stdin like input, specify output file and swig template
```
swig -o output.html swig_template.html < some_json.json
```
Use stdin like input, specify swig template and output to stdout
```
swig cat some_json.json | swig swig_template.html
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).


## License
Copyright (c) 2013 Petr Smirnov  
Licensed under the MIT license.
