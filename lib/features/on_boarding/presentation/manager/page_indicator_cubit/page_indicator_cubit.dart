import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil/features/on_boarding/presentation/manager/page_indicator_cubit/page_indicator_states.dart';

class PageIndicatorCubit extends Cubit<PageIndicatorStates>{
  PageIndicatorCubit() : super(PageIndicatorInitialState());

  static PageIndicatorCubit get(context) => BlocProvider.of<PageIndicatorCubit>(context);
  int currentIndex = 0;
  slideToNextPage(){
    currentIndex ++;
    emit(PageIndicatorSlidingState());
  }
}