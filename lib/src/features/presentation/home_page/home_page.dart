// ignore_for_file: library_private_types_in_public_api, invalid_use_of_protected_member
import 'package:delivery_app/src/base/views/base_view.dart';
import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/domain/entities/geolocation/position_entity.dart';
import 'package:delivery_app/src/features/presentation/home_page/view_model/home_view_model.dart';
import 'package:delivery_app/src/features/presentation/shared/components/alerts/alert_widget.dart';
import 'package:delivery_app/src/features/presentation/home_page/tabs/explore_tab/view/explore_tab.dart';
import 'package:delivery_app/src/features/presentation/home_page/tabs/favourive_tab/view/favourite_tab.dart';
import 'package:delivery_app/src/features/presentation/home_page/tabs/my_order_tab/view/my_order_tab.dart';
import 'package:delivery_app/src/features/presentation/home_page/tabs/profile_tab/view/profile_tab.dart';
import 'package:delivery_app/src/features/presentation/shared/state_providers/loading_state_provider.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final HomeViewModelAbstraction viewModel;

  HomePage({
    super.key,
    HomeViewModelAbstraction? viewModel,
  }) : viewModel = viewModel ?? HomeViewModel();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BaseView {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      widget.viewModel.loadingStatusState.setLoadingState(isLoading: true);
      final LocationPermissionStatus currentStatus = await widget.viewModel.getPermissionStatus();
      switch (currentStatus) {
        case LocationPermissionStatus.denied:
          // TODO: Fix Do not use BuildContexts across async gaps.
          _getCurrentPosition(context);
          break;
        // TODO: Denied forever isnot being checked, it should tell the user and then close the app
        default:
          widget.viewModel.loadingStatusState.setLoadingState(isLoading: false);
          break;
      }
    });
  }

  final List<Widget> _tabs = [
    const ExploreTab(),
    const MyOrderTab(),
    FavouriteTab(),
    ProfileTab(),
  ];

  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    widget.viewModel.initState(loadingState: Provider.of<LoadingStateProvider>(context));

    return widget.viewModel.loadingStatusState.isLoading
        ? loadingView
        : Scaffold(
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
                BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "Orders"),
                BottomNavigationBarItem(icon: Icon(Icons.book), label: "Favourites"),
                BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: "Profile")
              ],
            ),
          );
  }
}

extension UserActions on _HomePageState {
  void _setTab(int index) {
    setState(() {
      _tabIndex = index;
    });
  }
}

extension PrivateMethods on _HomePageState {
  Future _getCurrentPosition(BuildContext context) async {
    await alertWidget(
      context: context,
      image: const AssetImage("assets/location.png"),
      title: "Enable your location",
      body: "Please allow the use of your location",
      buttonLabel: "Enable Location",
      onButtonPressed: () {
        Navigator.pop(context);
        widget.viewModel.getCurrentPosition().then((result) {
          switch (result.status) {
            case ResultStatus.success:
              widget.viewModel.loadingStatusState.setLoadingState(isLoading: false);
              break;
            case ResultStatus.error:
              errorStateProvider.setFailure(context: context, value: result.error!);
              break;
          }
        });
      },
    );
  }
}
