import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil/core/functions/show_snack_bar.dart';
import 'package:wasil/core/service_locator/service_locator.dart';
import 'package:wasil/core/widgets/black_logo.dart';
import 'package:wasil/core/widgets/circular_progress_indicator.dart';
import 'package:wasil/core/widgets/custom_button.dart';
import 'package:wasil/core/widgets/custom_text_form_field.dart';
import 'package:wasil/features/auth/domain/use_cases/user_sign_up_use_case.dart';
import 'package:wasil/features/auth/presentation/view/sign_in_view.dart';
import '../../../../core/app_constance/app_constance.dart';
import '../../../../core/app_styles/app_styles.dart';
import '../../../../core/functions/navigate.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../manager/user_sign_up_bloc/user_sign_up_bloc.dart';
import '../manager/user_sign_up_bloc/user_sign_up_states.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static TextEditingController mobileNumberController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController nameController = TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController codeController = TextEditingController();

  static var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => UserSignUpBloc(
        serviceLocator<UserSignUpUseCase>(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: BlackLogo(
                          width: screenSize.width / 15,
                          height: screenSize.height / 15,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Sign Up',
                        style: AppStyles.style28,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        label: 'User Name',
                        hintText: 'Enter User Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your user name';
                          }
                          return null;
                        },
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        label: 'Mobile Number',
                        isPhoneNumber: true,
                        hintText: 'Enter Mobile Number',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your mobile number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        controller: mobileNumberController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        label: 'Email',
                        hintText: 'Enter Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your email';
                          }
                          return null;
                        },
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        label: 'Password',
                        hintText: 'Enter Password',
                        isPassword: true,
                        isSuffixIconShown: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your password';
                          }
                          return null;
                        },
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        label: 'Confirm Password',
                        isSuffixIconShown: true,
                        hintText: 'Enter Password Confirmation ',
                        isPassword: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password confirmation';
                          }
                          if(confirmPasswordController.text != passwordController.text){
                            return 'Two passwords are not equal';
                          }
                          return null;
                        },
                        controller: confirmPasswordController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        label: 'Code',
                        hintText: 'Enter Shop Code / Agency Code if Any',
                        validator: (value) {
                          return null;
                        },
                        controller: codeController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      BlocConsumer<UserSignUpBloc, UserSignUpStates>(
                        listener: (context, state) {
                          if (state is UserSignUpErrorState) {
                            showSnackBar(
                              context: context,
                              label: state.error,
                              color: Colors.red,
                            );
                          }
                          if (state is UserSignUpSuccessfullyState) {
                            showSnackBar(
                              context: context,
                              label: 'Successfully',
                              color: Colors.green,
                            );
                            navigateAndRemoveUntil(
                              context: context,
                              screen: const SignInView(),
                            );
                            emptyTextFormFields();

                          }
                        },
                        builder: (context, state) {
                          if (state is UserSignUpLoadingState) {
                            return const CustomCircularProgressIndicator();
                          }

                          return CustomButton(
                            width: double.infinity,
                            title: 'Sign Up',
                            thereIsShadow: true,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                UserSignUpBloc.get(context).userSignUp({
                                  'name': nameController.text,
                                  'mobile': mobileNumberController.text,
                                  'password': passwordController.text,
                                  'email': emailController.text,
                                });
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have account?',
                            style: AppStyles.style13,
                          ),
                          CustomTextButton(
                            title: 'Sign In',
                            onPressed: () {
                              navigateAndRemoveUntil(
                                context: context,
                                screen: const SignInView(),
                              );
                            },
                            titleColor: AppConstance.primaryAppColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void emptyTextFormFields() {
    mobileNumberController.text = '' ;
    passwordController.text = '' ;
    nameController.text = '' ;
    confirmPasswordController.text = '' ;
    emailController.text = '' ;
    codeController.text = '' ;
  }
}
