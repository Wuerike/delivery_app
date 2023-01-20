import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/alerts/alert_widget.dart';
import 'package:delivery_app/src/features/presentation/home_page/explore_tab/view/explore_tab.dart';
import 'package:delivery_app/src/features/presentation/home_page/favourive_tab/view/favourite_tab.dart';
import 'package:delivery_app/src/features/presentation/home_page/my_order_tab/view/my_order_tab.dart';
import 'package:delivery_app/src/features/presentation/home_page/profile_tab/view/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _tabs = [const ExploreTab(), MyOrderTab(), FavouriteTab(), ProfileTab()];
  int _tabIndex = 0;

  void _setTab(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      await alertWidget(
        context,
        const AssetImage("assets/location.png"),
        "Enable your location",
        "Please allow the use of your location",
        "Enable Location",
        () {
          Navigator.pop(context);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
        child: _tabs.elementAt(_tabIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.sp,
        selectedItemColor: AppColors.orange,
        unselectedItemColor: AppColors.greyColor,
        currentIndex: _tabIndex,
        onTap: _setTab,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "My Order"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: "Profile")
        ],
      ),
    );
  }
}