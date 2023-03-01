import 'dart:developer';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jump_q/ui/widget/my_input.dart';
import '../helper/custom_raised_button.dart';
import '../helper/validation_checker.dart';
import '../theme/my_theme.dart';



class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
//  Repository repository = Repository();
  bool agree = false;
  bool showPassword = false;
  bool formValid = false;
  bool showPassword2 = false;
 // var firstNameTextController = TextEditingController();
  var DOBTextController = TextEditingController();
  var UserNameTextController = TextEditingController();
  var phoneController = TextEditingController();
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  var confirmTextController = TextEditingController();
  var countriesTextController = TextEditingController();

  get registerUser => null;


  /// To check form validation
  onFormChange() {
    if (DOBTextController.text
        .trim()
        .length < 8) {
      changeFormValidationState(false);
    }
    else if (UserNameTextController.text
        .trim()
        .length < 3) {
      changeFormValidationState(false);
    }
    //var DOBTextController = TextEditingController();

    else if (!ValidationChecker.isValidEmail(emailTextController.text.trim())) {
      changeFormValidationState(false);
    }
    else if (!ValidationChecker.isValidPhone(phoneController.text.trim())) {
      changeFormValidationState(false);
    }
    else if (!ValidationChecker.isValidPassword(passwordTextController.text.trim())) {
      changeFormValidationState(false);
    }
    else if (!ValidationChecker.isValidPassword(confirmTextController.text.trim())) {
      changeFormValidationState(false);
    }
    else if (!formValid) {
      changeFormValidationState(true);
    }
  }

  void changeFormValidationState(bool state) {
    if (state == formValid) {
      return;
    }
    setState(() {
      formValid = state;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.kColorLightWhite,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Create Account",style: TextStyle(color: MyColors.kColorBlack),),
          ),
          elevation: 0,
          backgroundColor: MyColors.kColorWhite,
          leading:  Container(
              margin: EdgeInsets.only(left: size_12),
              child:   BackButton(color: MyColors.kColorBlack,)),
        ),
        body: Column(
          children: [
            SizedBox(
              height: size_36,
            ),


            Center(
                child: Text( "Lorem ipsum dolor sit amet, consectetur\n adipiscing elit.",textAlign: TextAlign.center,
                  style:TextStyle(fontSize: size_16, color: MyColors.kColorBlack900),

                )),
            SizedBox(
              height: size_14,
            ),
            Expanded(
              child: Form(
                onChanged: onFormChange,
                child: ListView(

                  padding: EdgeInsets.symmetric(horizontal: size_20,),
                  children: [
                    SizedBox(height: size_24,),
                    SizedBox(height: size_12),
                    TextFormField(
                        controller: emailTextController,
                        style: MyTextStyle.kTextMedium,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                        ValidationChecker.isValidEmail(value!)
                            ? null
                            : "Please enter valid email",
                        decoration: greyInputDecoration(
                          hintText: "Email Address",).copyWith(
                          prefixIcon: const Icon(Icons.mail_outline),
                        )
                    ),
                    SizedBox(height: size_12,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: phoneController,
                      style: MyTextStyle.kTextMedium,
                      decoration: greyInputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone Number",).copyWith(
                          prefixIcon: const Icon(Icons.phone_outlined)

                      ),),
                    SizedBox(height: size_12,),

                    TextFormField(

                        obscureText: !showPassword,
                        controller: passwordTextController,
                        textAlignVertical: TextAlignVertical.center,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                        ValidationChecker.isValidPassword(value!)
                            ? null
                            : "Password must be valid.",
                        onChanged: (value) {

                        },
                        decoration: greyInputDecoration(
                          hintText: "Password",).copyWith(
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size_4, vertical: size_0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Tooltip(
                                  message: 'Password :- \n'
                                      '1. Should be minimum 8 character \n'
                                      '2. Should contain atleast 1 upper case \n'
                                      '3. Should contain atleast 1 special character (!@#\$&*~) '
                                      '',
                                //  child: Icon(Icons.info_outline),
                                ),
                                SizedBox(
                                  width: size_8,
                                ),

                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                      showPassword2=false;
                                    });
                                  },
                                  child: Icon(
                                    showPassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: MyColors.kColorLightGrey,
                                  ),
                                ),
                                SizedBox(
                                  width: size_6,
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(height: size_12),

                    TextFormField(
                        controller: UserNameTextController,
                        style: MyTextStyle.kTextMedium,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                        value!.length > 3
                            ? null
                            : "Last Name should be minimum 3 character.",
                        decoration: greyInputDecoration(
                          hintText: "Choose username",).copyWith(
                          prefixIcon: const Icon(Icons.person),
                        )

                    ),
                    SizedBox(height: size_12),


                    TextFormField(
                      keyboardType: TextInputType.number,
                        controller: DOBTextController,
                        style: MyTextStyle.kTextMedium,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                        value!.length > 8
                            ? null
                            : "enter correct number of your date of birth",
                        decoration: greyInputDecoration(
                          hintText: "Date of birth",).copyWith(
                          prefixIcon: const Icon(Icons.date_range),
                        )

                    ),




                    SizedBox(height: size_24,),
                    MyButton(
                      title: "Sign Up", onPressed: !formValid ? null :registerUser,),
              SizedBox(height: size_16),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: size_12),
                        child: RichText(
                            text: TextSpan(
                                text: "by signing up, you agree to sense's",
                                style: MyTextStyle.kTextMedium.copyWith(
                                    color: MyColors.kColorBlack900),
                                children: [
                                  TextSpan(
                                      text: "Terms and Condition",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            log(' Terms & Condition'),
                                      style: MyTextStyle.kTextBold.copyWith(
                                          decoration: TextDecoration
                                              .underline)),
                                 ]
                            )),
                      ),
                    ),

                   // SizedBox(height: size_24,),

                  ],
                ),
              ),
            ),
          ],
        ));
  }

  // void registerUser() async {
  //   Map<String,dynamic> payload ={
  //     "first_name":firstNameTextController.text.trim(),
  //     "last_name":lastNameTextController.text.trim(),
  //     "email":emailTextController.text.trim(),
  //     "password":passwordTextController.text.trim(),
  //     "fcm_token":Session().getString(Constant.DEVICE_UID),
  //     "mobile":phoneController.text.trim(),
  //   };
  //   removeFocus(context: context);
  //   MyProgressDialog progressDialog = MyProgressDialog();
  //   progressDialog.show();
  //   var response = await repository.registerUser(payload);
  //   print("registerUser => $response");
  //   progressDialog.hide();
  //   if(response[0])
  //   {
  //     var token = response[1]["token"];
  //     Session session = Session();
  //     session.setValue(Constant.LOGIN_STATUS, true);
  //     session.setValue(Constant.AUTH_TOKEN, token);
  //     session.setUserBasicData(response[1]["data"]);
  //
  //     navigatorPushReplace(const HomeScreen());
  //   }
  //   else
  //   {
  //     showToast(response[1]);
  //   }
  // }

  @override
  void dispose() {
    DOBTextController.dispose();
    UserNameTextController.dispose();
    passwordTextController.dispose();
    confirmTextController.dispose();
    emailTextController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
