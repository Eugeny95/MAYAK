part of 'select_category_bloc.dart';

@immutable
sealed class SelectCategoryEvent {}

// ignore: must_be_immutable
class SelectCategoryIndexEvent extends SelectCategoryEvent {
  int selectedIndex;
  SelectCategoryIndexEvent({required this.selectedIndex});
}
