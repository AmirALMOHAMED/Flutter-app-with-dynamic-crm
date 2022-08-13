import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AadOauthClient{
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final Config config = Config(
    //YOUR_TENANT_ID
    tenant: '',

    //YOUR_CLIENT_ID
    clientId: '',

    //YOUR_DYNAMIC_CRM_API
    scope: 'https://exapmle.api.crm4.dynamics.com/user_impersonation',

    redirectUri: 'https://login.live.com/oauth20_desktop.srf',

    //YOUR_CLIENT_SECRET
    //clientSecret: '',

    //navigatorKey: getIt<AadOauthClient>().navigatorKey,
    //isB2C: true,
  );

  final AadOAuth oauth = AadOAuth(config);
  Future<String?> login() async {
    try {
      await oauth.login();
      String? accessToken = await oauth.getAccessToken();
      return accessToken;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

}