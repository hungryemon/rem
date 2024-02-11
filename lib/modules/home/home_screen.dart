import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:rem/components/common/card/rem_card_task.dart';
import 'package:rem/data/model/response/mock_note_response.dart';
import 'package:rem/helpers/app_export.dart';
import 'package:rem/modules/home/widgets/home_app_bar.dart';
import 'package:rem/modules/view_todo/models/view_todo_model.dart';
import 'package:rem/routes/app_routes.dart';

import '../../app/controllers/auth_controller.dart';
import '../../components/common/toast/rem_toast.dart';
import '../../helpers/constants/color_constants.dart';
import 'controller/home_controller.dart';
import 'package:flutter/material.dart';
import '../../app/base/base_view.dart';

// ignore_for_file: must_be_immutable
class HomeScreen extends BaseView<HomeController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return HomeAppBar(
      photoUrl: AuthController.instance().getCurrentUser()?.photoURL ?? '',
      name: AuthController.instance().getCurrentUser()?.displayName ?? '',
      email: AuthController.instance().getCurrentUser()?.email ?? '',
      isDarkMode: Get.isDarkMode,
      onLogout: () async {
        AuthController.instance().googleSignOut();
      },
    );
  }

  @override
  Widget? floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        controller.titleController.text = '';
        controller.contentController.text = '';
        controller.selectedStatus('Pending');
        controller.selectedDate(DateTime.now());
        noteDialog(context, dialogType: DialogType.Create);
      },
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(
        Icons.add,
        color: ColorConstants.white,
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 56),
          child: Column(children: [
            Obx(() => ListView.separated(
                  itemCount: controller.notes.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  itemBuilder: (context, index) {
                    final note = controller.notes[index];
                    return RemCardTask(
                        title: note.title,
                        dateTime: note.dateTime,
                        status: note.status.name,
                        onPressDelete: () {
                          controller.deleteNote(id: note.id);
                        },
                        onPressUpdate: () {
                          controller.titleController.text = note.title;
                          controller.contentController.text = note.content;
                          controller.selectedStatus(note.status.name);
                          controller.selectedDate(note.dateTime);
                          noteDialog(context,
                              note: note, dialogType: DialogType.Update);
                        },
                        onPressCard: () {
                          Get.toNamed(AppRoutes.viewTodo, arguments: {
                            'arg': ViewTodoModel(
                              title: note.title,
                              content: note.content,
                              dateTime: note.dateTime,
                              status: note.status.name,
                            )
                          });
                        },
                        isDarkMode: Get.isDarkMode);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                ))
          ]),
        ),
      ),
    );
  }

  Future<dynamic> noteDialog(BuildContext context,
      {required DialogType dialogType, Note? note}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            surfaceTintColor: Theme.of(context).canvasColor,
            title: Text(dialogType == DialogType.Update
                ? 'Edit Note'.tr
                : 'Create Note'.tr),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: controller.titleController,
                    decoration: InputDecoration(
                        labelText: 'Title',
                        fillColor: Theme.of(context).dialogBackgroundColor,
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: controller.contentController,
                    decoration: InputDecoration(
                        labelText: 'Content', border: OutlineInputBorder()),
                    maxLines: 4,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    return DropdownSearch<String>(
                      selectedItem: controller.selectedStatus.value,
                      items: [
                        'Pending',
                        'Ongoing',
                        'Completed',
                      ],
                      onChanged: (value) {
                        controller.selectedStatus(value!);
                      },
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border:
                                  Border.all(color: ColorConstants.remBlack40)),
                          child: Material(
                            color: ColorConstants.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(4),
                              onTap: () {
                                DatePicker.showDateTimePicker(
                                  context,
                                  showTitleActions: true,
                                  onConfirm: (date) {
                                    logger.d('Confirm $date');
                                    controller.selectedDate(date);
                                  },
                                  currentTime: DateTime.now(),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                child: Text(
                                  controller.selectedDate.value
                                      .format('dd-MM-yyyy hh:mm a'),
                                  style:
                                      TextStyle(color: ColorConstants.remBlue),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (controller.titleController.text.trim().isEmpty) {
                    RemToast.error(
                      title: "Error".tr,
                      msg: "Please Provide a Title".tr,
                    );
                  } else if (controller.contentController.text.trim().isEmpty) {
                    RemToast.error(
                      title: "Error".tr,
                      msg: "Please Provide some description".tr,
                    );
                  } else {
                    if (dialogType == DialogType.Update && note != null) {
                      controller.updateNote(
                        id: note.id,
                        title: controller.titleController.text,
                        content: controller.contentController.text,
                        status:
                            Note.parseStatus(controller.selectedStatus.value),
                        dateTime: controller.selectedDate.value,
                      );
                    } else {
                      controller.addNote(
                        title: controller.titleController.text,
                        content: controller.contentController.text,
                        status:
                            Note.parseStatus(controller.selectedStatus.value),
                        dateTime: controller.selectedDate.value,
                      );
                    }
                    Navigator.of(context).pop();
                  }
                },
                child: Text(dialogType == DialogType.Update
                    ? 'Update'.tr
                    : 'Create'.tr),
              )
            ],
          );
        });
  }
}

enum DialogType {
  Create,
  Update,
}
