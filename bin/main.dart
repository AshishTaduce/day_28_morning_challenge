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

callFunc(Function x){
  return x;
}

List flattenList(List list) {
  List <dynamic> flatList = [];
  List tempList = [];
  for (var x in list) {
    if (x is Function) {
      try {
        if (callFunc(x) is List){
          tempList = (callFunc(x));
          for (var y in tempList) {
            flatList.add(y);
          }
        }
        flatList.add(x);
      } on Exception catch (e) {
        rethrow;
      }
    }

    else if (x is String) {
      flatList.add('"$x"');
    }

    else if (x is List) {
      tempList = flattenList(x);
      for (var y in tempList) {
        flatList.add(y);
      }
    }

    else {
      flatList.add(x);
    }
    
  }
  return flatList;
}

function() {
  return [0, 7, "six"];
}

main() {
  var prop = 'prop';
  List list = [1, "2", [3, function(), [ "five" ], "six", true, { prop: "val" }]];
  print(flattenList(list));
}
