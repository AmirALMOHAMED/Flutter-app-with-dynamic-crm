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
 <li>   static final Config config = new Config(</li>
  <li>      tenant: "YOUR_TENANT_ID",</li>
   <li>     clientId: "YOUR_CLIENT_ID",</li>
    <li>    scope: "openid profile offline_access",</li>
     <li>   redirectUri: "your redirect url available in azure portal"</li>
   <li> );</li>
    <li>final AadOAuth oauth = new AadOAuth(config);</li>
<li>4-  call login() and afterwards getAccessToken() to retrieve an access token:</li>
 <li>   await oauth.login();</li>
  <li>  String accessToken = await oauth.getAccessToken();</li>
</ul>
