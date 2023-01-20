import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/filter_page/view/custom_widgets/cuisine_filter.dart';
import 'package:delivery_app/src/features/presentation/filter_page/view/custom_widgets/multi_selectable_list_tile.dart';
import 'package:delivery_app/src/features/presentation/filter_page/view/custom_widgets/price_filter.dart';
import 'package:delivery_app/src/features/presentation/filter_page/view/custom_widgets/single_selectable_list_tile.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header1_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header2_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header3_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
      child: SafeArea(
        child: Scaffold(
          appBar: _appBar(context),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: 20.h),
                      _cuisinesSection(context),
                      SizedBox(height: 20.h),
                      _sortBySection(context),
                      SizedBox(height: 20.h),
                      _filterSection(context),
                      SizedBox(height: 20.h),
                      _priceSection(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

PreferredSize _appBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.h),
    child: Material(
      elevation: 0.5,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            header3Text("Reset"),
            Center(
              child: header1Text("Filters"),
            ),
            GestureDetector(
              onTap: (() => Navigator.pop(context)),
              child: header3Text("Done", color: AppColors.orange),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _cuisinesSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      header2Text("CUISINES", color: AppColors.greyColor),
      SizedBox(height: 10.h),
      CuisineFilter(),
    ],
  );
}

Widget _sortBySection(BuildContext context) {
  List<String> items = [
    "Top Rated",
    "Nearest Me",
    "Cost High to Low",
    "Cost Low to High",
    "Most Popular",
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      header2Text("SORT BY", color: AppColors.greyColor),
      SingleSelectableListTile(items: items),
    ],
  );
}

Widget _filterSection(BuildContext context) {
  List<String> items = [
    "Open Now",
    "Creadit Cards",
    "Wi-Fi",
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      header2Text("SORT BY", color: AppColors.greyColor),
      MultiSelectableListTile(items: items),
    ],
  );
}

Widget _priceSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      header2Text("PRICE", color: AppColors.greyColor),
      SizedBox(height: 10.h),
      PriceFilter(),
    ],
  );
}
