import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil/core/app_constance/app_constance.dart';
import 'package:wasil/core/app_styles/app_styles.dart';
import 'package:wasil/core/functions/navigate.dart';
import 'package:wasil/core/service_locator/service_locator.dart';
import 'package:wasil/core/widgets/black_logo.dart';
import 'package:wasil/core/widgets/circular_progress_indicator.dart';
import 'package:wasil/core/widgets/custom_button.dart';
import 'package:wasil/core/widgets/custom_text_button.dart';
import 'package:wasil/core/widgets/custom_text_form_field.dart';
import 'package:wasil/features/auth/domain/use_cases/user_sign_in_use_case.dart';
import 'package:wasil/features/auth/presentation/view/sign_up_view.dart';
import 'package:wasil/features/auth/presentation/view/widgets/custom_check_box_list_tile.dart';
import 'package:wasil/features/auth/presentation/view/widgets/custom_divider.dart';

import '../../../../core/functions/show_snack_bar.dart';
import '../manager/user_sign_in_bloc/user_sign_in_bloc.dart';
import '../manager/user_sign_in_bloc/user_sign_in_states.dart';

class SignInView extends StatelessWidget {
  static TextEditingController mobileNumberController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static var formKey = GlobalKey<FormState>();

  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => UserSignInBloc(serviceLocator<UserSignInUseCase>()),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: BlackLogo(
                          width: screenSize.width / 15,
                          height: screenSize.height / 15,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Sign In',
                        style: AppStyles.style28,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        label: 'Mobile Number',
                        isPhoneNumber: true,
                        hintText: 'Enter Mobile Number',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your mobile phone';
                          }
                          return null;
                        },
                        controller: mobileNumberController,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        label: 'Password',
                        hintText: 'Enter Your Password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your password';
                          }
                          return null;
                        },
                        controller: passwordController,
                        isPassword: true,
                        isSuffixIconShown: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCheckBocListTile(title: 'Remember me'),
                          CustomTextButton(
                            title: 'Forget Password?',
                            onPressed: () {},
                            titleColor: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      BlocConsumer<UserSignInBloc, UserSignInStates>(
                        listener: (context, state) {
                          if (state is UserSignInErrorState) {
                            showSnackBar(
                              context: context,
                              label: state.error,
                              color: Colors.red,
                            );
                          }
                          if (state is UserSignInSuccessfullyState) {
                            showSnackBar(
                              context: context,
                              label: 'Sign In Successfully',
                              color: Colors.green,
                            );
                            emptyTextFormFields();
                          }
                        },
                        builder: (context, state) {
                          if (state is UserSignInLoadingState) {
                            return const CustomCircularProgressIndicator();
                          }
                          return CustomButton(
                            width: double.infinity,
                            title: 'Sign In',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                UserSignInBloc.get(context).userSignIn(
                                  {
                                    'mobile' : mobileNumberController.text,
                                    'password' : passwordController.text,
                                  },
                                );
                              }
                            },
                            thereIsShadow: true,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account ?',
                            style: AppStyles.style13,
                          ),
                          CustomTextButton(
                            title: 'Sign Up',
                            onPressed: () {
                              navigate(
                                context: context,
                                screen: const SignUpView(),
                              );
                            },
                            titleColor: AppConstance.primaryAppColor,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: CustomDivider(),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text('Sign In as'),
                          CustomTextButton(
                            title: 'visitor',
                            onPressed: () {},
                            titleColor: AppConstance.primaryAppColor,
                          ),
                          const Expanded(
                            child: CustomDivider(),
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
    mobileNumberController.text = '';
    passwordController.text = '' ;
  }
}
