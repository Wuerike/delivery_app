import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  _topBar(context),
                  SizedBox(height: 20.sp),
                  _discoverSection(),
                  SizedBox(height: 20.sp),
                  _popularSection(context),
                  SizedBox(height: 20.sp),
                  _collectionSection(context),
                  SizedBox(height: 20.sp),
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

Widget _discoverSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      headerText("Discover new places"),
      SizedBox(height: 20.sp),
      Container(
        height: 310.h,
        child: Swiper(
          itemCount: 4,
          layout: SwiperLayout.DEFAULT,
          itemBuilder: (context, index) {
            return _sliderCard(index);
          },
        ),
      ),
    ],
  );
}

Widget _sliderCard(int index) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        _cardComponentText(
          "Restaurante numero ${index}",
          "Restaurante endereço ${index}",
          index.toString(),
          index.toString(),
        )
      ],
    ),
  );
}

Widget _sectionHeader(BuildContext context, String mainText, String actionText, Function onActionTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      titleText(mainText),
      GestureDetector(
        child: Row(
          children: [
            bodyText(actionText),
            Icon(
              Icons.play_arrow,
              size: 15.sp,
            )
          ],
        ),
        onTap: () => onActionTap,
      ),
    ],
  );
}

Widget _popularSection(BuildContext context) {
  return Column(
    children: [
      _sectionHeader(context, "Popular this week", "Show All", () {}),
      SizedBox(height: 10.sp),
      _cardComponent(
        context,
        "Restaurante numero 0",
        "Restaurante endereço 0",
        "0",
        "0",
        "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
      ),
      _cardComponent(
        context,
        "Restaurante numero 1",
        "Restaurante endereço 1",
        "1",
        "1",
        "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
      ),
      _cardComponent(
        context,
        "Restaurante numero 2",
        "Restaurante endereço 2",
        "2",
        "2",
        "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
      ),
    ],
  );
}

Widget _cardComponent(
  BuildContext context,
  String title,
  String street,
  String stars,
  String ratings,
  String imageUrl,
) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    height: 120.h,
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Image(
            width: 80.w,
            height: 100.h,
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          ),
        ),
        SizedBox(width: 10.w),
        _cardComponentText(title, street, stars, ratings)
      ],
    ),
  );
}

Widget _cardComponentText(String title, String street, String stars, String ratings) {
  return Container(
    height: 80.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText(title),
        bodyText(street, color: AppColors.greyColor),
        Row(
          children: [
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 15.sp,
            ),
            bodyText(" "),
            bodyText("${stars}"),
            bodyText(" "),
            bodyText("(${ratings} ratings)", color: AppColors.greyColor),
          ],
        ),
      ],
    ),
  );
}

Widget _collectionSection(BuildContext context) {
  return Column(
    children: [
      _sectionHeader(context, "Collections", "Show All", () {}),
      SizedBox(height: 10.sp),
      Container(
        height: 180.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return _collectionCard(index);
          },
        ),
      )
    ],
  );
}

Widget _collectionCard(int index) {
  return Container(
    margin: EdgeInsets.only(right: 10.w),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image(
        height: 180.h,
        width: 300.w,
        fit: BoxFit.cover,
        image: NetworkImage(
          "https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        ),
      ),
    ),
  );
}
