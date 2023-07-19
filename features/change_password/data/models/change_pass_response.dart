class ChangePassResponse {
  bool? result;
  Content? content;
  int? errorCode;

  ChangePassResponse({this.result, this.content, this.errorCode});

  ChangePassResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    errorCode = json['errorCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    data['errorCode'] = this.errorCode;
    return data;
  }
}

class Content {
  String? message;

  Content({this.message});

  Content.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
