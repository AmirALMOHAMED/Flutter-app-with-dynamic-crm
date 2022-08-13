import 'package:dataverse_accounts_sample_app/src/models/account_model.dart';
import 'package:equatable/equatable.dart';

abstract class AccountsState extends Equatable{
  const AccountsState();
}

class AccountsLoadingState extends AccountsState {
  const AccountsLoadingState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AccountsErrorFetchDataState extends AccountsState{
  final String errorMsg;
  const AccountsErrorFetchDataState({
    required this.errorMsg
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AccountsSuccessFetchDataState extends AccountsState{
   final List<Account> accounts;
   const AccountsSuccessFetchDataState({
     required this.accounts
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];

}