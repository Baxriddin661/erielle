import 'package:meta/meta.dart';

@immutable
abstract class UsersEvent {}

class InitEvent extends UsersEvent {}

class LoadEvent extends UsersEvent {}
