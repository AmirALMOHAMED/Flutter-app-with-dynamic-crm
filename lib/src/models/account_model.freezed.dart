// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  String? get accountnumber => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get statecode => throw _privateConstructorUsedError;
  String? get address1_stateorprovince => throw _privateConstructorUsedError;
  String? get entityimage_url => throw _privateConstructorUsedError;
  String? get emailaddress1 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res>;
  $Res call(
      {String? accountnumber,
      String? name,
      int? statecode,
      String? address1_stateorprovince,
      String? entityimage_url,
      String? emailaddress1});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res> implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  final Account _value;
  // ignore: unused_field
  final $Res Function(Account) _then;

  @override
  $Res call({
    Object? accountnumber = freezed,
    Object? name = freezed,
    Object? statecode = freezed,
    Object? address1_stateorprovince = freezed,
    Object? entityimage_url = freezed,
    Object? emailaddress1 = freezed,
  }) {
    return _then(_value.copyWith(
      accountnumber: accountnumber == freezed
          ? _value.accountnumber
          : accountnumber // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      statecode: statecode == freezed
          ? _value.statecode
          : statecode // ignore: cast_nullable_to_non_nullable
              as int?,
      address1_stateorprovince: address1_stateorprovince == freezed
          ? _value.address1_stateorprovince
          : address1_stateorprovince // ignore: cast_nullable_to_non_nullable
              as String?,
      entityimage_url: entityimage_url == freezed
          ? _value.entityimage_url
          : entityimage_url // ignore: cast_nullable_to_non_nullable
              as String?,
      emailaddress1: emailaddress1 == freezed
          ? _value.emailaddress1
          : emailaddress1 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$_AccountCopyWith(
          _$_Account value, $Res Function(_$_Account) then) =
      __$$_AccountCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? accountnumber,
      String? name,
      int? statecode,
      String? address1_stateorprovince,
      String? entityimage_url,
      String? emailaddress1});
}

/// @nodoc
class __$$_AccountCopyWithImpl<$Res> extends _$AccountCopyWithImpl<$Res>
    implements _$$_AccountCopyWith<$Res> {
  __$$_AccountCopyWithImpl(_$_Account _value, $Res Function(_$_Account) _then)
      : super(_value, (v) => _then(v as _$_Account));

  @override
  _$_Account get _value => super._value as _$_Account;

  @override
  $Res call({
    Object? accountnumber = freezed,
    Object? name = freezed,
    Object? statecode = freezed,
    Object? address1_stateorprovince = freezed,
    Object? entityimage_url = freezed,
    Object? emailaddress1 = freezed,
  }) {
    return _then(_$_Account(
      accountnumber: accountnumber == freezed
          ? _value.accountnumber
          : accountnumber // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      statecode: statecode == freezed
          ? _value.statecode
          : statecode // ignore: cast_nullable_to_non_nullable
              as int?,
      address1_stateorprovince: address1_stateorprovince == freezed
          ? _value.address1_stateorprovince
          : address1_stateorprovince // ignore: cast_nullable_to_non_nullable
              as String?,
      entityimage_url: entityimage_url == freezed
          ? _value.entityimage_url
          : entityimage_url // ignore: cast_nullable_to_non_nullable
              as String?,
      emailaddress1: emailaddress1 == freezed
          ? _value.emailaddress1
          : emailaddress1 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Account implements _Account {
  const _$_Account(
      {required this.accountnumber,
      required this.name,
      required this.statecode,
      required this.address1_stateorprovince,
      required this.entityimage_url,
      required this.emailaddress1});

  factory _$_Account.fromJson(Map<String, dynamic> json) =>
      _$$_AccountFromJson(json);

  @override
  final String? accountnumber;
  @override
  final String? name;
  @override
  final int? statecode;
  @override
  final String? address1_stateorprovince;
  @override
  final String? entityimage_url;
  @override
  final String? emailaddress1;

  @override
  String toString() {
    return 'Account(accountnumber: $accountnumber, name: $name, statecode: $statecode, address1_stateorprovince: $address1_stateorprovince, entityimage_url: $entityimage_url, emailaddress1: $emailaddress1)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Account &&
            const DeepCollectionEquality()
                .equals(other.accountnumber, accountnumber) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.statecode, statecode) &&
            const DeepCollectionEquality().equals(
                other.address1_stateorprovince, address1_stateorprovince) &&
            const DeepCollectionEquality()
                .equals(other.entityimage_url, entityimage_url) &&
            const DeepCollectionEquality()
                .equals(other.emailaddress1, emailaddress1));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(accountnumber),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(statecode),
      const DeepCollectionEquality().hash(address1_stateorprovince),
      const DeepCollectionEquality().hash(entityimage_url),
      const DeepCollectionEquality().hash(emailaddress1));

  @JsonKey(ignore: true)
  @override
  _$$_AccountCopyWith<_$_Account> get copyWith =>
      __$$_AccountCopyWithImpl<_$_Account>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  const factory _Account(
      {required final String? accountnumber,
      required final String? name,
      required final int? statecode,
      required final String? address1_stateorprovince,
      required final String? entityimage_url,
      required final String? emailaddress1}) = _$_Account;

  factory _Account.fromJson(Map<String, dynamic> json) = _$_Account.fromJson;

  @override
  String? get accountnumber;
  @override
  String? get name;
  @override
  int? get statecode;
  @override
  String? get address1_stateorprovince;
  @override
  String? get entityimage_url;
  @override
  String? get emailaddress1;
  @override
  @JsonKey(ignore: true)
  _$$_AccountCopyWith<_$_Account> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) {
  return _AccountModel.fromJson(json);
}

/// @nodoc
mixin _$AccountModel {
  String? get odataContext => throw _privateConstructorUsedError;
  List<Account>? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountModelCopyWith<AccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountModelCopyWith<$Res> {
  factory $AccountModelCopyWith(
          AccountModel value, $Res Function(AccountModel) then) =
      _$AccountModelCopyWithImpl<$Res>;
  $Res call({String? odataContext, List<Account>? value});
}

/// @nodoc
class _$AccountModelCopyWithImpl<$Res> implements $AccountModelCopyWith<$Res> {
  _$AccountModelCopyWithImpl(this._value, this._then);

  final AccountModel _value;
  // ignore: unused_field
  final $Res Function(AccountModel) _then;

  @override
  $Res call({
    Object? odataContext = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      odataContext: odataContext == freezed
          ? _value.odataContext
          : odataContext // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Account>?,
    ));
  }
}

/// @nodoc
abstract class _$$_AccountModelCopyWith<$Res>
    implements $AccountModelCopyWith<$Res> {
  factory _$$_AccountModelCopyWith(
          _$_AccountModel value, $Res Function(_$_AccountModel) then) =
      __$$_AccountModelCopyWithImpl<$Res>;
  @override
  $Res call({String? odataContext, List<Account>? value});
}

/// @nodoc
class __$$_AccountModelCopyWithImpl<$Res>
    extends _$AccountModelCopyWithImpl<$Res>
    implements _$$_AccountModelCopyWith<$Res> {
  __$$_AccountModelCopyWithImpl(
      _$_AccountModel _value, $Res Function(_$_AccountModel) _then)
      : super(_value, (v) => _then(v as _$_AccountModel));

  @override
  _$_AccountModel get _value => super._value as _$_AccountModel;

  @override
  $Res call({
    Object? odataContext = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_AccountModel(
      odataContext: odataContext == freezed
          ? _value.odataContext
          : odataContext // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Account>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountModel implements _AccountModel {
  const _$_AccountModel({this.odataContext, final List<Account>? value})
      : _value = value;

  factory _$_AccountModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountModelFromJson(json);

  @override
  final String? odataContext;
  final List<Account>? _value;
  @override
  List<Account>? get value {
    final value = _value;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AccountModel(odataContext: $odataContext, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountModel &&
            const DeepCollectionEquality()
                .equals(other.odataContext, odataContext) &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(odataContext),
      const DeepCollectionEquality().hash(_value));

  @JsonKey(ignore: true)
  @override
  _$$_AccountModelCopyWith<_$_AccountModel> get copyWith =>
      __$$_AccountModelCopyWithImpl<_$_AccountModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountModelToJson(
      this,
    );
  }
}

abstract class _AccountModel implements AccountModel {
  const factory _AccountModel(
      {final String? odataContext,
      final List<Account>? value}) = _$_AccountModel;

  factory _AccountModel.fromJson(Map<String, dynamic> json) =
      _$_AccountModel.fromJson;

  @override
  String? get odataContext;
  @override
  List<Account>? get value;
  @override
  @JsonKey(ignore: true)
  _$$_AccountModelCopyWith<_$_AccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}
