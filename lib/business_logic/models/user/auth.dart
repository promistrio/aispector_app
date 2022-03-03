import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class UserAuth with _$UserAuth {
  const factory UserAuth({
    required int id,
    required String token,
    required String refreshToken,
    required String login,
    required String email,
    required bool isRegistered,
  }) = _UserAuth;

  factory UserAuth.fromJson(Map<String, dynamic> json) =>
      _$UserAuthFromJson(json);
}
