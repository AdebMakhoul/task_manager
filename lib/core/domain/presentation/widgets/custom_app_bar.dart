
import 'package:task_manager_app/core/domain/presentation/resources/theme/app_gradients.dart';
import 'package:task_manager_app/core/domain/presentation/resources/theme/app_material_color.dart';
import 'package:flutter/material.dart';

ContinuousRectangleBorder continuousRectangleBorder =
    const ContinuousRectangleBorder();

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color? color;
  const CustomAppbar(
      {Key? key, required this.title, this.actions, this.leading, this.bottom,this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.3,
      title: Text(title, style: Theme.of(context).textTheme.headline3!.copyWith(color: AppMaterialColors.white)),
      actions: actions,
      shape: continuousRectangleBorder,
      centerTitle: true,
      leading: leading,
      backgroundColor: color,
      flexibleSpace: Container(
        decoration:
            BoxDecoration(gradient: AppGradients.greenGradientHorizontal),
      ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
