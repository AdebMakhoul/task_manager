import 'package:task_manager_app/core/domain/presentation/widgets/custom_footer_widget.dart';
import 'package:task_manager_app/core/domain/presentation/widgets/error_panel.dart';
import 'package:task_manager_app/core/presentation/resources/assets.gen.dart';
import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:task_manager_app/features/Task/data/model/get_my_occasions_model.dart';
import 'package:task_manager_app/features/Task/presentation/widgets/occasions_list_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_app/core/data/datasource/shared_prefrences_keys.dart';
import 'package:task_manager_app/core/domain/presentation/widgets/custom_form_field.dart';
import 'package:task_manager_app/features/Task/presentation/cubits/my_live_occasions_cubit/my_live_occasions_cubit.dart';
import '../../../../../core/data/datasource/base_local_sqlite_database.dart';
import '../../../../../core/domain/presentation/resources/theme/app_material_color.dart';
import '../../../../../core/domain/presentation/services/validation_service.dart';
import '../../cubits/add_task/add_task_cubit.dart';

class MyLiveOccasionsPage extends StatefulWidget {
  const MyLiveOccasionsPage({super.key});

  @override
  State<MyLiveOccasionsPage> createState() => _MyLiveOccasionsPageState();
}

class _MyLiveOccasionsPageState extends State<MyLiveOccasionsPage> {
  late final MyLiveOccasionsCubit myLiveOccasionsCubit;
  TextEditingController phoneController = TextEditingController();
  late AddTaskCubit addTaskCubit;
  @override
  void initState() {
    myLiveOccasionsCubit = BlocProvider.of<MyLiveOccasionsCubit>(context);
    addTaskCubit = BlocProvider.of<AddTaskCubit>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<MyLiveOccasionsCubit, MyLiveOccasionsState>(
            bloc: myLiveOccasionsCubit,
            builder: (context, state) {
              return SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: const MaterialClassicHeader(),
                  controller: state.refreshController,
                  onRefresh: () {
                    myLiveOccasionsCubit.getLiveList();
                  },
                  onLoading: () async {
                    myLiveOccasionsCubit.getLiveList(isRefresh: false);
                  },
                  footer: const CustomFooterWidget(),
                  child: (state.status == MyLiveOccasionsStatus.error)
                      ? ErrorPanel(
                          failure: state.getMyLiveOccasionsListFailure!,
                          onTryAgain: () => myLiveOccasionsCubit.getLiveList(),
                        )
                      : FutureBuilder<List<TaskModel>?>(
                          future: DatabaseHelper.getAllTask(),
                          builder: (context,
                              AsyncSnapshot<List<TaskModel>?>
                                  snapshot) {
                             if (snapshot.hasError) {
                              return Center(
                                  child: Text(snapshot.error.toString()));
                            } else if (snapshot.hasData) {
                              if (snapshot.data != null) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 6),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (ctx, i) {
                                    return InkWell(
                                        onTap: () {
                                          taskCrud(context, snapshot.data![i]);
                                        },
                                        child: OccasionListWidget(
                                          taskModel:
                                              snapshot.data![i],
                                        ));
                                  },
                                );
                              }
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 70.h,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.9,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      child: Image.asset(
                                        Assets.images.noData.path,
                                        width: 0.80.sw,
                                        height: 0.34.sh,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      "Nothing to show".tr(),
                                      style: context.textTheme.bodySmall!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 70.h,
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        ));
            }),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add,size: 50.5),
          onPressed: () {
          addTaskCubit.changeStatus(TaskStatus.initial);
          bottomSheetFun(context);
        }));

    //  : Center(
    // child: NotAuthWidget(content: Text("My occasions".tr())));
  }

  Future<dynamic> bottomSheetFun(BuildContext context,
      {bool isUpdate = false}) {
    return showModalBottomSheet(
      context: context,
      //isDismissible: false,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      isScrollControlled: true,
      builder: (context) {
        return BlocConsumer<AddTaskCubit, AddTaskState>(
          bloc: addTaskCubit,
          listener: (context, state) {
            if (state.status == TaskStatus.success) {
              addTaskCubit.showToast("Task added successfully!".tr());
              context.pop();
            }
            if (state.status == TaskStatus.error) {
              addTaskCubit.showToast("Task error!".tr());
              context.pop();
            }
          },
          builder: (context, state) {
            return Container(
              // height: 0.8.sh,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: context.theme.cardColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: SingleChildScrollView(
                child: Form(
                  key: state.formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                        maxLines: 5,
                        controller: phoneController,
                        onChange: addTaskCubit.onChangeTodo,
                        validator: ValidationService.requiredFieldValidator,
                        autoValidate: state.validateField,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        textInputType: TextInputType.text,
                        fillColor: (context.isDark)
                            ? AppMaterialColors.black[100]
                            : AppMaterialColors.white,
                        hintText: 'Add ur task!',
                      ),

                      TextButton(
                          onPressed: () async {
                            addTaskCubit.changeStatus(TaskStatus.initial);

                            SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            int? userIds = sharedPreferences
                                .getInt(SharedPreferencesKeys.userId);
                            addTaskCubit.onChangeId(userIds);
                            addTaskCubit.submit();
                          },
                          child: const Text('Add Task')),
                      Container(
                        height: 5,
                        width: 101.w,
                        decoration: BoxDecoration(
                            color: AppMaterialColors.grey.shade400,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<dynamic> taskCrud(BuildContext context, TaskModel model,
      {bool isUpdate = false}) {
    phoneController.text = model.todo;
    return showModalBottomSheet(
      context: context,
      //isDismissible: false,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      isScrollControlled: true,
      builder: (context) {
        return BlocConsumer<AddTaskCubit, AddTaskState>(
          bloc: addTaskCubit,
          listener: (context, state) {
            if (state.status == TaskStatus.success) {
              addTaskCubit.showToast("Successfully done!".tr());
              context.pop();
            }
            if (state.status == TaskStatus.error) {
              addTaskCubit.showToast("Task error!".tr());
            }
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: context.theme.cardColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: SingleChildScrollView(
                child: Form(
                  key: state.formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                        maxLines: 5,
                        controller: phoneController,
                        onChange: addTaskCubit.onChangeTodo,
                        validator: ValidationService.requiredFieldValidator,
                        autoValidate: state.validateField,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        textInputType: TextInputType.text,
                        fillColor: (context.isDark)
                            ? AppMaterialColors.black[100]
                            : AppMaterialColors.white,
                        hintText: 'Add ur task!',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () async {
                                addTaskCubit.changeStatus(TaskStatus.initial);

                                addTaskCubit.onChangeComplete(
                                    model.completed == "true"
                                        ? "false"
                                        : "true");
                                addTaskCubit.onChangeId(model.id);
                                addTaskCubit.editSubmit();
                              },
                              child: const Text('Edit the Task')),
                          TextButton(
                              onPressed: () async {
                                addTaskCubit.changeStatus(TaskStatus.initial);
                                addTaskCubit.onChangeId(model.id);
                                addTaskCubit.deleteSubmit();
                              },
                              child: const Text('Delete the Task')),
                        ],
                      ),

                      Container(
                        height: 5,
                        width: 101.w,
                        decoration: BoxDecoration(
                            color: AppMaterialColors.grey.shade400,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
