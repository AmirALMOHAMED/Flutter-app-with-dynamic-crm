


import 'dart:convert';
import 'dart:io';

import 'package:dataverse_accounts_sample_app/src/data_providers/accounts/account_api_provider.dart';
import 'package:dataverse_accounts_sample_app/src/models/account_model.dart';
import 'package:dataverse_accounts_sample_app/src/network/aad_oauth_client.dart';
import 'package:dataverse_accounts_sample_app/src/network/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([ApiClient, AadOauthClient])
import 'account_api_provider_test.mocks.dart';

void main(){
group("Accounts Api Provider Test", ()
  {
    late AccountApiProvider accountApiProvider;
    late ApiClient apiClient;
    late AadOauthClient aadOauthClient;
    
    setUp(() {
        aadOauthClient = MockAadOauthClient();
        apiClient = MockApiClient();
        accountApiProvider = AccountApiProvider(apiClient, aadOauthClient);
    });

    test("Fetch account api provider from remote", () async{

      File f = File('test/src/util/accounts.json');
      final jsonMap = jsonDecode(f.readAsStringSync()) as Map<String, dynamic>;

      when(accountApiProvider.fetchAccountList()).thenAnswer((_) async =>
        Future.value(
          AccountModel.fromJson(jsonMap
          ),
        ),
      );

      final result =await apiClient.getAccounts("\$select=name,accountnumber,statecode,address1_stateorprovince,entityimage_url,emailaddress1");
      
      expect(result, equals(AccountModel.fromJson(jsonMap)));
    });

    test("Fetch account with search by name or number api provider from remote", () async{

      File f = File('test/src/util/searched_accounts.json');
      final jsonMap = jsonDecode(f.readAsStringSync()) as Map<String, dynamic>;


      when(accountApiProvider.fetchAccountListWithSearch("3006")).thenAnswer((_) async =>
          Future.value(
            AccountModel.fromJson(jsonMap
            ),
          ),
      );

      final result =await apiClient.getSearchedAccounts("\$select=name,accountnumber,statecode,address1_stateorprovince,entityimage_url,emailaddress1&\$filter=(contains(accountnumber,'3006') or contains(name,'3006'))");

      expect(result, equals(AccountModel.fromJson(jsonMap)));
    });


    test("Fetch azure access token api provider from remote",() async{
      File f = File('test/src/util/access_token.json');
      final jsonMap = jsonDecode(f.readAsStringSync()) as Map<String, dynamic>;

      when(aadOauthClient.login()).thenAnswer((_) async  {
        return jsonMap['access_token'];
      });

      final result = await accountApiProvider.fetchAccessToken();
      
      expect(result, equals(jsonMap['access_token']));
      });


  });
}