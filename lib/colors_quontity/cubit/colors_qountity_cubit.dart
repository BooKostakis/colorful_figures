import 'package:bloc/bloc.dart';
part 'colors_quontity_state.dart';

class ColorsQuantityCubit extends Cubit<ColorsQuantityState> {
  ColorsQuantityCubit() : super(ColorsQuantityState(colorsQuantity: 1));

  void setColorsQuantity(int quantity) {
    emit(ColorsQuantityState(colorsQuantity: quantity));
  }
}
