import 'package:task_manager_app/core/domain/presentation/resources/theme/app_color.dart';
import 'package:task_manager_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/domain/presentation/widgets/custom_dialog.dart';
import '../widgets/sign_in/sign_in_first_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //Basic
  List<Widget> pageViewContents = [];
  PageController pageController = PageController();
  final ValueNotifier<int> buildCount = ValueNotifier<int>(0);
  int courentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> onPopScope3() {
    return showDialog(
        context: context,
        builder: (BuildContext contextDialog) {
          return CustomDialog(
            title: "Are you sure?".tr(),
            descriptions: "you will lose all entered data".tr(),
            onPress: () {
              Navigator.of(context).pop(true);
            },
            withOutButton: false,
            isActiveCancelButton: true,
          );
        }).then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onPopScope3,
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: AppColors.black),
            title: Text(
              "sign in".tr(),
              style: const TextStyle(color: AppColors.black),
            ),
            backgroundColor: AppColors.white,
            elevation: 0,
          ),
          body: SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pageViewContents.length,
                        (index) => buildDots(index),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.0.h,
                  ),
                  BlocProvider(
                    create: (context) => LoginCubit(),
                    child: SizedBox(
                        height: 0.8.sh,
                        child: Column(
      children: [
        Expanded(
          child:  SignInFirstWidget(
       // pageController: pageController,
      ),
        ),
      ],
    )),
                  ),
                ],
              )))),
    );
  }

  AnimatedContainer buildDots(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 1.h,
      width: (courentPage == index ? 25 : 8),
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black.withOpacity(0.4),
      ),
    );
  }
  
}
