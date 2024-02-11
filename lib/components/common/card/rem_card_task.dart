import 'package:flutter/material.dart';
import 'package:rem/helpers/app_export.dart';

import '../../../helpers/constants/color_constants.dart';

class RemCardTask extends StatelessWidget {
  RemCardTask({
    super.key,
    required this.title,
    required this.dateTime,
    required this.status,
    required this.onPressDelete,
    required this.onPressUpdate,
    required this.onPressCard,
    required this.isDarkMode,
  });

  final String title;
  final DateTime dateTime;
  final String status;
  final Function() onPressDelete;
  final Function() onPressUpdate;
  final Function() onPressCard;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorConstants.remBlack40)),
        child: Material(
          color: ColorConstants.transparent,
          child: InkWell(
            splashFactory: InkSparkle.splashFactory,
            borderRadius: BorderRadius.circular(12),
            onTap: onPressCard,
            splashColor: ColorConstants.transparent,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: _buildContent(context)),
                  const SizedBox(
                    width: 8,
                  ),
                  _buildButtons(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildContent(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Theme.of(context).iconTheme.color,
                  size: 14,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  dateTime.format('dd-MM-yyyy hh:mm a'),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: isDarkMode ? Colors.white60 : ColorConstants.remBlack60),
                )
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              decoration: BoxDecoration(
                  color: status == 'Pending'
                      ? ColorConstants.remWarning
                      : status == 'Ongoing'
                          ? ColorConstants.remOxfordBlue
                          : ColorConstants.remSuccess,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Text(
                  status,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: ColorConstants.white),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  _buildButtons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            padding: const EdgeInsets.all(8),
            onPressed: onPressUpdate,
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(ColorConstants.remBlue)),
            splashColor: ColorConstants.remBlue80,
            icon: Icon(
              Icons.edit,
              size: 24,
              color: ColorConstants.white,
            )),
        const SizedBox(
          width: 4,
        ),
        IconButton(
            padding: const EdgeInsets.all(8),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(ColorConstants.remError)),
            onPressed: onPressDelete,
            splashColor: ColorConstants.remError80,
            icon: Icon(
              Icons.delete,
              size: 24,
              color: ColorConstants.white,
            )),
      ],
    );
  }
}
