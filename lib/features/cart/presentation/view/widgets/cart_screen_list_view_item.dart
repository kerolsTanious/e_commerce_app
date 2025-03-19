import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_route/core/utils/assets_manager.dart';
import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/core/utils/prefs.dart';
import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/update_cart/update_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreenListViewItem extends StatelessWidget {
  const CartScreenListViewItem({
    super.key,
    required this.cartResponseEntity,
    required this.cartProductIndex,
  });

  final CartResponseEntity cartResponseEntity;
  final int cartProductIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        height: 115.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: ColorManager.primaryColor.withOpacity(0.3),
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 120.w,
              height: 115.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Container(
                  padding: REdgeInsets.all(5),
                  child: CachedNetworkImage(
                    imageUrl: cartResponseEntity.data
                            ?.products?[cartProductIndex].product?.imageCover ??
                        "",
                    fadeInDuration: const Duration(milliseconds: 500),
                    errorWidget: (context, url, error) {
                      return Container(
                        width: 120.w,
                        height: 115.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported,
                            color: ColorManager.primaryColor,
                            size: 25.sp,
                          ),
                        ),
                      );
                    },
                    placeholder: (context, url) {
                      return Container(
                        height: 120.h,
                        width: 115.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    },
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: 115.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageProvider,
                          ),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            cartResponseEntity.data?.products?[cartProductIndex]
                                    .product?.title ??
                                "",
                            style: TextStylesManager.textStyle18,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          width: 20.w,
                          height: 22.h,
                          margin: REdgeInsets.all(12.5),
                          child: InkWell(
                            onTap: () {
                              UpdateCartCubit.updateCartCubit(context)
                                  .deleteCartItem(
                                token: PrefsHelper.getToken(),
                                productId: cartResponseEntity
                                        .data
                                        ?.products?[cartProductIndex]
                                        .product
                                        ?.id ??
                                    "",
                              );
                            },
                            child: SvgPicture.asset(
                              width: 20.w,
                              height: 22.h,
                              AssetsManager.deleteIcon,
                              colorFilter: ColorFilter.mode(
                                  ColorManager.primaryColor, BlendMode.srcIn),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                "EGP ",
                                style: TextStylesManager.textStyle18,
                              ),
                              Text(
                                "${(cartResponseEntity.data?.products?[cartProductIndex].count ?? 0) * (cartResponseEntity.data?.products?[cartProductIndex].price ?? 0)}",
                                style: TextStylesManager.textStyle18,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: REdgeInsets.all(5),
                          width: 125.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: ColorManager.primaryColor,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  UpdateCartCubit.updateCartCubit(context)
                                      .addItem(
                                    currentCount: cartResponseEntity
                                            .data
                                            ?.products?[cartProductIndex]
                                            .count ??
                                        1,
                                    productId: cartResponseEntity
                                            .data
                                            ?.products?[cartProductIndex]
                                            .product
                                            ?.id ??
                                        "",
                                    token: PrefsHelper.getToken(),
                                  );
                                },
                                child: const Icon(
                                  color: Colors.white,
                                  Icons.add_circle_outline,
                                ),
                              ),
                              Text(
                                "${cartResponseEntity.data?.products?[cartProductIndex].count}"
                                    .toString(),
                                style: TextStylesManager.textStyle18.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  UpdateCartCubit.updateCartCubit(context)
                                      .removeItem(
                                    currentCount: cartResponseEntity
                                            .data
                                            ?.products?[cartProductIndex]
                                            .count ??
                                        1,
                                    productId: cartResponseEntity
                                            .data
                                            ?.products?[cartProductIndex]
                                            .product
                                            ?.id ??
                                        '',
                                    token: PrefsHelper.getToken(),
                                  );
                                },
                                child: const Icon(
                                  color: Colors.white,
                                  Icons.remove_circle_outline_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
