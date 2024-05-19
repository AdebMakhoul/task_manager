import 'package:task_manager_app/MainPage/cubits/main_page_cubit.dart';
import 'package:task_manager_app/core/domain/presentation/resources/theme/app_color.dart';
import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:task_manager_app/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/resources/assets.gen.dart';
import '../../../features/Task/presentation/pages/occasions_list/my_occasions_main_page.dart';

class MainScreen extends StatefulWidget {
  final String section;

  const MainScreen({super.key, required this.section});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> pages = [
    const MyOccasionsMainPage(),
  ];

  Map<int, String> indexToSectionMap = {
    0: AppPaths.main.home,
  };

  int sectionToIndex(String section) {
    Map<String, int> sectionToIndexMap =
        indexToSectionMap.map((k, v) => MapEntry(v, k));

    return sectionToIndexMap[section] ?? 4;
  }

  String indexToSection(int index) {
    return indexToSectionMap[index] ?? AppPaths.main.home;
  }

  @override
  void initState() {
    if (context.isAuth) {
      // BlocProvider.of<OfferCubit>(context).getOfferDataList();
    //  BlocProvider.of<ProfileCubit>(context).getProfileList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentPageIndex = sectionToIndex(widget.section);
    return WillPopScope(
      onWillPop: () async {
        if (currentPageIndex == 0) {
          return true;
        } else {
          context.go(AppPaths.main.home);
          return false;
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MainPageCubit>(
            create: (context) => MainPageCubit(),
          ),
    
        ],
        child: Scaffold(
          key: _scaffoldKey,
        //  drawer: const NavigationDrawerWidget(),
          appBar: AppBar(
            elevation: 2,
            iconTheme: const IconThemeData(color: AppColors.black),
            leading: InkWell(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                child: SvgPicture.asset(
                  context.isArabic ? Assets.icons.menuSvg : Assets.icons.manuEn,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            title: currentPageIndex == 3
                ? Text(
                    "Tasks".tr(),
                  )
                : !context.isAuth
                    ? InkWell(
                        onTap: () {
                          context.push(AppPaths.auth.welcomeScreen);
                        },
                        child: Container(
                          width: 1.sw,
                          alignment: Alignment.center,
                          child: SizedBox(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "Login".tr(),
                                style: context.textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ))
                    // : const PlanOccasionBottomSheetWidget(),
                    : Container(),
            backgroundColor: AppColors.white,
            actions: [
              InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      width: 20.0.w,
                      height: 20.0.w,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            child: Icon(
                              Icons.notifications_none,
                              color: context.theme.primaryColor,
                              size: 25.0.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        
          body: pages[currentPageIndex],
        ),
      ),
    );
  }
}
