abstract class LoginStates {}

class InitialLoginState extends LoginStates {}

class ChangeVisibilityState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {}

class LoginCancelledState extends LoginStates {}
