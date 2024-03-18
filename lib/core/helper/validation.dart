import 'package:flutter_project/core/model/app_data.dart';
import 'package:flutter_project/core/utils/Constants.dart';

abstract class Validation {
static bool _languageEn= AppData.instance.Language==ENGLISH;
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return _languageEn? 'Please enter an email address'
      :"  الرجاء إدخال عنوان البريد الإلكتروني";
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email)) {
      return _languageEn?'Invalid email format':"تنسيق البريد الإلكتروني غير صالح";
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
      return _languageEn? '       Please Enter Password':"الرجاء إدخال كلمة المرور";
    } else if (password.length < 8) {
      return _languageEn?'       Confirm Password Too Short':"تأكيد كلمة المرور قصيرة جدًا";
    }
    return null;
  }

  static String? validatePasswordConfirm(
      String? passwordConfirm, String? password) {
    if (password == null || password.isEmpty) {
      return _languageEn? '       Please Enter Confirm Password':"الرجاء إدخال تأكيد كلمة المرور";
    } else if (password.length < 8) {
      return _languageEn?'       Confirm Password Too Short':"تأكيد كلمة المرور قصيرة جدًا";
    } else if (password != passwordConfirm) {
      return _languageEn?'       Confirm Password Not Matched':"تأكيد كلمة المرور غير متطابقة";
    }
    return null;
  }

  static bool isNameValid(String em) {
    String p = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
    RegExp regExp = RegExp(p);
    return !regExp.hasMatch(em);
  }

  static String? validateName(String? name) {
    if (name!.isEmpty) {
      return  AppData.instance.Language==ENGLISH ?'       Please Enter Your Name'
      :"من فضلك أدخل إسمك  ";

    }
    if (isNameValid(name)) {
      return _languageEn ?'       Please Enter Valid Name\n       example example'
   :"الرجاء إدخال اسم صالح \n اسم اسم";
    }
    return null;
  }
}
