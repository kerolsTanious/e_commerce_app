import 'package:e_commerce_app_route/core/resuable_components/failure_state_widget.dart';
import 'package:e_commerce_app_route/core/resuable_components/loading_state_widget.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/brands_cubit/brands_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/brands_cubit/brands_state.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen_body/widgets/home_screen_body_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBodyListView extends StatelessWidget {
  const HomeScreenBodyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 144.h,
      child: BlocBuilder<BrandsCubit, BrandsState>(
        builder: (context, state) {
          if(state is BrandsSuccess){
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics:  const BouncingScrollPhysics(),
              itemCount: state.brands.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: HomeScreenBodyListViewItem(brand: state.brands[index],),
                );
              },
            );
          }else if(state is BrandsFailure){
            return FailureStateWidget(errorMessage: state.errorMessage);
          }else{
            return const LoadingStateWidget();
          }
        },
      ),
    );
  }
}
