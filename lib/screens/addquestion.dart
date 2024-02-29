import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app_tutorial/models/answermodel.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final TextEditingController _optionControllera = TextEditingController();
  final TextEditingController _optionControllerb = TextEditingController();
  final TextEditingController _optionControllerc = TextEditingController();
  final TextEditingController _optionControllerd = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();
  final TextEditingController _unitidController = TextEditingController();

  final _questionkey = GlobalKey<FormState>();

// {

// "options":[
// "patna",
// "Delhi",
// "Goa",
// "Up"
// ],
// "question":"Capital of bihar",
// "answerindex":1,
// "unitquestionid":"65a122580ebf76a3a525dddd"

// }

  //  List data = [_optionController] ;

  // List<String> controllers = [_optionController.text];

  List option = [];

  // data() {
  //   List opt = _optionController.text.split(",");
  //   for (int i = 0; i < opt.length; i++) {
  //     option = option[i];
  //   }
  // }

  TextEditingController textFieldController = TextEditingController();
  List<String> inputStrings = [];

  List<String> inputStringsoption = [];

  optionadd() {
    for (int i = 0; i < inputStrings.length; i++) {
      inputStringsoption.add(inputStrings[i].split(",").toString());
    }
  }

  addoption() {
    inputStrings.addAll({
      _optionControllera.text,
      _optionControllerb.text,
      _optionControllerc.text,
      _optionControllerd.text
    });

    debugger();
    print(inputStrings);
    setState(() {});
  }

  createAlbum() async {
    final response = await http.post(
      Uri.parse('http://192.168.1.113:8080/api/v1/user/question'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'question': _questionController.text,
        'options': [
          _optionControllera.text,
          _optionControllerb.text,
          _optionControllerc.text,
          _optionControllerd.text
        ],
        'answerindex': dropdownvalue!.id,
        'unitquestionid': "65a122580ebf76a3a525dddd",
      }),
    );
    setState(() {});
    debugger();
    print(response.body);
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      debugger();
      print(response.body.toString());
      // return
      //Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create album.');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  createnoti() async {
    final response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization":
            "Key=AAAA_6tSD64:APA91bHzrxSzpFTw8SK-lervxya0Hof77dt1DeuU8b8jIID-_oUgdi843x110xDXYNPHu_8wNiajuXUWCRHewd4D-Etq4FU1QORB2QSqS47ls3xLyJTU1rqvLDOwaYpEDNLleNYrnzbF"
      },
      body: jsonEncode(<String, dynamic>{
        "to":
            "fCX92Yi3RSWFbgP46qGSsN:APA91bH4NRsIi6eCo_NqRpN7qB72BqZIUZZvIgYMjYfo8yCrFc0jFXkLktZw4PNQyPLi3STW4VI3Avwnd-m9VK6bydkDs6PUC8y1f7hY_rOjqseJayCFaNAffLsNll4kZ0EpM7k_KIi9",
        "notification": {
          "title": "Book Fair Appointment😊😊",
          "body": ["1", "2"], //"Fair Start 19 January Book Now✋✋",
          "image":
              "https://crmbeta.global-opportunities.co.in/fileupload/1025178/banner-fair.png"
        }
      }),
    );
    setState(() {});
    debugger();
    print(response.body);
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      debugger();
      print(response.body.toString());
      // return
      //Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create album.');
    }
  }

  MonthModel? dropdownvalue;

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("nkcnkk;l"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _questionkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _questionController,
                  minLines: 4,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    labelText: 'Enter question',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _optionControllera,
                  minLines: 2,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    labelText: 'Enter option A',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _optionControllerb,
                  minLines: 2,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    labelText: 'Enter option B',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _optionControllerc,
                  minLines: 4,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    labelText: 'Enter option c',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _optionControllerd,
                  minLines: 2,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    labelText: 'Enter option D',
                  ),
                ),

                // The validator receives the text that the user has entered.

                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _answerController,
                  minLines: 2,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    labelText: 'answer',
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // The validator receives the text that the user has entered.
                  controller: _unitidController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: DropdownButton(
                    hint: Text("Select your Answer"),
                    // Initial Value

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: months.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items.name.toString()),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value

                    value: dropdownvalue,
                    onChanged: (value) {
                      setState(() {
                        dropdownvalue = value!;
                      });
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      createAlbum();
                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MyQuestionPage extends StatefulWidget {
//   @override
//   _MyQuestionPageState createState() => _MyQuestionPageState();
// }

// class _MyQuestionPageState extends State<MyQuestionPage> {
//   TextEditingController questionController = TextEditingController();
//   TextEditingController option1Controller = TextEditingController();
//   TextEditingController option2Controller = TextEditingController();
//   TextEditingController option3Controller = TextEditingController();
//   TextEditingController option4Controller = TextEditingController();
//   TextEditingController answerIndexController = TextEditingController();
//   TextEditingController unitQuestionIdController = TextEditingController();

//   Future<void> submitQuestion() async {
//     final apiUrl = 'http://192.168.1.113:8080/api/v1/user/question';

//     Map<String, dynamic> questionData = {
//       "options": [
//         option1Controller.text,
//         option2Controller.text,
//         option3Controller.text,
//         option4Controller.text,
//       ],
//       "question": questionController.text,
//       "answerindex": int.parse(answerIndexController.text),
//       "unitquestionid": unitQuestionIdController.text,
//     };

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(questionData),
//       );

//       if (response.statusCode == 201) {
//         print('POST request successful. Response: ${response.body}');
//         // Handle success
//       } else {
//         print('Failed to submit question. Status code: ${response.statusCode}');
//         // Handle error
//       }
//     } catch (e) {
//       print('Error submitting question: $e');
//       // Handle error
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Question Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: questionController,
//               decoration: InputDecoration(labelText: 'Question'),
//             ),
//             TextField(
//               controller: option1Controller,
//               decoration: InputDecoration(labelText: 'Option 1'),
//             ),
//             TextField(
//               controller: option2Controller,
//               decoration: InputDecoration(labelText: 'Option 2'),
//             ),
//             TextField(
//               controller: option3Controller,
//               decoration: InputDecoration(labelText: 'Option 3'),
//             ),
//             TextField(
//               controller: option4Controller,
//               decoration: InputDecoration(labelText: 'Option 4'),
//             ),
//             TextField(
//               controller: answerIndexController,
//               decoration: InputDecoration(labelText: 'Answer Index (0-3)'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: unitQuestionIdController,
//               decoration: InputDecoration(labelText: 'Unit Question ID'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: submitQuestion,
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
