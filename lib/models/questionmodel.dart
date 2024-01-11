import 'dart:convert';

Questionmodel questionmodelFromJson(String str) =>
    Questionmodel.fromJson(json.decode(str));

String questionmodelToJson(Questionmodel data) => json.encode(data.toJson());

class Questionmodel {
  final int length;
  final bool seccess;
  final String msg;
  final List<Alluser> alluser;

  Questionmodel({
    required this.length,
    required this.seccess,
    required this.msg,
    required this.alluser,
  });

  Questionmodel copyWith({
    int? length,
    bool? seccess,
    String? msg,
    List<Alluser>? alluser,
  }) =>
      Questionmodel(
        length: length ?? this.length,
        seccess: seccess ?? this.seccess,
        msg: msg ?? this.msg,
        alluser: alluser ?? this.alluser,
      );

  factory Questionmodel.fromJson(Map<String, dynamic> json) => Questionmodel(
        length: json["length"],
        seccess: json["seccess"],
        msg: json["msg"],
        alluser:
            List<Alluser>.from(json["alluser"].map((x) => Alluser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "length": length,
        "seccess": seccess,
        "msg": msg,
        "alluser": List<dynamic>.from(alluser.map((x) => x.toJson())),
      };
}

class Alluser {
  final String id;
  final String question;
  final List<String> options;
  final int answerindex;
  final String unitquestionid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Alluser({
    required this.id,
    required this.question,
    required this.options,
    required this.answerindex,
    required this.unitquestionid,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  Alluser copyWith({
    String? id,
    String? question,
    List<String>? options,
    int? answerindex,
    String? unitquestionid,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      Alluser(
        id: id ?? this.id,
        question: question ?? this.question,
        options: options ?? this.options,
        answerindex: answerindex ?? this.answerindex,
        unitquestionid: unitquestionid ?? this.unitquestionid,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory Alluser.fromJson(Map<String, dynamic> json) => Alluser(
        id: json["_id"],
        question: json["question"],
        options: List<String>.from(json["options"].map((x) => x)),
        answerindex: json["answerindex"],
        unitquestionid: json["unitquestionid"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "question": question,
        "options": List<dynamic>.from(options.map((x) => x)),
        "answerindex": answerindex,
        "unitquestionid": unitquestionid,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
