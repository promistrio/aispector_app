// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAuth _$UserAuthFromJson(Map<String, dynamic> json) {
  return _UserAuth.fromJson(json);
}

/// @nodoc
class _$UserAuthTearOff {
  const _$UserAuthTearOff();

  _UserAuth call(
      {required int id,
      required String token,
      required String refreshToken,
      required String login,
      required String email,
      required bool isRegistered}) {
    return _UserAuth(
      id: id,
      token: token,
      refreshToken: refreshToken,
      login: login,
      email: email,
      isRegistered: isRegistered,
    );
  }

  UserAuth fromJson(Map<String, Object?> json) {
    return UserAuth.fromJson(json);
  }
}

/// @nodoc
const $UserAuth = _$UserAuthTearOff();

/// @nodoc
mixin _$UserAuth {
  int get id => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get isRegistered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAuthCopyWith<UserAuth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthCopyWith<$Res> {
  factory $UserAuthCopyWith(UserAuth value, $Res Function(UserAuth) then) =
      _$UserAuthCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String token,
      String refreshToken,
      String login,
      String email,
      bool isRegistered});
}

/// @nodoc
class _$UserAuthCopyWithImpl<$Res> implements $UserAuthCopyWith<$Res> {
  _$UserAuthCopyWithImpl(this._value, this._then);

  final UserAuth _value;
  // ignore: unused_field
  final $Res Function(UserAuth) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? token = freezed,
    Object? refreshToken = freezed,
    Object? login = freezed,
    Object? email = freezed,
    Object? isRegistered = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      login: login == freezed
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isRegistered: isRegistered == freezed
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserAuthCopyWith<$Res> implements $UserAuthCopyWith<$Res> {
  factory _$UserAuthCopyWith(_UserAuth value, $Res Function(_UserAuth) then) =
      __$UserAuthCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String token,
      String refreshToken,
      String login,
      String email,
      bool isRegistered});
}

/// @nodoc
class __$UserAuthCopyWithImpl<$Res> extends _$UserAuthCopyWithImpl<$Res>
    implements _$UserAuthCopyWith<$Res> {
  __$UserAuthCopyWithImpl(_UserAuth _value, $Res Function(_UserAuth) _then)
      : super(_value, (v) => _then(v as _UserAuth));

  @override
  _UserAuth get _value => super._value as _UserAuth;

  @override
  $Res call({
    Object? id = freezed,
    Object? token = freezed,
    Object? refreshToken = freezed,
    Object? login = freezed,
    Object? email = freezed,
    Object? isRegistered = freezed,
  }) {
    return _then(_UserAuth(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      login: login == freezed
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isRegistered: isRegistered == freezed
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAuth implements _UserAuth {
  const _$_UserAuth(
      {required this.id,
      required this.token,
      required this.refreshToken,
      required this.login,
      required this.email,
      required this.isRegistered});

  factory _$_UserAuth.fromJson(Map<String, dynamic> json) =>
      _$$_UserAuthFromJson(json);

  @override
  final int id;
  @override
  final String token;
  @override
  final String refreshToken;
  @override
  final String login;
  @override
  final String email;
  @override
  final bool isRegistered;

  @override
  String toString() {
    return 'UserAuth(id: $id, token: $token, refreshToken: $refreshToken, login: $login, email: $email, isRegistered: $isRegistered)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAuth &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken) &&
            const DeepCollectionEquality().equals(other.login, login) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.isRegistered, isRegistered));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(refreshToken),
      const DeepCollectionEquality().hash(login),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(isRegistered));

  @JsonKey(ignore: true)
  @override
  _$UserAuthCopyWith<_UserAuth> get copyWith =>
      __$UserAuthCopyWithImpl<_UserAuth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAuthToJson(this);
  }
}

abstract class _UserAuth implements UserAuth {
  const factory _UserAuth(
      {required int id,
      required String token,
      required String refreshToken,
      required String login,
      required String email,
      required bool isRegistered}) = _$_UserAuth;

  factory _UserAuth.fromJson(Map<String, dynamic> json) = _$_UserAuth.fromJson;

  @override
  int get id;
  @override
  String get token;
  @override
  String get refreshToken;
  @override
  String get login;
  @override
  String get email;
  @override
  bool get isRegistered;
  @override
  @JsonKey(ignore: true)
  _$UserAuthCopyWith<_UserAuth> get copyWith =>
      throw _privateConstructorUsedError;
}
