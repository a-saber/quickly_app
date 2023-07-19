class EndPoints
{
  static const String _pathAuth ='/company/auth/';
  static const String _pathPublic ='/company/';
  static const String login ='${_pathAuth}login';
  static const String sendCode ='${_pathAuth}sendCode';
  static const String verifyCode ='${_pathAuth}verifyCode';
  static const String changePass ='${_pathAuth}changePassword';
  static const String resetForgotPassword ='${_pathAuth}resetForgotPassword';
  static const String specialties ='${_pathPublic}specialties';
  static const String types ='${_pathPublic}types';
}
