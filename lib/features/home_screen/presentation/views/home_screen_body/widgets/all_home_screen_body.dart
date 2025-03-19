import 'package:e_commerce_app_route/core/resuable_components/list_view_description.dart';
import 'package:e_commerce_app_route/core/utils/strings_manager.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen_body/widgets/custom_home_screen_app_bar.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen_body/widgets/home_screen_body_ads_list.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen_body/widgets/home_screen_body_grid_view_list.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen_body/widgets/home_screen_body_list_view.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen_body/widgets/home_screen_body_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllHomeScreenBody extends StatelessWidget {
  const AllHomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: CustomHomeScreenAppBar()),
        SliverToBoxAdapter(child: HomeScreenBodyAdsList()),
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        const ListViewDescription(listViewName: StringManager.categories),
        SliverToBoxAdapter(child: SizedBox(height: 16.h)),
        const SliverToBoxAdapter(child: HomeScreenBodyGridViewList()),
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        const ListViewDescription(listViewName: StringManager.brands),
        SliverToBoxAdapter(child: SizedBox(height: 16.h)),
        const SliverToBoxAdapter(child: HomeScreenBodyListView()),
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        const ListViewDescription(listViewName: StringManager.bestSeller),
        SliverToBoxAdapter(child: SizedBox(height: 16.h)),
        const SliverToBoxAdapter(child: HomeScreenBodyProductList()),
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
      ],
    );
  }
}
