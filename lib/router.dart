import 'package:task_manager_app/MainPage/domain/pages/main_screen.dart';
import 'package:task_manager_app/features/auth/presentation/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/features/splash/presentation/pages/on_boarding_pages/on_boarding_pages_list.dart';
import 'core/data/enums/auth_state.dart';
import 'features/auth/presentation/pages/sign_in_page.dart';
import 'features/splash/presentation/pages/splash_pages/splash_page.dart';

abstract class AppPaths {
  static const splash = _SplashPaths();
  static const auth = _AuthPaths();
  static const main = _MainPaths();
  static const category = _CategoryPaths();

  static const occasion = _OccasionPaths();

  static const product = _ProductPaths();
  static const productDetails = _ProductDetailsPaths();
  static const event = _EventPaths();
  static const shop = _ShopDetailsPaths();

  static const favorite = _FavoritePaths();
}

class _SplashPaths {
  const _SplashPaths();

  String get splash => '/splash';

  String get onBoardingPage => '/onBoardingPage';
}

class _CategoryPaths {
  const _CategoryPaths();

  String get getCategory => '/home/category/:id/:name';
}

class _ShopDetailsPaths {
  const _ShopDetailsPaths();

  String get getShopDetails => '/home/shopDetails/:shopId';

  String get review => '/home/review';

  String get reviewCreate => '/home/review/create';
}

class _EventPaths {
  const _EventPaths();

  String get getEvent => '/home/eventDetais/:eventId';
}

class _OccasionPaths {
  const _OccasionPaths();

  String get occasionDetails => '/main/orders/occasion_details';

  String get occasionOrderDetails => '/main/orders/occasion_order_details';
}

class _ProductPaths {
  const _ProductPaths();

  String get getProducts =>
      '/home/product/:categoryId/:classificationId/:categoryName';
}

class _FavoritePaths {
  const _FavoritePaths();

  String get getFavorite => '/favorite/mainPage';
}

class _ProductDetailsPaths {
  const _ProductDetailsPaths();

  String get getProductDetails => '/home/productDetails/:productId';
}

class _AuthPaths {
  const _AuthPaths();

  String get signIn => '/auth/SignIn';

  String get welcomeScreen => '/auth/welcomeScreen';

}

class _MainPaths {
  const _MainPaths();

  final String _base = '/main';

  String get home => '$_base/home';


  @override
  String toString() {
    return _base;
  }
}

GoRouter getRouter(AuthState authState) {
  String initialPath = '/';
  switch (authState) {
    case AuthState.unKnown:
      initialPath = AppPaths.splash.splash;
      break;
    case AuthState.authenticated:
      initialPath = AppPaths.main.home;
      break;
    case AuthState.unAuthenticated:
      initialPath = AppPaths.auth.welcomeScreen;
      break;
    case AuthState.guestMode:
      initialPath = AppPaths.main.home;
      break;
    case AuthState.firstTime:
      initialPath = AppPaths.splash.onBoardingPage;
      break;
    // case AuthState.authenticatedWithNoAddresses:
    //   initialPath = AppPaths.address.choices;
    //   break;
    // case AuthState.authenticatedWithAddresses:
    //   initialPath = AppPaths.main.home;
    //   break;
  }
  return GoRouter(
    initialLocation: initialPath,
    routes: <GoRoute>[
      GoRoute(
        path: AppPaths.splash.splash,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashPage(),
      ),
      GoRoute(
        path: AppPaths.splash.onBoardingPage,
        builder: (BuildContext context, GoRouterState state) =>
            const OnBoardingPage(),
      ),
      GoRoute(
        path: AppPaths.auth.signIn,
        builder: (BuildContext context, GoRouterState state) =>
            const SignInPage(),
      ),
      GoRoute(
        path: AppPaths.auth.welcomeScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const WelcomeScreen(),
      ),

      GoRoute(
        path: '${AppPaths.main}/:section',
        builder: (BuildContext context, GoRouterState state) {
          return MainScreen(
              section: '/main/${state.pathParameters['section']}');
        },
      ),
    
    ],
  );
}
