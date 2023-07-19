class CodeResponse {
  bool? result;
  Content? content;
  int? errorCode;

  CodeResponse({this.result, this.content, this.errorCode});

  CodeResponse.fromJson(Map<String, dynamic> json) {
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
  var message;

  Content({this.message});

  Content.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = json['message'];
    }
    else
    {
      message = json['errors']['phone'][0];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
