
import 'package:equatable/equatable.dart';
import '../../data/models/task_model.dart';
import 'package:bloc/bloc.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState>{
  TaskBloc() : super(const TaskState()){
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit){
    final state = this.state;
    emit(TaskState(
      allTasks: List.from(state.allTasks)..add(event.task),
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit){
  }
}