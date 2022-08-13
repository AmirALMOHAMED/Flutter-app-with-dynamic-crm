import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../models/account_model.dart';
part 'api_client.g.dart';

@RestApi()
abstract class ApiClient{

  @factoryMethod
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("accounts?{columns}")
  Future<AccountModel> getAccounts(@Path("columns") String columns);

  @GET("accounts?{filter}")
  Future<AccountModel> getSearchedAccounts(@Path("filter") String filter);
}