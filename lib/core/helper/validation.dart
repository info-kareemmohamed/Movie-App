abstract class Validation {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter an email address';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  }

  static bool isGmailEmail(String email) {
    String gmailRegExp = r"^[a-zA-Z0-9_.+-]+@gmail\.com$";
    RegExp regExp = RegExp(gmailRegExp);
    return regExp.hasMatch(email);
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return '       Please Enter Password';
    } else if (password.length < 8) {
      return '       Confirm Password Too Short';
    }
    return null;
  }

  static String? validatePasswordConfirm(
      String? passwordConfirm, String? password) {
    if (password == null || password.isEmpty) {
      return '       Please Enter Confirm Password';
    } else if (password.length < 8) {
      return '       Confirm Password Too Short';
    } else if (password != passwordConfirm) {
      return '       Confirm Password Not Matched';
    }
    return null;
  }

  static bool isNamevalid(String em) {
    String p = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
    RegExp regExp = RegExp(p);
    return !regExp.hasMatch(em);
  }

  static String? validateName(String? name) {
    if (name!.isEmpty) {
      return '       Please Enter Your Name';
    }
    if (isNamevalid(name)) {
      return '       Please Enter Valid Name\n       example example';
    }
    return null;
  }
}
