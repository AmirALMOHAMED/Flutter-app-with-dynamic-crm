import 'package:dataverse_accounts_sample_app/src/models/account_model.dart';
import 'package:dataverse_accounts_sample_app/src/ui/screens/account_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
    testWidgets("account Image appear in details page", (widgetTester) async{

        await widgetTester.pumpWidget(const AccountDetailsScreen(
            account: Account(accountnumber: "1",
                name: "name",
                statecode: 0,
                address1_stateorprovince: "address1_stateorprovince",
                entityimage_url: "entityimage_url",
                emailaddress1: "emailaddress1")));

        var imageView = find.byType(Image);

        expect(imageView, findsOneWidget);
    });
}