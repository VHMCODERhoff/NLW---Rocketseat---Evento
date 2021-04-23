import 'package:dev_quiz/home/home_repository.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  //HomeState state = HomeState.empty;
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? userModel;
  List<QuizModel>? quizzes;
  final repository = HomeRepository();

  void getUser() async {
    this.state = HomeState.loading;
    //await Future.delayed(Duration(seconds: 2));
    userModel = await (repository.getUser());
    this.state = HomeState.success;
  }

  void getQuizzes() async {
    this.state = HomeState.loading;
    //await Future.delayed(Duration(seconds: 2));
    quizzes = await repository.getQuizzes();
    this.state = HomeState.success;
  }
}
