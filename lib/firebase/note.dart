import 'dart:convert';

class Note {
  String? image;
  String? senderId;
  String? senderRole;
  String? type;
  String? name;

  Note({this.image, this.senderId, this.senderRole, this.type, this.name});

  factory Note.fromJsonString(String str) => Note._fromJson(jsonDecode(str));

  String toJsonString() => jsonEncode(_toJson());

  factory Note._fromJson(Map<String, dynamic> json) => Note(
        image: json['image'],
        senderId: json['senderId'],
        senderRole: json['senderRole'],
        type: json['type'],
        name: json['name'],
      );

  Map<String, dynamic> _toJson() => {
        'image': image,
        'senderId': senderId,
        'senderRole': senderRole,
        'type': type,
        'name': name,
      };
}
