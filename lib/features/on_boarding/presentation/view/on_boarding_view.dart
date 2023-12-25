import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil/features/on_boarding/data/on_boarding_items_data.dart';
import 'package:wasil/features/on_boarding/presentation/manager/page_indicator_cubit/page_indicator_cubit.dart';
import 'package:wasil/features/on_boarding/presentation/view/widgets/on_boarding_item.dart';

class OnBoardingView extends StatelessWidget {
  static PageController pageController = PageController();

  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageIndicatorCubit(),
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: onBoardingItemsData.map((onBoardingItem) {
            return OnBoardingItem(
              onBoardingItem: onBoardingItem,
              pageController: pageController,
            );
          }).toList(),
        ),
      ),
    );
  }
}
