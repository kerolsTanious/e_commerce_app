import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_route/core/utils/assets_manager.dart';
import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/core/utils/strings_manager.dart';
import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/update_cart/update_cart_cubit.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/update_cart/update_cart_state.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductListViewItem extends StatelessWidget {
  const ProductListViewItem({
    super.key,
    required this.productData,
    required this.addToCart,
  });

  final ProductEntity productData;
  final Function addToCart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.transparent,
      child: Container(
        width: 190.w,
        height: 260.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.primaryColor.withOpacity(0.3),
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: productData.imageCover ?? "",
                    height: 128.h,
                    width: 190.w,
                    errorWidget: (context, url, error) {
                      return Container(
                        height: 128.h,
                        width: 190.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported,
                            color: ColorManager.primaryColor,
                            size: 35,
                          ),
                        ),
                      );
                    },
                    placeholder: (context, url) {
                      return Container(
                        height: 128.h,
                        width: 190.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    },
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: 128.h,
                        width: 190.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 5,
                    top: 5,
                  ),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    child: SvgPicture.asset(
                      width: 50.w,
                      height: 50.h,
                      AssetsManager.favIcon,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 8,
              ),
              child: Text(
                productData.title ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStylesManager.textStyle14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 8,
              ),
              child: Text(
                productData.description ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStylesManager.textStyle14,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 8.h,
                right: 8.w,
                left: 8.w,
              ),
              child: Row(
                children: [
                  Text(
                    productData.priceAfterDiscount == 0
                        ? "EGP ${productData.price}"
                        : "${productData.priceAfterDiscount} EGP",
                    style: TextStylesManager.textStyle14,
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    productData.priceAfterDiscount == 0
                        ? ""
                        : "${productData.price} EGP",
                    style: TextStylesManager.textStyle11.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 8.h,
                  left: 8.h,
                  right: 8.h,
                ),
                child: Row(
                  children: [
                    Text(
                      StringManager.review,
                      style: TextStylesManager.textStyle12,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "(${productData.ratingsAverage})",
                      style: TextStylesManager.textStyle12,
                    ),
                    SizedBox(width: 4.w),
                    SvgPicture.asset(
                      width: 15.w,
                      height: 15.h,
                      AssetsManager.starIcon,
                    ),
                    SizedBox(width: 50.w),
                    BlocConsumer<UpdateCartCubit, UpdateCartState>(
                      listener: (context, state) {
                        if (state is AddCartItemSuccess &&
                            state.productId == productData.id) {
                          Fluttertoast.showToast(
                            msg: "Added Successfully To Cart",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                        if (state is AddCartItemFailure &&
                            state.productId == productData.id) {
                          Fluttertoast.showToast(
                            msg: "${state.errorMessage}",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      builder: (BuildContext context, UpdateCartState state) {
                        if (state is AddCartItemLoading &&
                            state.productId == productData.id) {
                          return SizedBox(
                            width: 30.w,
                            height: 30.h,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        return InkWell(
                          onTap: () {
                            addToCart();
                          },
                          child: SvgPicture.asset(
                            height: 30.h,
                            width: 30.w,
                            AssetsManager.plusIcon,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
