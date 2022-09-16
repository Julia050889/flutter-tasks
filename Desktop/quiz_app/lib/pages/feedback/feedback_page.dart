import 'package:flutter/material.dart';
import 'package:quiz_app/api/indigo_api.dart';
import 'package:quiz_app/models/feedback/feedback_model.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  FeedBackModel? feedbackData;
  List<Question> questionsData = [];
  int currentQuestionIndex = 0;
  bool showResult = false;
  PageController controller = PageController();

  @override
  void initState() {
    getData().then((data) {
      setState(() {
        feedbackData = data;
        questionsData = data.questions;
      });
    });

    super.initState();
  }

  Future<FeedBackModel> getData() async {
    return await IndigoAPI().feedback.getFeedbackData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        title: const Text('QUESTIONS'),
      ),
      body: feedbackData == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : showResult
              ? _resultView()
              : _buildContent(),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        LinearProgressIndicator(
            value: currentQuestionIndex + 1 / questionsData.length),
        _buildQuestion(questionsData[currentQuestionIndex]),
      ],
    );
  }

  Widget _buildQuestion(Question questionData) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: questionsData.length,
        itemBuilder: ((context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  questionData.questionText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: questionData.answers
                      .map<Widget>(
                        (a) => _answerOption(
                          a,
                          answerPressed,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 100),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _answerOption(
    Answer answerData,
    Function(int) onAnswerPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onAnswerPressed(answerData.answerId);

          controller.animateToPage(currentQuestionIndex,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeIn);
        },
        child: Text(answerData.answerText),
      ),
    );
  }

  Widget _resultView() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
            color: Colors.indigo.shade400,
            borderRadius: BorderRadius.circular(
              15,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Thank you for your feedback'),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {},
              child: Text('Send'),
            )
          ],
        ),
      ),
    );
  }

  void answerPressed(int answerId) {
    if (currentQuestionIndex == questionsData.length - 1) {
      setState(() {
        showResult = true;
      });
    } else {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }
}
