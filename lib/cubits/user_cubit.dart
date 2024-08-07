import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fetch_api_cubit/models/user.dart';
import 'package:flutter_fetch_api_cubit/utils/api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState.initial());

  fetchUsers() async {
    try {
      emit(const UserState.loading());

      final res = await Api().http.get("/users");
      if (res.statusCode == 200) {
        final users = res.data.map<User>((item) {
          return User.fromJson(item);
        }).toList();

        emit(UserState.success(users));
      } else {
        emit(UserState.error("Failed to fetch users: ${res.data.toString()}"));
      }
    } on DioException catch (e) {
      emit(UserState.error(e.message.toString()));
    }
  }
}
