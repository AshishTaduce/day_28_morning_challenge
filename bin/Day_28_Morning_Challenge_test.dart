import 'package:test/test.dart';
import 'main.dart';

function() {
  return 4;
}

void main() {
  var prop;
  test('Check for list within flat List', () {
    List list = [1, "2", [3, function(), [ "five" ], "six", true, { prop: "val" }]];

    List flatList = flattenList(list);

    int result = 0;

    for (var x in flatList){
      if (x is List){
       result++;
      }
    }

    expect(result, 0);
  });
}
