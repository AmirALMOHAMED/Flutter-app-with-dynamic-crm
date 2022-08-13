import 'package:dataverse_accounts_sample_app/src/blocs/accounts/accounts_event.dart';
import 'package:dataverse_accounts_sample_app/src/blocs/accounts/accounts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../models/account_model.dart';
import '../../repositories/account_repository.dart';

@injectable
class AccountsBloc extends Bloc<AccountsEvent, AccountsState>{
  AccountsBloc(AccountRepository repository):
        accountRepository = repository,
        super(const AccountsLoadingState()){
    on<FetchDataEvent>((_onFetchDataEvent));
    on<SearchDataEvent>((_onSearchDataEvent));
  }

  final AccountRepository accountRepository;
  late AccountModel? accountsModel;
  
  void _onFetchDataEvent(
      FetchDataEvent event,
      Emitter<AccountsState> emitter,
      ) async {
    try {
      final token = await accountRepository.tokenApiProvider();
      if (token) {
        accountsModel = await accountRepository.accountRemoteProvider();
        if (accountsModel!.value!.isNotEmpty) {
          emitter(AccountsSuccessFetchDataState(accounts: accountsModel!.value!));
        }
        else {
          emitter(const AccountsErrorFetchDataState(
              errorMsg: "something went wrong, try it later!"));
        }
      }
    }
    catch(error){
      emitter(AccountsErrorFetchDataState(
          errorMsg: error.toString()));
    }
  }

  void _onSearchDataEvent(
      SearchDataEvent event,
      Emitter<AccountsState> emitter,
      ) async {
    emitter(const AccountsLoadingState());
    try {
      final token = await accountRepository.tokenApiProvider();
      if (token) {
        accountsModel = await accountRepository.AccountRemoteProviderWithSearch(event.query);
        if (accountsModel!.value!.isNotEmpty) {
          emitter(AccountsSuccessFetchDataState(accounts: accountsModel!.value!));
        }
        else {
          emitter(const AccountsErrorFetchDataState(
              errorMsg: "something went wrong, try it later!"));
        }
      }
    }
    catch(error){
      emitter(AccountsErrorFetchDataState(
          errorMsg: error.toString()));
    }
  }
}