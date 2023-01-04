import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

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
                  _discoverNewPlaces(),
                  _slideCards(),
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

Widget _discoverNewPlaces() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20.h),
    alignment: Alignment.centerLeft,
    child: Text(
      "Discover new places",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30.sp,
      ),
    ),
  );
}

Widget _slideCards() {
  return Container(
    height: 300.h,
    width: 250.w,
    child: Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (context, index) {
        return _card(index);
      },
    ),
  );
}

Widget _card(int index) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Image(
            height: 220.h,
            width: double.infinity,
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
            ),
          ),
        ),
        Spacer(flex: 2),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Restaurante numero ${index}",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
        ),
        Spacer(flex: 1),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Restaurante endereço ${index}",
            style: TextStyle(
              color: AppColors.greyColor,
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
            ),
          ),
        ),
        Spacer(flex: 1),
        Row(
          children: [
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 15.sp,
            ),
            Text(
              " ${index}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
            ),
            Text(
              " (${index} ratings)",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
