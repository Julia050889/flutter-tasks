import 'package:flutter/material.dart';
import 'package:quiz_app/api/indigo_api.dart';
import 'package:quiz_app/models/feedback/feedback_model.dart';

class FeedBackProvider extends ChangeNotifier {
  FeedBackProvider() {
    getData();
  }

  FeedBackModel? feedbackData;
  List<Question> questionsData = [];
  bool isLoading = true;

  int currentQuestionIndex = 0;
  bool showResult = false;
  PageController pageController = PageController();

  getData() async {
    isLoading = true;
    final result = await IndigoAPI().feedback.getFeedbackData();

    isLoading = false;
    feedbackData = result;
    questionsData = result.questions;
    notifyListeners();
  }

  onChangeIndex(val) {
    currentQuestionIndex = val;
    notifyListeners();
  }

  onAnswerPressed() {
    showResult = true;
    notifyListeners();
  }

  onChangePage(id) {
    if (currentQuestionIndex == questionsData.length - 1) {
      return onAnswerPressed();
    } else {
      pageController.animateToPage(currentQuestionIndex + 1,
          curve: Curves.easeInOut, duration: const Duration(milliseconds: 700));
      notifyListeners();
    }
  }
}
