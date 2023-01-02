import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/tabs/explore_tab.dart';
import 'package:delivery_app/src/features/presentation/tabs/favourite_tab.dart';
import 'package:delivery_app/src/features/presentation/tabs/my_order_tab.dart';
import 'package:delivery_app/src/features/presentation/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<Widget> _tabs = [ExploreTab(), MyOrderTab(), FavouriteTab(), ProfileTab()];
  int _tabIndex = 0;

  void _setTab(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs.elementAt(_tabIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.sp,
        selectedItemColor: AppColors.accentColor,
        unselectedItemColor: AppColors.greyColor,
        currentIndex: _tabIndex,
        onTap: _setTab,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "My Order"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: "Profile")
        ],
      ),
    );
  }
}
