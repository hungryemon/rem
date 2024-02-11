import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({
    super.key,
    required this.photoUrl,
    required this.name,
    required this.email,
    required this.isDarkMode,
    this.onChangeTheme,
    this.onLogout,
  });

  final String photoUrl;
  final String name;
  final String email;
  final Function()? onChangeTheme;
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
        color: Colors.black87,
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
          style: Theme.of(context).textTheme.titleSmall,
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          email,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: isDarkMode ? Colors.white24 : Colors.black38),
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
                  color: Colors.black,
                ),
              ),
            ),
          );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
