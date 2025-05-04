import 'package:admin_dashboard_e__commerce/core/components/customElevatedButton.dart';
import 'package:admin_dashboard_e__commerce/core/components/customTextField.dart';
import 'package:admin_dashboard_e__commerce/core/functions/ShowMSG.dart';
import 'package:admin_dashboard_e__commerce/core/functions/buid_custom_appbar.dart';
import 'package:admin_dashboard_e__commerce/core/functions/navigateWIthoutBack.dart';
import 'package:admin_dashboard_e__commerce/features/AddAdmin/data/cubit/add_admin_cubit.dart';
import 'package:admin_dashboard_e__commerce/features/Auth/presentation/Views/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAdminView extends StatefulWidget {
  const AddAdminView({super.key});

  @override
  State<AddAdminView> createState() => _AddAdminViewState();
}

class _AddAdminViewState extends State<AddAdminView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Add Admin"),
      body: BlocProvider(
        create: (context) => AddAdminCubit(),
        child: BlocConsumer<AddAdminCubit, AddAdminState>(
          listener: (context, state) {
           if (state is AddAdminSuccess) {
              navigateWithoutBack(context, const LoginView());
            }
            if (state is AddAdminError) {
              showMsg(context, state.msgError);
            }
          
          },
          builder: (context, state) {
            AddAdminCubit cubit = context.read<AddAdminCubit>();
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CustomField(
                      labelText: "Email",
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomField(
                      labelText: "Password",
                      isPassword: true,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 20),
                    CustomElevatedButton(
                      child: const Text("Add"),
                      onPressed: () {
                         if (_formKey.currentState!.validate()) {
                                cubit.createAnAccount({
                                  "email": _emailController.text,
                                  "password": _passwordController.text
                                });
                              }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
