import 'package:flutter_test/flutter_test.dart';
import 'package:testing_example/main.dart';

main() {
  test('String should be reversed', () {
    String initial = 'Hello';
    String rever = reverse(initial);
    expect(rever, 'olleH');
  });
}
