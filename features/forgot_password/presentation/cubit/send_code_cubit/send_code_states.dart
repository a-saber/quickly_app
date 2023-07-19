
abstract class SendCodeStates {}

class SendCodeInitialState extends SendCodeStates {}
int counter=0;
class SendCodeLoadingState extends SendCodeStates {}
class SendCodeSuccessState extends SendCodeStates
{

  SendCodeSuccessState(){counter++;}
}
class SendCodeSuccessErrorDataState extends SendCodeStates
{
  String error;
  SendCodeSuccessErrorDataState(this.error);
}
class SendCodeErrorState extends SendCodeStates
{
  String error;
  SendCodeErrorState(this.error);
}

class SendCodeFirebaseLoadingState extends SendCodeStates {}
class SendCodeFirebaseSuccessState extends SendCodeStates {}
class SendCodeFirebaseSuccessErrorDataState extends SendCodeStates
{
  String error;
  SendCodeFirebaseSuccessErrorDataState(this.error);
}
class SendCodeFirebaseErrorState extends SendCodeStates
{
  String error;
  SendCodeFirebaseErrorState(this.error);
}


class SendCodeChangeColorState extends SendCodeStates {}
