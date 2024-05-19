import 'package:task_manager_app/core/domain/presentation/widgets/loading_banner.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomFooterWidget extends StatelessWidget {
  const CustomFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (context, mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Text("pull up load".tr());
        } else if (mode == LoadStatus.loading) {
          body = const LoadingBanner();
        } else if (mode == LoadStatus.failed) {
          body = Text("Load Failed!".tr());
        } else if (mode == LoadStatus.canLoading) {
          body = Text("release to load more".tr());
        } else {
          body = const SizedBox();
        }
        return SizedBox(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }
}
