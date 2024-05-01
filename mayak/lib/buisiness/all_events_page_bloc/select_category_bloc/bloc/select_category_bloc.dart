import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_category_event.dart';
part 'select_category_state.dart';

class SelectCategoryBloc
    extends Bloc<SelectCategoryEvent, SelectCategoryState> {
  SelectCategoryBloc() : super(SelectCategoryState(selectedIndex: 0)) {
    on<SelectCategoryIndexEvent>((event, emit) {
      emit(SelectCategoryState(selectedIndex: event.selectedIndex));
    });
  }
}
