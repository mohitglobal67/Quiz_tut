import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_app_tutorial/models/questionmodel.dart';
import 'package:quiz_app_tutorial/models/unitmodel.dart';
import 'package:quiz_app_tutorial/screens/homepage.dart';
import 'package:quiz_app_tutorial/screens/subcat.dart';

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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF183c78),
        title: const Text('Quiz App'),
        leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: loading == false
          ? Center(child: CircularProgressIndicator())
          : alluser.length > 0
              ? SingleChildScrollView(
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Color(0xFF183c78),

                                  // border: Border.all()
                                ),
                              ),
                              Positioned(
                                top: 20,
                                left: 20,
                                child: Container(
                                  width: 350,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    // border: Border.all()
                                  ),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          10.0), //<-- SEE HERE
                                    ),
                                    // elevation: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Center(
                                        child: Text(
                                          //  "dsbvkjbnweijiruhiebwijbeivjbepiubeiwjbkjwbejbpiuwbeipjinvwqkjenkq;nkvwenq;ioneionwoknvkwn;;;;;;;;;;;;;qwiubvwjkq;ebv;kqjbno;iwnjhipewqfuhiuphbwuiqbijbqpieuwi",
                                          question.question.toString(),
                                          overflow: TextOverflow.ellipsis,

                                          style: const TextStyle(
                                              fontSize: 21,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      // Text(alluser[0].question.toString()),

                      //Text(questionss[0].alluser[0].options[0].a.toString()),

                      // for (int i = 0; i < alluser.length; i++)

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
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
                  ),
                )
              : Center(child: Text("NO Item")),
    );
  }
}
