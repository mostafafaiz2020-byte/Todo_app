// test/widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:lec18/todo.dart';

void main() {
  testWidgets('Login screen test', (WidgetTester tester) async {
    await tester.pumpWidget(const Todo());

    expect(find.byType(Todo), findsOneWidget);
  });
}
