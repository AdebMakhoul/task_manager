import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class NotImplementedWidget extends StatelessWidget {
  final Widget child;
  String? message;

  NotImplementedWidget({Key? key, required this.child, this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // if(ScaffoldMessenger.of(context).)
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: context.theme.primaryColorDark,

          content: Text(message ?? 'Coming Soon',style: context.textTheme.subtitle2,),
        )).closed.then((value) => ScaffoldMessenger.of(context).clearSnackBars());
      },
      child: IgnorePointer(
        child: Opacity(
          opacity: 0.5,
          child: child,
        ),
      ),
    );
  }
}
