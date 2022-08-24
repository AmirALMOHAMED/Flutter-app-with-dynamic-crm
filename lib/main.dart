import 'package:dataverse_accounts_sample_app/src/blocs/accounts/accounts_bloc.dart';
import 'package:dataverse_accounts_sample_app/src/blocs/accounts/accounts_event.dart';
import 'package:dataverse_accounts_sample_app/src/ui/screens/accounts_screen.dart';
import 'package:dataverse_accounts_sample_app/src/utils/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    BlocProvider(
        create: (context) => getIt<AccountsBloc>()..add(FetchDataEvent()),
        child: const AccountsScreen(),
    )
  );
}