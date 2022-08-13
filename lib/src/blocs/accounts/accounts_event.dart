import 'package:equatable/equatable.dart';

abstract class AccountsEvent extends Equatable{
  const AccountsEvent();
}

class FetchDataEvent extends AccountsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchDataEvent extends AccountsEvent{
  final String query;
  const SearchDataEvent({required this.query});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}