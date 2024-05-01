part of 'all_events_bloc.dart';

enum AllEventsStatus { initial, done, error }

class AllEventsState {
  AllEventsStatus allEventsStatus;
  AllEventsHttpModel? allEventsHttpModel;
  AllEventsState({required this.allEventsStatus, this.allEventsHttpModel});
}
