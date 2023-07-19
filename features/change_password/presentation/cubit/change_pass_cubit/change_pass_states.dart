
abstract class ChangePassStates {}

class ChangePassInitialState extends ChangePassStates {}

class ChangePassLoadingState extends ChangePassStates {}
class ChangePassSuccessState extends ChangePassStates {}
class ChangePassChangeColorState extends ChangePassStates {}
class ChangePassChangeHideState extends ChangePassStates {}
class ChangePassErrorState extends ChangePassStates
{
  String error;
  ChangePassErrorState(this.error);
}

class ChangePassDataErrorState extends ChangePassStates
{
  String error;
  ChangePassDataErrorState(this.error);
}
