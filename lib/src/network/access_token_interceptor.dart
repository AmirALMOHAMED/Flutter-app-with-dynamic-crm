import 'package:dataverse_accounts_sample_app/src/utils/shared_preferences_storage.dart';
import 'package:dio/dio.dart';

import '../utils/di/service_locator.dart';

class AccessTokenInterceptor extends InterceptorsWrapper{

  final sharePreference = getIt<SharedPreferencesStorage>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = sharePreference.oAuthToken;
    if (token != null && token.isNotEmpty) {
      options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
      options.headers.putIfAbsent('OData-MaxVersion', () => '4.0');
      options.headers.putIfAbsent('OData-Version', () => '4.0');
      super.onRequest(options, handler);
      return;
    }
    super.onRequest(options, handler);
  }


}