# A FLUTTER APP WITH AZURE DYNAMIC DATAVERSE USING AAD_OAUTH LIB

A Flutter project with BLoC architecture. Using aad_oauth lib for oauth2 Microsoft Authentication and getting data from AZURE CRM Dataverse tables. For example accounts table

## Getting Started

This project is a starting point for a Flutter application connecting to Azure crm app and fetching 
the data from cloud database called [Dataverse](https://docs.microsoft.com/en-us/power-apps/maker/data-platform/data-platform-intro).

<p>
A few resources to get you started if this is your first Flutter project with these technologies: 
</p>
<ul>
<li>1-  Bloc design pattern.[flutter_bloc](https://pub.dev/packages/flutter_bloc)</li>
 <li>   2-  auto-generate models.[freezed](https://pub.dev/packages/freezed)</li>
  <li>  3-  Bloc design pattern.[flutter_bloc](https://pub.dev/packages/flutter_bloc)</li>
  <li>  4-  HTTP client with powerful options.[dio](https://pub.dev/packages/dio)</li>
  <li>  5-  dio HTTP client generator.[Retrofit ](https://pub.dev/packages/retrofit)</li>   
   <li> 5-  OAuth2 Azure Active Directory.[aad_oauth](https://pub.dev/packages/aad_oauth)</li>
   <li> 6-  Dependency Injection design pattern useful for unit test.[injectable](https://pub.dev/packages/injectable)</li>
   <li> 7-  Service Locator useful for access objects form UI or provider easily.[get_it](https://pub.dev/packages/get_it)</li>
   <li> 8-  Generated mock classes in UNIT TEST for Fakes, Mocks, behavior verification, and stubbing.[mockito](https://pub.dev/packages/mockito)</li>
</ul>
<p>

## For Azure Active Directory Oauth, you have to configure this:

 </p>
<ul>
<li>1-  create an azure app at the [Azure App registration portal](https://portal.azure.com/).  </li>
<li>2-  Use native app as platform type (with callback URL: https://login.live.com/oauth20_desktop.srf).</li> 
<li>3-  initialize the library as follow:</li>

```dart
static final Config config = Config(
    //YOUR_TENANT_ID
    tenant: 'YOUR_TENANT_ID',

    //YOUR_CLIENT_ID
    clientId: 'YOUR_CLIENT_ID',

    //YOUR_DYNAMIC_CRM_API
    scope: 'https://YOUR_DYNAMIC_CRM.api.crm4.dynamics.com/user_impersonation',

    redirectUri: 'https://login.live.com/oauth20_desktop.srf',

  );

  final AadOAuth oauth = new AadOAuth(config);
```

<li>4-  call login() and afterwards getAccessToken() to retrieve an access token:</li>
</ul>

```dart
await oauth.login();
String accessToken = await oauth.getAccessToken();
```


