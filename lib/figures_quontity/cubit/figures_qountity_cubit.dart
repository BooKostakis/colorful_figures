import 'package:bloc/bloc.dart';
part 'figures_quontity_state.dart';

class FiguresQuantityCubit extends Cubit<FiguresQuantityState> {
  FiguresQuantityCubit() : super(FiguresQuantityState(figuresQuantity: 1));

  void setFiguresQuantity(int quantity) {
    emit(FiguresQuantityState(figuresQuantity: quantity));
  }
}
