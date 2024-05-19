import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:task_manager_app/features/Task/presentation/cubits/add_task/add_task_cubit.dart';
import 'package:task_manager_app/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'core/data/enums/auth_state.dart';
import 'core/domain/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'core/domain/presentation/blocs/theme_bloc/theme_state.dart';
import 'core/domain/presentation/resources/theme/app_color_scheme.dart';
import 'core/domain/presentation/resources/theme/app_theme.dart';
import 'di/injection.dart';
import 'features/auth/presentation/cubits/authentication_cubit.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  int counter = 0;
  GoRouter router = getRouter(AuthState.unKnown);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => getIt<ThemeBloc>()),
        BlocProvider(
            create: (BuildContext context) => getIt<AuthenticationCubit>()),
        BlocProvider(create: (BuildContext context) => AddTaskCubit()),
      ],
      child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listenWhen: (current, next) {
          return next.authState != AuthState.unKnown;
        },
        listener: (context, state) {
          String message = '';
          switch (state.authState) {
            case AuthState.authenticated:
              message = "Welcome".tr();
              break;
            case AuthState.unAuthenticated:
              message = "you need to login first".tr();
              break;
            case AuthState.firstTime:
              message = "Welcome".tr();
              break;
            case AuthState.guestMode:
              message = "Welcome".tr();
              break;
            case AuthState.unKnown:
              // TODO: Handle this case.
              break;
          }
          if (message.isNotEmpty) {
            message.showToast();
          }
          router = getRouter(state.authState);
        },
        builder: (context, authStatus) => BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            var themeMode = ThemeMode.light;
            if (state is ThemeInitial) {
              themeMode = state.isDarkMode ? ThemeMode.dark : ThemeMode.light;
              if (state.isDarkMode) {
                Theme.of(context).copyWith(brightness: Brightness.dark);
              } else {
                Theme.of(context).copyWith(brightness: Brightness.light);
              }
            } else if (state is DarkThemeState) {
              themeMode = ThemeMode.dark;
              Theme.of(context).copyWith(brightness: Brightness.dark);
            } else if (state is LightThemeState) {
              themeMode = ThemeMode.light;
              Theme.of(context).copyWith(brightness: Brightness.light);
            }

            return ScreenUtilInit(
              designSize: const Size(350, 750),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp.router(
                  routeInformationProvider: router.routeInformationProvider,
                  routeInformationParser: router.routeInformationParser,
                  routerDelegate: router.routerDelegate,
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  title: 'TaskManager',
                  theme: AppTheme(AppLightColorScheme()).getThemeData(context),
                  darkTheme:
                      AppTheme(AppDarkColorScheme()).getThemeData(context),
                  themeMode: themeMode,
                );
              },
              child: Container(),
            );
          },
        ),
      ),
    );
  }
}
