import 'package:delivery_app/src/features/presentation/shared/components/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header1_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header2_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> list = [
      {"category": "Vegan", "quantity": 12},
      {"category": "Italian", "quantity": 23},
      {"category": "Brazilian", "quantity": 34},
      {"category": "Asia", "quantity": 45},
      {"category": "Fast Food", "quantity": 56},
      {"category": "Natural", "quantity": 67},
      {"category": "Sushi", "quantity": 78},
      {"category": "Desserts", "quantity": 89},
      {"category": "Hamburguers", "quantity": 90},
      {"category": "Hamburguers", "quantity": 90},
      {"category": "Hamburguers", "quantity": 90},
      {"category": "Hamburguers", "quantity": 90},
      {"category": "Hamburguers", "quantity": 90},
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                centerTitle: true,
                backgroundColor: Colors.white,
                title: header1Text("Collections"),
                leading: Builder(
                  builder: (context) => backButton(context, Colors.black),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 20.w, left: 20.w, right: 20.w),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 20.h,
                  childAspectRatio: 1.5,
                  children: List.generate(
                    list.length,
                    (index) {
                      return _collectionItem(
                        context: context,
                        category: list[index]["category"],
                        quantity: list[index]["quantity"],
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1561043433-aaf687c4cf04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _collectionItem({BuildContext? context, String category = "", int quantity = 0, ImageProvider<Object>? image}) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context!, "collection-detail"),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Image(
            fit: BoxFit.cover,
            image: image!,
            width: double.maxFinite,
            height: double.maxFinite,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 1.5),
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(flex: 3),
              header2Text(category, color: Colors.white),
              bodyText("$quantity Places", color: Colors.white),
              const Spacer(flex: 1)
            ],
          ),
        )
      ],
    ),
  );
}
