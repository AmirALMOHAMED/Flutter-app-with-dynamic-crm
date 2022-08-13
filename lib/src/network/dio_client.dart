import 'package:dataverse_accounts_sample_app/src/network/access_token_interceptor.dart';
import 'package:dio/dio.dart';

class DioClient{

  static final DioClient instance = DioClient();
  static const baseUrl = 'https://org34320f4f.api.crm4.dynamics.com/api/data/v9.2/';

  Dio getDioClient(){
    final dio =Dio();
    // Set default configs
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000; //3s
    dio.interceptors.add(AccessTokenInterceptor());
    return dio;
  }
}