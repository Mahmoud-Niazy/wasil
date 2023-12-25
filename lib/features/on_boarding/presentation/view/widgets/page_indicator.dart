import 'package:flutter/material.dart';
import 'package:wasil/features/on_boarding/data/on_boarding_items_data.dart';
import 'package:wasil/features/on_boarding/presentation/view/widgets/page_indicator_item.dart';

class PageIndicator extends StatefulWidget {
  final int currentIndex;

  const PageIndicator({
    super.key,
    required this.currentIndex,
  });

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return PageIndicatorItem(
            isSelected: index == widget.currentIndex ? true : false,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 5,
        ),
        itemCount: onBoardingItemsData.length,
      ),
    );
  }
}
