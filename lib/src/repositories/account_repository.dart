import 'package:dataverse_accounts_sample_app/src/utils/shared_preferences_storage.dart';
import 'package:injectable/injectable.dart';

import '../models/account_model.dart';
import '../data_providers/accounts/account_api_provider.dart';
import 'dart:async';
import '../data_providers/accounts/account_demo_provider.dart';

abstract class AccountRepository{
  Future<bool> tokenApiProvider();
  Future<AccountModel>? accountRemoteProvider();
  Future<AccountModel>? AccountRemoteProviderWithSearch(String searchWord);
}

@LazySingleton(as: AccountRepository)
class AccountRepositoryImp extends AccountRepository{
  AccountRepositoryImp(this.accountApiProvider, this.localPreference);

  final SharedPreferencesStorage localPreference;
  final AccountApiProvider accountApiProvider;
  final accountDemoProvider = AccountDemoProvider();

  //Fetching all accounts from the API
  //Future<AccountModel> fetchAllAccounts() => accountApiProvider.fetchAccountList();
  //List<Account> fetchAllAccounts() => AccountDemoProvider.fetchAccountList();


  //Fetching accounts with search word from the API
  //Future<AccountModel> fetchAccountsWithSearch(String searchWord) => accountApiProvider.fetchAccountListWithSearch(searchWord);
  //List<Account> fetchAccountsWithSearch(String searchWord) => AccountDemoProvider.fetchAccountListWithSearch(searchWord);

  @override
  Future<AccountModel>? accountRemoteProvider() async{
    // TODO: implement accountRemoteProvider
    final result = await accountApiProvider.fetchAccountList();
    return Future.value(result);
  }
  
  @override
  Future<AccountModel>? AccountRemoteProviderWithSearch(String searchWord) async{
    // TODO: implement accountRemoteProvider
    final result = await accountApiProvider.fetchAccountListWithSearch(searchWord);
    return Future.value(result);
  }
  

  @override
  Future<bool> tokenApiProvider() async{
    // TODO: implement tokenApiProvider
    final accessToken = await accountApiProvider.fetchAccessToken();
    if (accessToken != null) {
      await localPreference.setAuthToken(accessToken);
      return true;
    }
    return false;
  }

}