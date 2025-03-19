import 'package:e_commerce_app_route/core/utils/strings_manager.dart';
import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:flutter/material.dart';

class ListViewDescription extends StatelessWidget {
  const ListViewDescription({super.key, required this.listViewName});

  final String listViewName;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Text(
            listViewName,
            style: TextStylesManager.textStyle18,
            textAlign: TextAlign.start,
          ),
          const Expanded(child: SizedBox()),
          InkWell(
            onTap: () {},
            child: Text(
              StringManager.viewAll,
              style: TextStylesManager.textStyle14,
            ),
          ),
        ],
      ),
    );
  }
}
