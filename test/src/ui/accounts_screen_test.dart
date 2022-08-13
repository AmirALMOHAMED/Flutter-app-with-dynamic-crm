import 'package:dataverse_accounts_sample_app/src/ui/accounts_screen.dart';
import 'package:dataverse_accounts_sample_app/main.dart' as app;
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main(){

  testWidgets("The screen contain search bar", (widgetTester) async {

    await widgetTester.pumpWidget(const AccountsScreen());

    var textField = find.byType(TextField);

    expect(textField, findsOneWidget);
  });
}