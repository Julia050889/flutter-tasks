import 'package:dio/dio.dart';

import '../../models/feedback/feedback_model.dart';

class FeedbackApi {
  final Dio appDioClient;

  FeedbackApi(
    this.appDioClient,
  );

  Future<FeedBackModel> getFeedbackData() async {
    FeedBackModel feedbackData;

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/feedback',
    );

    var res = result.data as Map<String, dynamic>;
    feedbackData = FeedBackModel.fromJson(res);

    return feedbackData;
  }

  Future<List<Question>> getQuestionsData() async {
    List<Question> questions = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/feedback',
    );

    var res = result.data as Map<String, dynamic>;

    questions = res['questions']
        .map<Question>(
          (e) => Question.fromJson(e),
        )
        .toList();
    return questions;
  }
}
