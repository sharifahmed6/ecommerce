import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/core/extensions/extension_localization.dart';
import 'package:ecommerce/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widget/app_bar_action_button.dart';
import '../../../common/ui/widget/categories_item.dart';
import '../widget/home_carousel_slider.dart';
import '../../../common/ui/widget/product_card.dart';
import '../widget/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildTextField(),
              const SizedBox(height: 16),
              HomeCarouselSlider(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localization.categories,
                onTapSeeAll: () {
                  Get.find<MainBottomNavBarController>().moveToCategory();
                },
              ),
              const SizedBox(height: 16),
              _buildCategoriesSection(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localization.popular,
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 16),
              _buildPopularProductSection(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localization.special,
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 16),
              _buildPopularProductSection(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localization.sNew,
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 16),
              _buildPopularProductSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoriesItem(),
          CategoriesItem(),
          CategoriesItem(),
          CategoriesItem(),
          CategoriesItem(),
          CategoriesItem(),
          CategoriesItem(),
          CategoriesItem(),
          CategoriesItem(),
        ],
      ),
    );
  }
  Widget _buildPopularProductSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),

        ],
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.logoNavSvg),
      actions: [
        AppBarActionButton(
          icon: Icons.person,
          onTap: () {
            print('Home');
          },
        ),
        SizedBox(width: 8),
        AppBarActionButton(icon: Icons.call, onTap: () {}),
        SizedBox(width: 8),
        AppBarActionButton(icon: Icons.notification_add_outlined, onTap: () {}),
      ],
    );
  }
}


