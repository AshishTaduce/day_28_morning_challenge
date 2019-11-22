import 'package:test/test.dart';
import 'main.dart';

function() {
  return 4;
}

void main() {
  test('test', (){
    expect(
        flattenList([[2], 2, [2]]), [2, 2, 2]);
    expect(
        flattenList([1, "2", [3, function, ["five"], "six", true, {'prop': "val"}]], ),
        [
          1,
          "2",
          3,
          4,
          "five",
          "six",
          true,
          {'prop': "val"}]);
    expect(
        flattenList([
          1,
          "2",
          [
            3,
                () =>[2,[4]],
            ["five"],
            "six",
            true,
            {'prop': "val"}
          ]
        ], ),
        [
          1,
          "2",
          3,
          [2,[4]],
          "five",
          "six",
          true,
          {'prop': "val"}
        ]);
  });
}
