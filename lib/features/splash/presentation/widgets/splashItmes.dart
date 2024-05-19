import 'package:easy_localization/easy_localization.dart' as l;

import '../../../../core/presentation/resources/assets.gen.dart';
class UnbordingContant {
  String image;
  String? title;
  String? supTitle1;
  String? supTitle2;

  UnbordingContant({required this.image, this.supTitle1, this.supTitle2,this.title});
}

List<UnbordingContant> constants = [
  UnbordingContant(
    image: Assets.images.first.path,
    title: null,
    supTitle1:  "Welcome to this application".tr(),
    supTitle2: "we are going to help u to organize ur tasks".tr(),
  ),
  UnbordingContant(
    image: Assets.images.secound.path,
    title: "easy application".tr(),
    supTitle1: "free for everyone".tr(),
    supTitle2: "to organize ur tasks".tr(),

  ),
  UnbordingContant(
    image: Assets.images.third.path,
    title: "complete your request successfully".tr(),
    supTitle1: "you can add, edit, or".tr(),
    supTitle2: "delete ur tasks".tr(),
  ),
  UnbordingContant(
    image: Assets.images.fourth.path,
    title: "Order confirmation and processing".tr(),
    supTitle1: "Organize ur tasks".tr(),
    supTitle2:  "And you will be able to share the joy of your tasks".tr(),
  ),
];
