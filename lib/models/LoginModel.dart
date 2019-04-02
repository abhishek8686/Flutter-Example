import 'package:clinic_app/models/GetUserList.dart';

class LoginModel{
  String errorCode;
  String responseString;
  GetUserList getUserList;

  LoginModel({this.errorCode, this.responseString, this.getUserList});

  LoginModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    responseString = json['response_string'];
    getUserList = json['getUserList'] != null
        ? new GetUserList.fromJson(json['getUserList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    data['response_string'] = this.responseString;
    if (this.getUserList != null) {
      data['getUserList'] = this.getUserList.toJson();
    }
    return data;
  }


}