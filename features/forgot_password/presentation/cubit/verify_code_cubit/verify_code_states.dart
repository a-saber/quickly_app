
abstract class VerifyCodeStates {}

class VerifyCodeInitialState extends VerifyCodeStates {}

class VerifyCodeLoadingState extends VerifyCodeStates {}
class VerifyCodeSuccessState extends VerifyCodeStates {}
class VerifyCodeErrorState extends VerifyCodeStates
{
  String error;
  VerifyCodeErrorState(this.error);
}

class VerifyCodeColorChangeState extends VerifyCodeStates {}
class VerifyCodeSuccessErrorDataState extends VerifyCodeStates
{
  String error;
  VerifyCodeSuccessErrorDataState(this.error);
}
