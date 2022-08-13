import 'package:dataverse_accounts_sample_app/src/utils/di/service_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


final getIt = GetIt.instance;

@InjectableInit()
Future<void> init() => $initGetIt(getIt);