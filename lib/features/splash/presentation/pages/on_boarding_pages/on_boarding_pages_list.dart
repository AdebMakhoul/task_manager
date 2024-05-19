import 'package:task_manager_app/core/domain/presentation/widgets/custom_dialog.dart';
import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:task_manager_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart' as l;

import '../../../../../core/domain/presentation/resources/theme/app_color.dart';
import '../../cubits/onboarding_cubit/onboarding_cubit.dart';
import '../../widgets/splashItmes.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  Future<bool> onPopScope2() {
    return showDialog(
        context: context,
        builder: (BuildContext contextDialog) {
          return CustomDialog(
            title: "Are you sure?".tr(),
            descriptions: "Do you want to exit the program".tr(),
            onPress: () {
              Navigator.of(context).pop(true);
            },
            withOutButton: false,
            isActiveCancelButton: true,
          );
        }).then((value) => value ?? false);
  }

  late OnboardingCubit onboardingCubit;
  int crrentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    onboardingCubit = OnboardingCubit();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      bloc: onboardingCubit,
      listener: (context, state) {},
      builder: (context, state) {
        return WillPopScope(
          onWillPop: onPopScope2,
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              automaticallyImplyLeading: false,
              actions: [
                TextButton(
                  child: Text(
                    crrentIndex != constants.length - 1 ? "skip".tr() : "",
                    style: GoogleFonts.tajawal(
                      color: AppColors.fontGray,
                      fontSize: 12.sp,
                    ),
                  ),
                  onPressed: () {
                    onboardingCubit.changeIsFirstTime();
                    context.go(AppPaths.auth.welcomeScreen);
                  },
                )
              ],
              leading: Container(),
              centerTitle: true,
              title: Padding(
                padding: EdgeInsets.zero,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    constants.length,
                    (index) => biuldDots(index),
                  ),
                ),
              ),
              elevation: 0,
            ),
            body: Container(
              color: AppColors.white,
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (int index) {
                        setState(() {
                          crrentIndex = index;
                        });
                      },
                      itemCount: constants.length,
                      itemBuilder: (_, i) {
                        return SizedBox(
                          width: double.infinity,
                          child: Container(
                            color: AppColors.white,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: <Widget>[
                                      const Spacer(
                                        flex: 2,
                                      ),
                                      Image.asset(
                                        constants[i].image,
                                        width: 0.80.sw,
                                        height: 0.34.sh,
                                        fit: BoxFit.contain,
                                      ),
                                      const Spacer(
                                        flex: 1,
                                      ),
                                      // Spacer(flex: 1),
                                      if (constants[i].title != null) ...{
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.h),
                                          child: Text(
                                            constants[i].title!,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.tajawal(
                                                fontSize: 15.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      },
                                      SizedBox(
                                        height: 0.02.sh,
                                      ),
                                      if (constants[i].supTitle1 != null)
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0.05.sh),
                                          child: Text(
                                            constants[i].supTitle1!,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.tajawal(
                                              fontSize: 11.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      if (constants[i].supTitle2 != null)
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0.05.sh),
                                          child: Text(
                                            constants[i].supTitle2!,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.tajawal(
                                              fontSize: 11.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      const Spacer(
                                        flex: 2,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: SizedBox(
                      width: 0.32.sw,
                      height: 0.06.sh,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: context.theme.primaryColor,
                        ),
                        onPressed: () {
                          if (crrentIndex == constants.length - 1) {
                            onboardingCubit.changeIsFirstTime();
                            context.go(AppPaths.auth.welcomeScreen);
                          }
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.bounceInOut);
                        },
                        child: Text(
                          crrentIndex == constants.length - 1
                              ? "Continue".tr()
                              : "next".tr(),
                          style: GoogleFonts.tajawal(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AnimatedContainer biuldDots(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 1.h,
      width: (crrentIndex == index ? 25 : 8),
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.black.withOpacity(0.6),
      ),
    );
  }
}
