// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../blocs/accounts/accounts_bloc.dart' as _i10;
import '../../data_providers/accounts/account_api_provider.dart' as _i8;
import '../../network/aad_oauth_client.dart' as _i3;
import '../../network/api_client.dart' as _i4;
import '../../repositories/account_repository.dart' as _i9;
import '../shared_preferences_storage.dart' as _i7;
import 'register_services_module.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerServicesModule = _$RegisterServicesModule();
  gh.lazySingleton<_i3.AadOauthClient>(() => registerServicesModule.aadOAuth);
  gh.lazySingleton<_i4.ApiClient>(() => registerServicesModule.apiClient);
  gh.lazySingleton<_i5.Dio>(() => registerServicesModule.dio);
  await gh.factoryAsync<_i6.SharedPreferences>(
      () => registerServicesModule.prefs,
      preResolve: true);
  gh.factory<_i7.SharedPreferencesStorage>(
      () => _i7.SharedPreferencesStorage(get<_i6.SharedPreferences>()));
  gh.factory<_i8.AccountApiProvider>(() =>
      _i8.AccountApiProvider(get<_i4.ApiClient>(), get<_i3.AadOauthClient>()));
  gh.lazySingleton<_i9.AccountRepository>(() => _i9.AccountRepositoryImp(
      get<_i8.AccountApiProvider>(), get<_i7.SharedPreferencesStorage>()));
  gh.factory<_i10.AccountsBloc>(
      () => _i10.AccountsBloc(get<_i9.AccountRepository>()));
  return get;
}

class _$RegisterServicesModule extends _i11.RegisterServicesModule {}
