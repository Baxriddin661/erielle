part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class LoadUsersState extends UsersState {
  final List<User> users;

  LoadUsersState({required this.users});
}

class LoadingState extends UsersState {}
