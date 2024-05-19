import 'dart:ui' as ui;
import 'package:task_manager_app/core/domain/presentation/resources/theme/app_color.dart';
import 'package:task_manager_app/core/domain/presentation/resources/theme/app_material_color.dart';
import 'package:task_manager_app/core/domain/presentation/services/validation_service.dart';
import 'package:task_manager_app/core/domain/presentation/widgets/custom_container.dart';
import 'package:task_manager_app/core/domain/presentation/widgets/custom_form_field.dart';
import 'package:task_manager_app/core/domain/presentation/widgets/error_banner.dart';
import 'package:task_manager_app/core/domain/presentation/widgets/loading_banner.dart';
import 'package:task_manager_app/core/presentation/resources/assets.gen.dart';
import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/domain/presentation/widgets/svg_icon.dart';
import '../../cubits/login_cubit/login_cubit.dart';

class SignInFirstWidget extends StatefulWidget {
  // final PageController pageController;

  // const SignInFirstWidget({super.key, required this.pageController});

  @override
  State<SignInFirstWidget> createState() => _SignInFirstWidgetState();
}

class _SignInFirstWidgetState extends State<SignInFirstWidget> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late LoginCubit loginCubit;

  @override
  void initState() {
    super.initState();
    loginCubit = BlocProvider.of<LoginCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: loginCubit,
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
         // nextPage();
        }
        if (state.status == LoginStatus.notFoundUser) {
          loginCubit.showToast("Wrong Number!");
        }
      },
      builder: (context, state) {
        return Form(
                    key: state.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 20.h),
                          child: Column(
                            children: [
                              Image.asset(
                                Assets.icons.appicon.path,
                                height: 150.h,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Welcome back".tr(),
                                style: context.textTheme.displayMedium!
                                    .copyWith(
                                        color: context.theme.primaryColor),
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22.0.sp),
                            child: Container(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text("Enter your username:".tr()),
                            )),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                            Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.sp),
                  child:
                  Directionality(
                    textDirection: ui.TextDirection.ltr,
                    child: CustomFormField(
                      controller: phoneController,
                      onChange: loginCubit.onChangeEmail,
                      hintText: "Username".tr(),
                      prefixIcon: CustomSvgIcon(
                        Assets.icons.lockSvg,
                        size: 20,
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      textInputType: TextInputType.text,
                      fillColor: (context.isDark)
                          ? AppMaterialColors.black[100]
                          : AppMaterialColors.white,
                    ),
                  ),
                ),
                       SizedBox(
                  height: 0.03.sh,
                ),
                            Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.0.sp),
                    child: Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text("Enter the password".tr()),
                    )),
                SizedBox(
                  height: 0.01.sh,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.sp),
                  child:
                  Directionality(
                    textDirection: ui.TextDirection.ltr,
                    child: CustomFormField(
                      controller: passwordController,
                      onChange: loginCubit.onChangePassword,
                      hintText: "Password".tr(),
                      validator: ValidationService.requiredFieldValidator,
                      autoValidate: state.validateField,
                      prefixIcon: CustomSvgIcon(
                        Assets.icons.lockSvg,
                        size: 20,
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      textInputType: TextInputType.text,
                      fillColor: (context.isDark)
                          ? AppMaterialColors.black[100]
                          : AppMaterialColors.white,
                      isPassword: state.isHidden,
                      suffix: InkWell(
                        child: state.isHidden
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onTap: () {
                          loginCubit.changePasswordVisibility();
                        },
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                if (state.status.name == LoginStatus.error.name &&
                    state.loginFailure != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.0.sp),
                    child: ErrorBanner(failure: state.loginFailure!),
                  ),
                (state.status == LoginStatus.loading)
                    ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LoadingBanner(),
                )
                    : Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: CustomContainer(
                      height: 50,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      borderRadius: 10,
                      backgroundColor: context.theme.primaryColor,
                      child: TextButton(
                        child: Text(
                          "sign in".tr(),
                          style: TextStyle(
                              color: AppColors.white, fontSize: 14.sp),
                        ),
                        onPressed: () {
                          loginCubit.submit();
                        },
                      ),
                    ),
                  ),
                ),
                      ],
                    ),
                  )
               ;
      },
    );
  }
}
