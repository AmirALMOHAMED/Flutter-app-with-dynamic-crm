

import 'dart:convert';
import 'dart:io';

import 'package:dataverse_accounts_sample_app/src/data_providers/accounts/account_api_provider.dart';
import 'package:dataverse_accounts_sample_app/src/data_providers/accounts/account_demo_provider.dart';
import 'package:dataverse_accounts_sample_app/src/models/account_model.dart';
import 'package:dataverse_accounts_sample_app/src/repositories/account_repository.dart';
import 'package:dataverse_accounts_sample_app/src/utils/shared_preferences_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Annotation which generates the account_repository_test.mocks.dart library and the account_repository_test.mocks class.
@GenerateMocks([AccountApiProvider, SharedPreferencesStorage])
import 'account_repository_test.mocks.dart';

void main (){
  group("Account repository test",()
  {
    late AccountRepositoryImp repository;
    late SharedPreferencesStorage sharedPreferencesStorage;
    late AccountApiProvider accountApiProvider;

    setUpAll(() {
      accountApiProvider = MockAccountApiProvider();
      sharedPreferencesStorage = MockSharedPreferencesStorage();
      repository =
          AccountRepositoryImp(accountApiProvider, sharedPreferencesStorage);
    });

    test("Fetch Accounts List", () async {
      File f = File('test/src/util/accounts.json');
      final jsonMap = jsonDecode(f.readAsStringSync()) as Map<String, dynamic>;
      when(accountApiProvider.fetchAccountList()).
      thenAnswer((_) => Future.value(AccountModel.fromJson(jsonMap)));
      final fetchedAccounts = await repository.accountRemoteProvider();
      expect(fetchedAccounts, equals(AccountModel.fromJson(jsonMap)));
    });

    test("Fetch searched Accounts List", () async {
      File f = File('test/src/util/searched_accounts.json');
      final jsonMap = jsonDecode(f.readAsStringSync()) as Map<String, dynamic>;
      when(accountApiProvider.fetchAccountListWithSearch("3006")).
      thenAnswer((_) => Future.value(AccountModel.fromJson(jsonMap)));
      final fetchedAccounts = await repository.AccountRemoteProviderWithSearch("3006");
      expect(fetchedAccounts, equals(AccountModel.fromJson(jsonMap)));
    });
  });
}