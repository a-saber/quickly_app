
abstract class ChangeForgottenPassStates {}

class ChangeForgottenPassInitialState extends ChangeForgottenPassStates {}

class ChangeForgottenPassLoadingState extends ChangeForgottenPassStates {}
class ChangeForgottenPassSuccessState extends ChangeForgottenPassStates {}
class ChangeForgottenPassChangeColorState extends ChangeForgottenPassStates {}
class ChangeForgottenPassChangeHideState extends ChangeForgottenPassStates {}
class ChangeForgottenPassErrorState extends ChangeForgottenPassStates
{
  String error;
  ChangeForgottenPassErrorState(this.error);
}

class ChangeForgottenPassDataErrorState extends ChangeForgottenPassStates
{
  String error;
  ChangeForgottenPassDataErrorState(this.error);
}
