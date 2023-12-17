import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit/user/user_cubit.dart';
import '../../../business_logic/cubit/user/user_state.dart';
import '../../../constants/app_colors.dart';
import '../../../data/models/user.dart';
import '../../../utils/network_exceptions.dart';

class OnlineWidgetsForApi extends StatelessWidget {
  const OnlineWidgetsForApi({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    TextEditingController controller = TextEditingController();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // buildUsersListView(),
          // const SizedBox(height: AppDimensions.superX3Large),
          // buildInputUserDetailsId(controller, context),
          // const SizedBox(height: AppDimensions.superX3Large),
          // buildUserDetails(),
          // const SizedBox(height: AppDimensions.superX3Large),
          buildElevatedButton(context),
          buildNewUser(),
        ],
      ),
    );
  }

  Column buildInputUserDetailsId(
    TextEditingController controller,
    BuildContext context,
  ) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter User ID ...',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<UserCubit>(context).getUser(
              int.parse(controller.text),
            );
          },
          child: const Text('Get User By Id'),
        ),
      ],
    );
  }

  // Widget buildUserDetails() {
  //   return BlocBuilder<UserCubit, UserState>(
  //     builder: (context, state) {
  //       if (state is UserDetailsLoaded) {
  //         return Card(
  //           margin: const EdgeInsets.all(8),
  //           color: AppColors.lightPrimary,
  //           child: ListTile(
  //             title: Text(state.userDetails.name),
  //             subtitle: Text(state.userDetails.email),
  //           ),
  //         );
  //       }
  //       return const SizedBox();
  //     },
  //   );
  // }

  // Widget buildUsersListView() {
  //   return BlocBuilder<UserCubit, UserState>(
  //     builder: (context, state) {
  //       if (state is UsersLoaded) {
  //         return ListView.builder(
  //           physics: const BouncingScrollPhysics(),
  //           shrinkWrap: true,
  //           itemCount: state.users.length,
  //           itemBuilder: (context, index) => Card(
  //             margin: const EdgeInsets.all(8),
  //             color: AppColors.mediumPrimary,
  //             child: ListTile(
  //               title: Text(state.users[index].name),
  //               subtitle: Text(state.users[index].email),
  //             ),
  //           ),
  //         );
  //       }
  //       return const CircularProgressIndicator();
  //     },
  //   );
  // }

  Widget buildElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        User newUser = User(
          name: 'Muntadhar Ahmed',
          email: 'ma2@gmail.com',
          gender: 'malee',
          status: 'active',
        );

        BlocProvider.of<UserCubit>(context).createNewUser(newUser);

        // BlocProvider.of<UserCubit>(context).deleteUser(3582369);
      },
      child: const Text('DO IT'),
    );
  }

  Widget buildNewUser() {
    return BlocBuilder<UserCubit, UserState<User>>(
      builder: (context, UserState<User> state) {
        return state.when(
          idle: () => const Center(child: Text('idle'),),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          success: (User user) => Container(
            alignment: Alignment.center,
            height: 56,
            color: AppColors.lightPrimary,
            child: Text(user.name),
          ),
          failure: (NetworkExceptions exceptions) => Center(
            child: Text(
              NetworkExceptions.getErrorMessage(exceptions),
            ),
          ),
        );

        // if (state is CreateNewUser) {
        //   return Text('${state.newUser.name} added successfully');
        // } else if (state is DeleteUser) {
        //   return Text('${state.data}');
        // }
        // return const SizedBox();
      },
    );
  }
}
