import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_finance/core/extentions/string_extension.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/features/debts/presentation/pages/debts_page.dart';
import 'package:my_finance/features/skeleton/provider/theme_provider.dart';
import 'package:my_finance/features/expenses/presentation/pages/expenses_page.dart';
import 'package:my_finance/features/skeleton/widgets/custom_drawer.dart';
import 'package:my_finance/features/statistics/presentation/pages/statistics_page.dart';
import 'package:my_finance/core/generated/locale_keys.g.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  final _controller = PersistentTabController();
  final List<Widget> _pages = const [
    ExpensesPage(),
    DebtsPage(),
    StatisticsPage(),
  ];

  String appBarTitle(int index) {
    if (index == 0) {
      return LocaleKeys.expensesPage.tr();
    } else if (index == 1) {
      return LocaleKeys.debtsPage.tr();
    } else {
      return LocaleKeys.statisticsPage.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeProvider>().isDark
        ? AppColors.green
        : AppColors.primary;
    return Container(
      color: context.watch<ThemeProvider>().isDark
          ? AppColors.darkBackground
          : AppColors.background,
      child: SafeArea(
        bottom: true,
        child: Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle(_controller.index)),
          ),
          drawer: const CustomDrawer(),
          body: PersistentTabView(
            context,
            controller: _controller,
            screens: _pages,
            items: [
              PersistentBottomNavBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/wallet.svg',
                  color: color,
                ),
                title: LocaleKeys.expenses.tr().toCamelCase(),
                activeColorPrimary: color,
                inactiveColorPrimary: color,
              ),
              PersistentBottomNavBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/card_transfer.svg',
                  color: color,
                ),
                title: LocaleKeys.debts.tr().toCamelCase(),
                activeColorPrimary: color,
                inactiveColorPrimary: color,
              ),
              PersistentBottomNavBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/statistics.svg',
                  height: 22,
                  color: color,
                ),
                title: LocaleKeys.statisticsPage.tr(),
                activeColorPrimary: color,
                inactiveColorPrimary: color,
              ),
            ],
            onItemSelected: (_) => setState(() {}),
            confineInSafeArea: true,
            backgroundColor: context.watch<ThemeProvider>().isDark
                ? AppColors.darkBackground
                : AppColors.background,
            decoration: NavBarDecoration(
              boxShadow: [
                BoxShadow(
                  color: context.watch<ThemeProvider>().isDark
                      ? AppColors.background
                      : AppColors.darkBackground,
                  offset: const Offset(-1, 0),
                  blurRadius: 0.1,
                  spreadRadius: 0.2,
                )
              ],
            ),
            resizeToAvoidBottomInset: true,
            hideNavigationBarWhenKeyboardShows: true,
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.linear,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style9,
          ),
        ),
      ),
    );
  }
}
