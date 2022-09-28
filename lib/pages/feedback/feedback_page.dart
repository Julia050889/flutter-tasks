import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/feedback/feedback_model.dart';
import 'package:quiz_app/pages/auth/login/login_styles.dart';
import 'package:quiz_app/pages/feedback/feedback_provider.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => FeedBackProvider()),
      child: Scaffold(
        backgroundColor: Colors.indigo.shade100,
        appBar: AppBar(
          title: const Text('QUESTIONS'),
        ),
        body: Consumer<FeedBackProvider>(
          builder: ((context, value, child) {
            if (value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return value.showResult ? _resultView() : _buildContent(value);
            }
          }),
        ),
      ),
    );
  }

  Widget _buildContent(provider) {
    return Column(
      children: [
        // ignore: prefer_const_constructors
        LinearProgressIndicator(
          color: LoginStyles.mainColor,
          value: (provider.currentQuestionIndex + 1) /
              (provider.questionsData.length),
        ),
        Expanded(
          child: PageView.builder(
            onPageChanged: ((value) => provider.onChangeIndex(value)),
            itemBuilder: (context, index) {
              return _buildQuestion(context, provider.questionsData[index]);
            },
            itemCount: provider.questionsData.length,
            scrollDirection: Axis.horizontal,
            controller: provider.pageController,
          ),
        ),
      ],
    );
  }

  Widget _buildQuestion(BuildContext context, Question questionData) {
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
                  (a) => _answerOption(a),
                )
                .toList(),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _answerOption(
    Answer answerData,
  ) {
    return Consumer<FeedBackProvider>(
        builder: ((context, provider, child) => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  provider.onChangePage(answerData.answerId);
                },
                child: Text(answerData.answerText),
              ),
            )));
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
              child: const Text('Send'),
            )
          ],
        ),
      ),
    );
  }
}
