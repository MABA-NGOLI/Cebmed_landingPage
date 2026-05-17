import 'package:flutter_test/flutter_test.dart';
import 'package:landingpage_cebmed/main.dart';

void main() {
  testWidgets('Landing page renders brand and CTA', (WidgetTester tester) async {
    await tester.pumpWidget(const CebmedApp());

    expect(find.text('Cebmed'), findsOneWidget);
    expect(find.text('Telecharger l\'App'), findsWidgets);
  });
}
