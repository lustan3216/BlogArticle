someFunction = function(str) {
  console.log('Original function: ' + str);
}

someFunction = (function() {
  var cached_function = someFunction;

  return function(str) {
    console.log('New function before: ' + str);

    cached_function.apply(this, arguments); // use .apply() to call it

    console.log('New function after: ' + str);
  };
}());

someFunction('It works!');
