import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'sample_file.g.dart';

@JsonSerializable()
class SampleFile {
  SampleFile(
      {required this.name,
      required this.hasError,
      List<int>? content,
      this.encodedContent = ''}) {
    if (content != null) {
      setContent(content);
    }
  }

  String name;
  String encodedContent;
  String hasError;

  List<int> getContent() => base64.decode(encodedContent);
  setContent(List<int> v) {
    encodedContent = base64.encode(v);
  }

  factory SampleFile.fromJson(Map<String, dynamic> json) =>
      _$SampleFileFromJson(json);
  Map<String, dynamic> toJson() => _$SampleFileToJson(this);
}
