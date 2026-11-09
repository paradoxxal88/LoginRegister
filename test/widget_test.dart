import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sionillo_lab3/main.dart';

void main() {
  Future<void> pumpApp(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(const LoginRegisterApp());
  }

  testWidgets('shows application name, form labels, and owner info',
      (tester) async {
    await pumpApp(tester);

    expect(find.text('Lab Activity 3'), findsOneWidget);
    expect(find.text('Welcome Back!'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Your Name — Your Section'), findsOneWidget);
    // The name field only appears on the registration form.
    expect(find.text('Full Name'), findsNothing);
  });

  testWidgets('requires a password of at least eight characters',
      (tester) async {
    await pumpApp(tester);

    await tester.enterText(find.byType(TextFormField).at(0), 'a@b.com');
    await tester.enterText(find.byType(TextFormField).at(1), '1234567');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();

    expect(find.text('Use at least 8 characters.'), findsOneWidget);
  });

  testWidgets('registration then login works', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('No account yet? Register'));
    await tester.pumpAndSettle();

    expect(find.text('Create an Account'), findsOneWidget);
    expect(find.text('Full Name'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), 'Test User');
    await tester.enterText(find.byType(TextFormField).at(1), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(2), 'password123');
    await tester.enterText(find.byType(TextFormField).at(3), 'password123');

    await tester.tap(find.widgetWithText(ElevatedButton, 'Register'));
    await tester.pumpAndSettle();

    expect(find.text('Registration successful! Please log in.'),
        findsOneWidget);
    expect(find.text('Welcome Back!'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Welcome, Test User!'), findsOneWidget);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Logout'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome Back!'), findsOneWidget);
  });
}
