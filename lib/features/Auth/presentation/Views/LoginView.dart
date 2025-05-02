import 'package:admin_dashboard_e__commerce/core/components/customCircleProgressIndecator.dart';
import 'package:admin_dashboard_e__commerce/core/components/customElevatedButton.dart';
import 'package:admin_dashboard_e__commerce/core/functions/buid_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/components/customTextField.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildCustomAppBar(context, "Login As An Admin", isBackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomField(
                labelText: "Email",
                controller: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomField(
                labelText: "Password",
                controller: passwordController,
                isPassword: true,
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                  child: const Text("Login"), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
