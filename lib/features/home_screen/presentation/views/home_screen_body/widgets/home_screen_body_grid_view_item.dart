import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_route/core/di.dart';
import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/change_home_screen_body/change_home_screen_body_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/products_category/products_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBodyGridViewItem extends StatelessWidget {
  const HomeScreenBodyGridViewItem({
    super.key,
    required this.categories,
  });

  final CategoryEntity categories;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ChangeHomeScreenBodyCubit.changeHomeScreenBodyCubit(context)
            .changeHomeScreenBody(newIndex: 1);
        getIt
            .get<ProductsCategoryCubit>()
            .fetchProductByCategory(categoryId: categories.id ?? "");
      },
      splashColor: Colors.transparent,
      child: SizedBox(
        height: 145.h,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: categories.image ?? "",
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
                return CircleAvatar(
                  radius: 50.r,
                  backgroundImage: imageProvider,
                );
              },
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: Text(
                categories.name ?? "".split(' ').join('\n'),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStylesManager.textStyle14,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
