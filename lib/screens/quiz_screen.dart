import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_app_tutorial/models/questionmodel.dart';

import '/models/questions.dart';
import '/screens/result_screen.dart';
import '/widgets/answer_card.dart';
import '/widgets/next_button.dart';
import 'package:http/http.dart' as http;

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key, required this.id});
  final String? id;

  @override
  State<QuizScreen> createState() => _QuizScreenState(id: id);
}

class _QuizScreenState extends State<QuizScreen> {
  _QuizScreenState({required this.id});
  final String? id;
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  List<Questionmodel> questionss = [];
  List<dynamic> showdata = [];
  List<Alluser> alluser = [];

  List<String> options = [];
  bool loading = false;

  fetchUsersFromGitHub() async {
    final response = await http.get(
        Uri.parse('http://192.168.1.113:8080/api/v1/user/allquestion/$id'));
    var responseJson = json.decode(response.body.toString());

    Questionmodel homeRepoModel = Questionmodel.fromJson(responseJson);

    alluser.addAll(homeRepoModel.alluser);
    // options.addAll(homeRepoModel.alluser[1].options);
    for (int i = 0; i < alluser.length; i++) {
      options.addAll(homeRepoModel.alluser[0].options);
    }
    // debugger();
    // print(homeRepoModel);

    setState(() {
      loading = true;
    });
  }

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = alluser[questionIndex];
    if (selectedAnswerIndex == question.answerindex) {
      score++;

      print(question);
    }

    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  void initState() {
    fetchUsersFromGitHub();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var question;
    loading == true && alluser.length > 0
        ? question = alluser[questionIndex]
        : "";
    bool isLastQuestion = questionIndex == alluser.length - 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: loading == false
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(24.0),
              child: alluser.length > 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Text(alluser[0].question.toString()),

                        //Text(questionss[0].alluser[0].options[0].a.toString()),

                        // for (int i = 0; i < alluser.length; i++)
                        Text(
                          question.question.toString(),
                          style: const TextStyle(
                              fontSize: 21, color: Colors.amber),
                          textAlign: TextAlign.center,
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: question.options.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: selectedAnswerIndex == null
                                    ? () => pickAnswer(index)
                                    : null,
                                child: AnswerCard(
                                    currentIndex: index,
                                    question: question.options[index],
                                    isSelected: selectedAnswerIndex == index,
                                    selectedAnswerIndex: selectedAnswerIndex,
                                    correctAnswerIndex: question.answerindex
                                    // correctAnswerIndex: alluser[index].answerindex,
                                    ),
                              );
                            },
                          ),
                        ),
                        // Next Button
                        isLastQuestion
                            ? RectangularButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (_) => ResultScreen(
                                        score: score,
                                        lengthq: alluser.length,
                                      ),
                                    ),
                                  );
                                },
                                label: 'Finish',
                              )
                            : RectangularButton(
                                onPressed: selectedAnswerIndex != null
                                    ? goToNextQuestion
                                    : null,
                                label: 'Next',
                              ),
                      ],
                    )
                  : Center(child: Text("NO Item")),
            ),
    );
  }
}
