import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../resources/values_manager.dart';
import '../resources/img_manager.dart';
import '../resources/string_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../screens/home/home_screen.dart';
import '../resources/icon_manager.dart';
import 'about_screen.dart';

class SideBarScreen extends StatefulWidget {
  const SideBarScreen({Key? key}) : super(key: key);

  @override
  State<SideBarScreen> createState() => _SideBarScreenState();
}

class _SideBarScreenState extends State<SideBarScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Home',
      'icon': IconManager.home,
      'body': const HomeScreen(),
    },
    {
      'title': 'Settings',
      'icon': IconManager.settings,
      'body': const HomeScreen(),
    },
    {
      'title': 'About us',
      'icon': IconManager.aboutUs,
      'body': const AboutScreen(),
    },
  ];

  int _selectedDrawerIndex = 0;

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedDrawerIndex]['title']),
        actions: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: InkWell(
              onTap: () {
                print('123');
              },
              child: Badge(
                showBadge: true,
                ignorePointer: false,
                badgeContent: const Text('1'),
                badgeAnimation: const BadgeAnimation.rotation(
                  loopAnimation: true,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,
                ),
                badgeStyle: BadgeStyle(
                  shape: BadgeShape.circle,
                  badgeColor: ColorManager.orange,
                  padding: const EdgeInsets.all(AppPadding.p5),
                  borderRadius: BorderRadius.circular(AppSize.s5),
                  borderSide:
                      BorderSide(color: ColorManager.white, width: AppSize.s2),
                  elevation: AppSize.s0,
                ),
                child: const Icon(IconManager.notification),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImgManager.logo),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            for (int i = 0; i < _pages.length; i++)
              ListTile(
                title: Text(
                  _pages[i]['title'],
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeightManager.semiBold,
                      ),
                ),
                leading: Icon(
                  _pages[i]['icon'],
                  color: i == _selectedDrawerIndex
                      ? ColorManager.deepOrange
                      : ColorManager.grey,
                ),
                selected: i == _selectedDrawerIndex,
                onTap: () => _onSelectItem(i),
              ),
            ListTile(
              leading: const Icon(IconManager.logout),
              title: Text(
                AppString.logout,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeightManager.semiBold,
                    ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: _pages[_selectedDrawerIndex]['body'],
    );
  }
}
