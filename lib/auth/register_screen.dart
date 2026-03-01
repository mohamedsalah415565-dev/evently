import 'package:evently_app/auth/login.dart';
import 'package:evently_app/home.dart';
import 'package:evently_app/widgets/default_eleveted_button.dart';
import 'package:evently_app/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Center(
                  child: Image.asset(
                    'assets/images/Evently_splash_logo.png',
                    height: 27,
                  ),
                ),
                SizedBox(height: screenHight * 0.05),
                Text('Create your account', style: textTheme.headlineSmall),
                SizedBox(height: 24),
                DefaultTextFormField(
                  hintText: 'Enter your name',
                  prefixIconImageName: 'user',
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'invalid name ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DefaultTextFormField(
                  hintText: 'Enter your email',
                  prefixIconImageName: 'email',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.length < 5) {
                      return 'invalid email ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DefaultTextFormField(
                  hintText: 'Enter your password',
                  prefixIconImageName: 'password',
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'invalid password ';
                    }
                    return null;
                  },
                  isPassword: true,
                ),
                SizedBox(height: 16),
                DefaultTextFormField(
                  hintText: 'Confirm your password',
                  prefixIconImageName: 'password',
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'invalid password ';
                    }
                    return null;
                  },
                  isPassword: true,
                ),
                SizedBox(height: screenHight * 0.04),

                DefaultElevetedButton(label: 'Register', onPressed: register),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      onPressed: () => Navigator.of(
                        context,
                      ).pushReplacementNamed(LoginScreen.routeName),
                      child: Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    }
  }
}
