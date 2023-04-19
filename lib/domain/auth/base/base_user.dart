import 'package:equatable/equatable.dart';

abstract class BaseUser extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final DateTime? createdAt;
  final bool isAnonymous;
  final bool loggedIn;

  const BaseUser({
    this.id,
    this.uid,
    this.name,
    this.password,
    this.phoneNumber,
    this.email,
    this.createdAt,
    this.isAnonymous = false,
    this.loggedIn = false,
  });
  @override
  List<Object?> get props =>
      [id, uid, email, name, phoneNumber, createdAt, password];
}
