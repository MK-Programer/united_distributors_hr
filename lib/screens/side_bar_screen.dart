import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../screens/home/home_screen.dart';
import '../resources/icon_manager.dart';

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
      'body': const HomeScreen(),
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
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                child: null,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  for (int i = 0; i < _pages.length; i++)
                    ListTile(
                      title: Text(
                        _pages[i]['title'],
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
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
                ],
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedDrawerIndex]['body'],
    );
  }
}
