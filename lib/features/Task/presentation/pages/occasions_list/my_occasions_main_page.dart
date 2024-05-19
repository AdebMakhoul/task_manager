
import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:task_manager_app/features/Task/presentation/cubits/my_live_occasions_cubit/my_live_occasions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/add_task/add_task_cubit.dart';
import 'my_live_occasions_page.dart';

class MyOccasionsMainPage extends StatefulWidget {
  const MyOccasionsMainPage({super.key});

  @override
  State<MyOccasionsMainPage> createState() => _MyOccasionsMainPageState();
}

class _MyOccasionsMainPageState extends State<MyOccasionsMainPage>
    with SingleTickerProviderStateMixin {
  TextEditingController phoneController = TextEditingController();
  late AddTaskCubit addTaskCubit;

  @override
  void initState() {
    addTaskCubit = BlocProvider.of<AddTaskCubit>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return context.isAuth
        ? Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: BlocProvider(
                    create: (context) => MyLiveOccasionsCubit()..getLiveList(),
                    child: MyLiveOccasionsPage(),
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
