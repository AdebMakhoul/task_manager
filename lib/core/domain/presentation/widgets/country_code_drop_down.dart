/*

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryCodeChooser extends StatelessWidget {
  final List<CountryModel> items;
  final void Function(CountryModel) onChanged;
  final CountryModel selectedItem;

  const CountryCodeChooser(
      {Key? key, required this.items, required this.onChanged, required this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    height: 6,
                    width: 50.w,
                    decoration: BoxDecoration(
                        color: AppMaterialColors.grey.shade400,
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFiled(
                    controller: TextEditingController(),
                    hintText: 'Search',
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (ctx, i) {
                        return InkWell(
                          onTap: () {
                            onChanged(items[i]);
                            Navigator.of(context).pop();
                          },
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomSvgIcon(
                                  items[i].flag,
                                  size: 25.w,
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(items[i].code),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(items[i].name),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppMaterialColors.grey.shade300),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        padding: EdgeInsets.all(14.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText.p16(
              selectedItem.code ,
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 16.w),
            Icon(
              Icons.keyboard_arrow_down,
              color: AppMaterialColors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}*/
