import 'package:camera/camera.dart';
import 'package:ecogram/bloc/base/simple_get.dart';
import 'package:ecogram/model/performed_task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PerformedTaskState extends SimpleGetState<List<PerformedTask>> {
  PerformedTaskState(
      {bool fetching = false,
      List<PerformedTask> performedTask,
      Exception exception})
      : super(fetching: fetching, data: performedTask, exception: exception);
}

class PerformedTaskCubit extends Cubit<PerformedTaskState> {
  final client = http.Client();

  PerformedTaskCubit() : super(PerformedTaskState());

  Future<void> addPerformedTask(PerformedTask performedTask) async {
    emit(PerformedTaskState(fetching: true, performedTask: state.data));

    try {
      List<PerformedTask> performedTaskList;

      if (state.data == null) {
        performedTaskList = [];
      } else {
        performedTaskList = state.data;
      }
      performedTaskList.add(performedTask);
      emit(PerformedTaskState(performedTask: performedTaskList));
      print("first list is ${performedTaskList.length}");
    } catch (exp) {
      emit(PerformedTaskState(exception: exp));
    }
  }

  @override
  Future<void> close() {
    client.close();
    return super.close();
  }
}
