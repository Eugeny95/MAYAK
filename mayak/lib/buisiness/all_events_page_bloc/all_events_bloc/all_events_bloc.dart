import 'package:bloc/bloc.dart';
import 'package:data_layer/models/http_models/all_events_http_model.dart';
import 'package:data_layer/network/all_events_repository.dart';

import 'package:meta/meta.dart';

part 'all_events_event.dart';
part 'all_events_state.dart';

class AllEventsBloc extends Bloc<AllEventsEvent, AllEventsState> {
  AllEventsBloc()
      : super(AllEventsState(allEventsStatus: AllEventsStatus.initial)) {
    on<AllEventsEvent>((event, emit) async {
      AllEventsHttpModel allEventsHttpModel;
      AllEventsState allEventsState;
      try {
        allEventsHttpModel = await AllEventsRepository().getCachedAllEvents();
        allEventsState = AllEventsState(allEventsStatus: AllEventsStatus.done);
        allEventsState.allEventsHttpModel = allEventsHttpModel;

        //  print (allEventsHttpModel);
        emit(allEventsState);
      } catch (_) {}
      allEventsHttpModel = await AllEventsRepository().syncAllEvents();
      allEventsState = AllEventsState(allEventsStatus: AllEventsStatus.done);
      allEventsState.allEventsHttpModel = allEventsHttpModel;
      //  print (allEventsHttpModel);
      emit(allEventsState);
      // emit();
      // TODO: implement event handler
    });
  }
}
