import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_route/core/di.dart';
import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/BrandEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/change_home_screen_body/change_home_screen_body_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/product_by_brand_cubit/product_by_brand_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBodyListViewItem extends StatelessWidget {
  const HomeScreenBodyListViewItem({super.key, required this.brand});

  final BrandEntity brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ChangeHomeScreenBodyCubit.changeHomeScreenBodyCubit(context)
            .changeHomeScreenBody(newIndex: 2);
        getIt
            .get<ProductByBrandCubit>()
            .fetchProductsByBrand(brandId: brand.id ?? "");
      },
      splashColor: Colors.transparent,
      child: SizedBox(
        height: 144.h,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: brand.image ?? "",
              fadeInDuration: const Duration(milliseconds: 500),
              errorWidget: (context, url, error) {
                return CircleAvatar(
                  radius: 50.r,
                  backgroundColor: Colors.grey[100],
                  child: Icon(
                    Icons.image_not_supported,
                    color: ColorManager.primaryColor,
                    size: 45,
                  ),
                );
              },
              placeholder: (context, url) {
                return CircleAvatar(
                  radius: 50.r,
                  child: const CircularProgressIndicator(),
                );
              },
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: Text(
                brand.name ?? "".split(" ").join("\n"),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStylesManager.textStyle14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
