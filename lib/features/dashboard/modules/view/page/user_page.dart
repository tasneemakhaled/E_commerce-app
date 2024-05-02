import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fcii/features/dashboard/modules/users/controller/cubit/user_cubit.dart';
import 'package:project_fcii/features/dashboard/modules/view/components/user_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          final UserCubit controller = context.read<UserCubit>();
          return Scaffold(
            body: state is UserLoading
                ? const CircularProgressIndicator()
                : state is UserEmpty
                    ? const Center(
                        child: Icon(
                        CupertinoIcons.delete,
                        size: 100,
                        color: Colors.grey,
                      ))
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        // separatorBuilder: (_, int index) => const Divider(
                        //       height: 1,
                        //       thickness: 5,
                        //     ),
                        itemCount: controller.users.length,
                        itemBuilder: (_, int index) {
                          return UserItemWidget(
                              userModel: controller.users[index]);
                        }),
          );
        },
      ),
    );
  }
}
