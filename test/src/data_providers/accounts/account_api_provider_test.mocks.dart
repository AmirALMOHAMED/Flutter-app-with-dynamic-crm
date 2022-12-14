// Mocks generated by Mockito 5.3.0 from annotations
// in dataverse_accounts_sample_app/test/src/data_providers/accounts/account_api_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:aad_oauth/aad_oauth.dart' as _i4;
import 'package:dataverse_accounts_sample_app/src/models/account_model.dart'
    as _i2;
import 'package:dataverse_accounts_sample_app/src/network/aad_oauth_client.dart'
    as _i7;
import 'package:dataverse_accounts_sample_app/src/network/api_client.dart'
    as _i5;
import 'package:flutter/cupertino.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAccountModel_0 extends _i1.SmartFake implements _i2.AccountModel {
  _FakeAccountModel_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeGlobalKey_1<T extends _i3.State<_i3.StatefulWidget>>
    extends _i1.SmartFake implements _i3.GlobalKey<T> {
  _FakeGlobalKey_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeAadOAuth_2 extends _i1.SmartFake implements _i4.AadOAuth {
  _FakeAadOAuth_2(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [ApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiClient extends _i1.Mock implements _i5.ApiClient {
  MockApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.AccountModel> getAccounts(String? columns) =>
      (super.noSuchMethod(Invocation.method(#getAccounts, [columns]),
          returnValue: _i6.Future<_i2.AccountModel>.value(_FakeAccountModel_0(
              this, Invocation.method(#getAccounts, [columns])))) as _i6
          .Future<_i2.AccountModel>);
  @override
  _i6.Future<_i2.AccountModel> getSearchedAccounts(String? filter) =>
      (super.noSuchMethod(Invocation.method(#getSearchedAccounts, [filter]),
          returnValue: _i6.Future<_i2.AccountModel>.value(_FakeAccountModel_0(
              this, Invocation.method(#getSearchedAccounts, [filter])))) as _i6
          .Future<_i2.AccountModel>);
}

/// A class which mocks [AadOauthClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockAadOauthClient extends _i1.Mock implements _i7.AadOauthClient {
  MockAadOauthClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.GlobalKey<_i3.NavigatorState> get navigatorKey =>
      (super.noSuchMethod(Invocation.getter(#navigatorKey),
              returnValue: _FakeGlobalKey_1<_i3.NavigatorState>(
                  this, Invocation.getter(#navigatorKey)))
          as _i3.GlobalKey<_i3.NavigatorState>);
  @override
  _i4.AadOAuth get oauth => (super.noSuchMethod(Invocation.getter(#oauth),
          returnValue: _FakeAadOAuth_2(this, Invocation.getter(#oauth)))
      as _i4.AadOAuth);
  @override
  _i6.Future<String?> login() =>
      (super.noSuchMethod(Invocation.method(#login, []),
          returnValue: _i6.Future<String?>.value()) as _i6.Future<String?>);
}
