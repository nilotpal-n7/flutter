import 'package:fchat/services/auth/auth_service.dart';
import 'package:fchat/components/my_button.dart';
import 'package:fchat/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;

  LoginPage({
    super.key,
    required this.onTap,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    try {
      final authService =  AuthService();
      await authService.signInWithEmailPassword(
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
                'Welcome back, you\'ve been missed!',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 25),
              MyTextfield(
                hintText: 'Email',
                obscureText: false,
                controller: emailController,
                autofillHints: [AutofillHints.email],
              ),
              const SizedBox(height: 10),
              MyTextfield(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController,
                autofillHints: [AutofillHints.password],
              ),
              const SizedBox(height: 25),
              MyButton(
                text: 'Login',
                onTap: () => login(context),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member? ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Register now',
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
