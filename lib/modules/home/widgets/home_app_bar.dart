import 'package:flutter/material.dart';
import 'package:rem/helpers/app_export.dart';

import '../../../components/common/button/rem_switch.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({
    super.key,
    required this.photoUrl,
    required this.name,
    required this.email,
    required this.isDarkMode,
    required this.onChangeTheme,
    this.onLogout,
  });

  final String photoUrl;
  final String name;
  final String email;
  final Function(ThemeMode themeMode) onChangeTheme;
  final Function()? onLogout;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildAvatar(context),
          const SizedBox(
            width: 8,
          ),
          Expanded(child: _buildNameAndEmail(context)),
          const SizedBox(
            width: 8,
          ),
          _buildThemeToggle(context),
          const SizedBox(
            width: 8,
          ),
          if (onLogout != null) _buildLogoutButton(context),
        ],
      ),
    );
  }

  _buildLogoutButton(context) {
    return IconButton(
      padding: const EdgeInsets.all(8),
      icon: Icon(
        Icons.logout,
        size: 24,
        color: ColorConstants.remBlack80,
      ),
      onPressed: onLogout,
    );
  }

  _buildNameAndEmail(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: ColorConstants.remBlack),
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          email,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color:  ColorConstants.remBlack40),
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  _buildAvatar(context) {
    return photoUrl.isNotEmpty
        ? ClipOval(
            child: Material(
              color: Theme.of(context).primaryColor,
              child: Image.network(
                photoUrl,
                height: 40,
                width: 40,
                fit: BoxFit.fitHeight,
              ),
            ),
          )
        : ClipOval(
            child: Material(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: ColorConstants.remBlack,
                ),
              ),
            ),
          );
  }

  _buildThemeToggle(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: RemSwitch(
        value: Get.isDarkMode,
        switchSize: RemSwitchSize.LARGE,
        borderRadius: 30.0,
        activeToggleColor: ColorConstants.remBlack,
        inactiveToggleColor: ColorConstants.remYellow,
        activeSwitchBorder: Border.all(
          color: ColorConstants.remBlack,
          width: 1.0,
        ),
        inactiveSwitchBorder: Border.all(
          color: ColorConstants.white,
          width: 1.0,
        ),
        activeColor: ColorConstants.remBlack80,
        inactiveColor: ColorConstants.remYellowOpac,
        activeIcon: const Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.nightlight,
            color: ColorConstants.remYellow,
          ),
        ),
        inactiveIcon: const Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.sunny,
            color: ColorConstants.white,
          ),
        ),
        onToggle: (val) {
          onChangeTheme(
            Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 56.v);
}
