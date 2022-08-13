import 'dart:async';
import 'package:dataverse_accounts_sample_app/src/network/aad_oauth_client.dart';
import 'package:dataverse_accounts_sample_app/src/network/api_client.dart';
import 'package:injectable/injectable.dart';
import '../../models/account_model.dart';

@injectable
class AccountApiProvider{
  AccountApiProvider(this.apiClient, this.aadOauthClient);

  final ApiClient apiClient;
  final AadOauthClient aadOauthClient;

  Future<String?>? fetchAccessToken() async{
    return await aadOauthClient.login();
  }

  Future<AccountModel>? fetchAccountList() async {
    return apiClient.getAccounts("\$select=name,accountnumber,statecode,address1_stateorprovince,entityimage_url,emailaddress1");
  }

  Future<AccountModel>? fetchAccountListWithSearch(String searchWord) async{
    final query = "\$select=name,accountnumber,statecode,address1_stateorprovince,entityimage_url,emailaddress1&\$filter=(contains(accountnumber,'$searchWord') or contains(name,'$searchWord'))";
    return apiClient.getSearchedAccounts(query);
  }

}