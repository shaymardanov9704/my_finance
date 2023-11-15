import 'package:flutter/material.dart';
import 'package:my_finance/core/common/words.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';
import 'package:my_finance/features/skeleton/dialogs/language_dialog.dart';
import 'package:my_finance/features/skeleton/widgets/custom_theme_switch_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 60),
          _DrawerItem(
            title: Words.darkMode.tr(),
            icon: const CustomSwitchThemeWidget(),
          ),
          _DrawerItem(
            title: Words.share.tr(),
            icon: const Padding(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.share),
            ),
          ),
          _DrawerItem(
            title: Words.aboutApp.tr(),
            icon: const Padding(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.info),
            ),
          ),
          _DrawerItem(
            title: Words.changeLan.tr(),
            onTap: () {
              showDialog(
                  context: context, builder: (_) => const LanguageDialog());
            },
            icon: const Padding(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.language),
            ),
          ),
          _DrawerItem(
            title: Words.close.tr(),
            icon: const Padding(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final Function()? onTap;

  const _DrawerItem({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTextStyles.style600),
            icon,
          ],
        ),
      ),
    );
  }
}
