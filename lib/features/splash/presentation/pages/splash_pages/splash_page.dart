import 'package:task_manager_app/core/presentation/resources/assets.gen.dart';
import 'package:task_manager_app/features/splash/presentation/cubits/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/domain/presentation/widgets/custom_app_text.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      bloc: SplashCubit()..startCounter(),
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
            body: Center(
              child: Lottie.asset(
                Assets.jsonAnimations.splash,
                repeat: false,
                width: 0.6 * 1.sw,
                height: 0.3 * 1.sh,
              ),
            ));
      },
    );
  }
}
