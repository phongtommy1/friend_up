import 'dart:ui';

import 'package:flutter/material.dart';

class Content {
  final String text;
  final int like;
  final int dislike;
  final String uuid;

  Content({ required this.text,  required this.like, required this.dislike, required this.uuid});

  Content.fromJson(Map<dynamic, dynamic> json)
      : like = (json['like'] as int),
        dislike = (json['dislike'] as int),
        uuid = (json['uuid'] as String),
        text = json['text'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'like': like,
    'dislike' : dislike,
    'text': text,
    'uuid': uuid
  };
}



