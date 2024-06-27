import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:eriell/data/repository/rest_client.dart';
import 'package:eriell/presintation/bloc/users_event.dart';
import 'package:meta/meta.dart';

import '../../data/model/user.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(LoadingState()) {
    on<InitEvent>((event, emit) async {
      emit(LoadingState());
    });

    on<LoadEvent>((event, emit) async {
      emit(LoadingState());

      final restClient =
          await RestClient(Dio(BaseOptions(contentType: 'application/json')))
              .getUsers();

      List<User> users = restClient.map((e) => e).toList();
      emit(LoadUsersState(users: users));
    });
  }
}
