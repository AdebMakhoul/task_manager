import 'package:task_manager_app/core/domain/presentation/resources/theme/app_color.dart';
import 'package:task_manager_app/core/domain/presentation/widgets/custom_container.dart';
import 'package:task_manager_app/core/presentation/resources/assets.gen.dart';
import 'package:task_manager_app/router.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Align(
                  alignment: context.locale == const Locale("ar")
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 0.03.sh,
                        bottom: 0.05.sh,
                        left: 0.05.sh,
                        top: 0.01.sh),
                    child: Image.asset(
                      Assets.icons.appicon.path,
                      width: 0.50.sw,
                    ),
                  ),
                ),
               
              ],
            ),
            Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  width: 1.sw,
                  height: 0.46.sh,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage(Assets.images.howUseBackground.path),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                    height: 0.35.sh,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomContainer(
                          width: 0.35.sw,
                          borderRadius: 10,
                          backgroundColor: AppColors.white,
                          child: TextButton(
                            child: Text(
                              "sign in".tr(),
                              style: TextStyle(
                                  color: AppColors.blue, fontSize: 14.sp),
                            ),
                            onPressed: () {
                              context.push(AppPaths.auth.signIn);
                            },
                          ),
                        ),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
