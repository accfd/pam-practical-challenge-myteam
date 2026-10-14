import 'package:flutter_test/flutter_test.dart';
import 'package:myteam_app/main.dart';

void main() {
  testWidgets('MyTeamApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyTeamApp());
    expect(find.text('Daftar Pengalaman'), findsOneWidget);
  });
}
