import '../../../core/app_assets/app_assets.dart';
import 'models/on_boarding_item_model.dart';

List<OnBoardingItemModel> onBoardingItemsData = [
  OnBoardingItemModel(
    title: 'Water Services',
    image: AppAssets.water,
    buttonTitle: 'Next',
    subTitle: 'Easy Ordering',
  ),
  OnBoardingItemModel(
    title: 'Gas Services',
    image: AppAssets.gas,
    buttonTitle: 'Next',
    subTitle: 'Unlimited Drivers',
  ),
  OnBoardingItemModel(
    title: 'Track Your Order',
    image: AppAssets.map,
    buttonTitle: 'Get Started',
    subTitle: 'Tracking Order',
  ),
];
