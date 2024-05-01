part of 'all_events_bloc.dart';

@immutable
sealed class AllEventsEvent {}

class GetAllEventsEvent extends AllEventsEvent {}
