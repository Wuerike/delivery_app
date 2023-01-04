import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  _topBar(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _topBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.all(10.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Icon(Icons.search, size: 20.sp, color: AppColors.greyColor2),
              Text("Search", style: TextStyle(color: AppColors.greyColor2, fontSize: 15.sp)),
            ],
          ),
        ),
      ),
      SizedBox(width: 10.w),
      Container(
        height: 45.r,
        width: 45.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45.r),
          color: AppColors.greyColor2,
        ),
        child: IconButton(
          icon: Icon(
            Icons.filter_list,
            size: 25.sp,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    ],
  );
}
