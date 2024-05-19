import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:task_manager_app/features/Task/data/model/get_my_occasions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OccasionListWidget extends StatelessWidget {
  final TaskModel taskModel;

  const OccasionListWidget({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        taskModel.todo,
                          style: context.textTheme.headlineMedium,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                         taskModel.userId.toString(),
                          style: context.textTheme.bodySmall,
                        ),
                        /*Text(taskModel.status.getName(),
                            style: context.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: taskModel.status.getStatusColor()))*/
                      ],
                    ),
                  ),
                  // generateListImageOfShops(
                  //     taskModel.TaskOccasionModelList)
                ],
              ),
             
              SizedBox(height: 6.h),
         Text(
                 taskModel.completed == 0?"Completed":"Not Completed",
                   
                  ),
              SizedBox(height: 6.h),
            ],
          ),
        ),
      
    );
  }
}