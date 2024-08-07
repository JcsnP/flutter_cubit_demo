import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fetch_api_cubit/cubits/user_cubit.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Users"),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () {
              return context.read<UserCubit>().fetchUsers();
            },
            child: state.when(
              initial: () => Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<UserCubit>().fetchUsers();
                  },
                  child: const Text("Get Users"),
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              success: (users) {
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(users[index].name),
                      subtitle: Text(users[index].email),
                    );
                  },
                );
              },
              error: (message) => Center(
                child: Text(message),
              ),
            ),
          );
        },
      ),
    );
  }
}
