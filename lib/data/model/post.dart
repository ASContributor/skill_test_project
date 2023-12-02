

import 'dart:convert';

class post {
    int? id;
    String? email;
    String? firstName;
    String? lastName;
    String? avatar;

    post({
        this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.avatar,
    });

    factory post.fromRawJson(String str) => post.fromJson(jsonDecode(str));

    String toRawJson() => jsonEncode(toJson());

    factory post.fromJson(Map<String, dynamic> json) => post(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}