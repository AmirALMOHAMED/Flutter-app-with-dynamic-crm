import 'package:dataverse_accounts_sample_app/src/network/aad_oauth_client.dart';
import 'package:dataverse_accounts_sample_app/src/network/api_client.dart';
import 'package:dataverse_accounts_sample_app/src/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterServicesModule{
  @lazySingleton
  AadOauthClient get aadOAuth => AadOauthClient();
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  @lazySingleton
  Dio get dio => DioClient.instance.getDioClient();
  @lazySingleton
  ApiClient get apiClient => ApiClient(dio, baseUrl: DioClient.baseUrl);

}