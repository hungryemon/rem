import 'package:rem/helpers/app_export.dart';
import 'package:rem/helpers/utils/date_time_utils.dart';

import '../../helpers/constants/color_constants.dart';
import 'controller/view_todo_controller.dart';
import 'package:flutter/material.dart';
import '../../app/base/base_view.dart';

// ignore: must_be_immutable
class ViewTodoScreen extends BaseView<ViewTodoController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar();
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.viewTodoModelObj.value.title ?? '',
                style: Theme.of(context).textTheme.headlineLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (controller.viewTodoModelObj.value.dateTime != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Theme.of(context).iconTheme.color,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          controller.viewTodoModelObj.value.dateTime!
                              .format('dd-MM-yyyy hh:mm a'),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color: Get.isDarkMode
                                      ? Colors.white60
                                      : ColorConstants.remBlack60),
                        )
                      ],
                    ),
                  const SizedBox(
                    width: 16,
                  ),
                  if (controller.viewTodoModelObj.value.status != null)
                    Container(
                      decoration: BoxDecoration(
                          color: controller.viewTodoModelObj.value.status ==
                                  'Pending'
                              ? ColorConstants.remWarning
                              : controller.viewTodoModelObj.value.status ==
                                      'Ongoing'
                                  ? ColorConstants.remOxfordBlue
                                  : ColorConstants.remSuccess,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                        child: Text(
                          controller.viewTodoModelObj.value.status!,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: ColorConstants.white),
                        ),
                      ),
                    )
                ],
              ),
              SizedBox(
                height: 16.v,
              ),
              if (controller.viewTodoModelObj.value.content != null)
                Text(
                  controller.viewTodoModelObj.value.content!,
                  style: Theme.of(context).textTheme.bodyLarge,
                  softWrap: true,
                )
            ],
          ),
        ),
      ),
    );
  }
}
