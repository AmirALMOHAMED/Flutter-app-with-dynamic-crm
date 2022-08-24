import 'package:dataverse_accounts_sample_app/src/ui/screens/accounts_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main(){

  testWidgets("The screen contain search bar", (widgetTester) async {

    await widgetTester.pumpWidget(const AccountsScreen());

    var textField = find.byType(TextField);

    expect(textField, findsOneWidget);
  });
}