
/**
 *  [ValidationChecker] class contains all validation for better use.
 */

/// var maskTelephone = new MaskTextInputFormatter(mask: '+7 (ddd) ddd-dd-dd', filter: { "d": RegExp(r'[0-9]') });

class ValidationChecker
{
  /*NAME VALIDATOR*/
  static bool isValidUserName(String value)
  {
    String pattern = r'^((?![_., @])[a-zA-ZА-Яа-я0-9_., @]+(?<![_., @])){2,}$';
    // Pattern pattern = r'^((?![0-9_. ])[a-zA-ZА-Яа-я0-9_. ]+(?<![_. 0-9])){2,}$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  /*EMAIL VALIDATOR*/
  static bool isValidEmail(String emailText) {
    if ( emailText.length < 1)
      return false;
    String pattern = r'^([a-zA-Z0-9+_\-\.\,]+)+[a-zA-Z0-9]@([a-zA-Z]{2,})\.([a-zA-Z]{2,6})$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(emailText);
  }

  /*PASSWORD VALIDATOR*/
  static bool isValidPassword(String value){
    /// Minimum 1 Upper case,
    /// Minimum 1 Special Character,
    /// Common Allow Character ( ! @ # $ & * ~ )

    //// Minimum 1 lowercase,
    //// Minimum 1 Numeric Number,
    ////   String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    String  pattern = r'^(?=.*?[A-Z])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  /*PHONE VALIDATOR*/
  static bool isValidPhone(String phone,{String validationRegex=r'(^(?:[+0]91)?[0-9]{10}$)'}) {
    phone=phone.replaceAll("(", "").replaceAll(")", "").replaceAll(" ", "").replaceAll("-", "");
    String pattern = validationRegex;
    print("$phone , $pattern");
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(phone);
  }

  /*NUMBER VALIDATOR*/
  static bool isValidNumber(String number) {
    print(number);
    String pattern = r'^([0-9.])+(?<![.])$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(number);
  }

  /*NUMBER VALIDATOR*/
  static bool isValidInt(String number) {
    print(number);
    String pattern = r'^([0-9])+(?<![.])$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(number);
  }
}