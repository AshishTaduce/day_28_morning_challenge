// Challenge
// Flatten a list
// Create a function that takes a list. This list can have all kinds of items, even other lists. The function should return a single, flat, one-dimensional, list with all elements. Here are the conditions:
//
// - If the item is a list, include each item in it and the following still apply:
// - If the item is a Function, include the function's output, not the function itself.
// - If the item is a plain Object or a Primitive, include it as is.

// Example
// flattenList([1, "2", [3, function () { return 4; }, [ "five" ], "six", true, { prop: "val" }]])
//  ➞ [1, "2", 3, 4, "five", "six", true, { prop: "val" }]
//TODO test cases

List flattenList(List list) {
  List <dynamic> flatList = [];
  for (dynamic x in list) {
    if (x is Function) {
       flatList.add(x());
    }
    else if (x is String) {
      flatList.add('$x');
    }
    else if (x is List) {
        flatList.addAll(flattenList(x));
    }
    else {
      flatList.add(x);
    }
  }
  return flatList;
}

function() {
  return 4;
}

main() {
  var prop = 'prop';
  List list = [1, "2", [3, function, [ "five" ], "six", true, { prop: "val" }]];
  print(list[2][1]());
  print(flattenList(list));
}
