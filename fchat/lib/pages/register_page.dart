import 'package:fchat/services/auth/auth_service.dart';
import 'package:fchat/components/my_button.dart';
import 'package:fchat/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void register(BuildContext context) async {
    if(passwordController.text == confirmPasswordController.text) {
      try {
        final authService = AuthService();
        await authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
        TextInput.finishAutofillContext();
        Navigator.pushNamed(context, '/home');
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Password didn\'t match'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: AutofillGroup(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 50),
              Text(
                'Let\'s create an account for you!',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 25),
              MyTextfield(
                hintText: 'Email',
                obscureText: false,
                controller: emailController,
              ),
              const SizedBox(height: 10),
              MyTextfield(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              MyTextfield(
                hintText: 'Confirm password',
                obscureText: true,
                controller: confirmPasswordController,
              ),
              const SizedBox(height: 25),
              MyButton(
                text: 'Register',
                onTap: () => register(context),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member? ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Login now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
