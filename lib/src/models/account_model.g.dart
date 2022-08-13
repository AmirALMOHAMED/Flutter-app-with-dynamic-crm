// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      accountnumber: json['accountnumber'] as String?,
      name: json['name'] as String?,
      statecode: json['statecode'] as int?,
      address1_stateorprovince: json['address1_stateorprovince'] as String?,
      entityimage_url: json['entityimage_url'] as String?,
      emailaddress1: json['emailaddress1'] as String?,
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'accountnumber': instance.accountnumber,
      'name': instance.name,
      'statecode': instance.statecode,
      'address1_stateorprovince': instance.address1_stateorprovince,
      'entityimage_url': instance.entityimage_url,
      'emailaddress1': instance.emailaddress1,
    };

_$_AccountModel _$$_AccountModelFromJson(Map<String, dynamic> json) =>
    _$_AccountModel(
      odataContext: json['odataContext'] as String?,
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AccountModelToJson(_$_AccountModel instance) =>
    <String, dynamic>{
      'odataContext': instance.odataContext,
      'value': instance.value,
    };
