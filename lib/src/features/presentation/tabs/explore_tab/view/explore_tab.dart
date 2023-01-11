import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/cards/horizontal_card.dart';
import 'package:delivery_app/src/features/presentation/shared/components/cards/restaurant_rating_text_card.dart';
import 'package:delivery_app/src/features/presentation/shared/components/cards/vertical_card.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header_text.dart';
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
            return verticalCard(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
              ),
              child: restaurantRatingTextCard(
                title: "Restaurante numero ${index}",
                body: "Restaurante endereço ${index}",
                ratings: index.toString(),
                stars: index.toString(),
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget _popularSection(BuildContext context) {
  return Column(
    children: [
      sectionHeader("Popular this week", "Show All", icon: Icons.play_arrow, onActionTap: () {}),
      SizedBox(height: 10.sp),
      horizontalCard(
        image: NetworkImage(
          "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
        ),
        child: restaurantRatingTextCard(
          title: "Restaurante numero 0",
          body: "Restaurante endereço 0",
          ratings: "0",
          stars: "0",
        ),
      ),
      horizontalCard(
        image: NetworkImage(
          "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
        ),
        child: restaurantRatingTextCard(
          title: "Restaurante numero 1",
          body: "Restaurante endereço 1",
          ratings: "1",
          stars: "1",
        ),
      ),
      horizontalCard(
        image: NetworkImage(
          "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
        ),
        child: restaurantRatingTextCard(
          title: "Restaurante numero 2",
          body: "Restaurante endereço 2",
          ratings: "2",
          stars: "2",
        ),
      ),
    ],
  );
}

Widget _collectionSection(BuildContext context) {
  return Column(
    children: [
      sectionHeader("Collections", "Show All", icon: Icons.play_arrow, onActionTap: () {}),
      SizedBox(height: 10.sp),
      SizedBox(
        height: 180.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return verticalCard(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
              ),
              imageHeight: 180.h,
              imageWidth: 300.w,
            );
          },
        ),
      )
    ],
  );
}
