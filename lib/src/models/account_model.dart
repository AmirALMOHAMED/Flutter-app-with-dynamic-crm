import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class Account with _$Account{
  const factory Account({
    required String? accountnumber,
    required String? name,
    required int? statecode,
    required String? address1_stateorprovince,
    required String? entityimage_url,
    required String? emailaddress1,
  })= _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>_$AccountFromJson(json);
}

@Freezed()
class AccountModel with _$AccountModel{

  const factory AccountModel({
    String? odataContext,
    List<Account>? value,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String,dynamic> json) => _$AccountModelFromJson(json);
}