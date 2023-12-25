import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil/core/functions/navigate.dart';
import 'package:wasil/features/auth/presentation/view/choose_to_log_in_or_register_view.dart';
import 'package:wasil/features/on_boarding/data/on_boarding_items_data.dart';
import 'package:wasil/features/on_boarding/presentation/view/widgets/page_indicator.dart';
import 'package:wasil/features/on_boarding/presentation/view/widgets/skip_button.dart';
import '../../../../../core/app_styles/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/on_boarding_item_model.dart';
import '../../manager/page_indicator_cubit/page_indicator_cubit.dart';
import '../../manager/page_indicator_cubit/page_indicator_states.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingItemModel onBoardingItem;
  final PageController pageController;

  const OnBoardingItem({
    super.key,
    required this.onBoardingItem,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          bottom: screenSize.height * .35,
          left: 0,
          right: 0,
          top: 0,
          child: Image.asset(
            onBoardingItem.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: screenSize.height * .6,
          child: Container(
            width: screenSize.width,
            height: screenSize.height * .4,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * .04,
                  ),
                  Text(
                    onBoardingItem.title,
                    style: AppStyles.style24,
                  ),
                  SizedBox(
                    height: screenSize.height * .03,
                  ),
                  Text(
                    onBoardingItem.subTitle,
                    style: AppStyles.style18,
                  ),
                  SizedBox(
                    height: screenSize.height * .13,
                  ),
                  BlocBuilder<PageIndicatorCubit, PageIndicatorStates>(
                    builder: (context, state) {
                      return CustomButton(
                        width: screenSize.width * .6,
                        title: onBoardingItem.buttonTitle,
                        onPressed: () {
                          if (pageController.page! <=
                              onBoardingItemsData.length - 2) {
                            Future.delayed(
                              const Duration(
                                milliseconds: 200,
                              ),
                              () {
                                PageIndicatorCubit.get(context)
                                    .slideToNextPage();
                              },
                            );
                            pageController.nextPage(
                              duration: const Duration(
                                milliseconds: 600,
                              ),
                              curve: Curves.linear,
                            );
                          } else {
                            navigateAndRemoveUntil(
                              context: context,
                              screen: const ChooseToLogInOrRegisterView(),
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: screenSize.height * .57,
          left: screenSize.width / 2 - 15,
          child: BlocBuilder<PageIndicatorCubit, PageIndicatorStates>(
            builder: (context, state) {
              return PageIndicator(
                currentIndex: PageIndicatorCubit.get(context).currentIndex,
              );
            },
          ),
        ),
        Positioned(
          top: screenSize.height * .08,
          right: screenSize.width * .05,
          child: const SkipButton(),
        ),
      ],
    );
  }
}
