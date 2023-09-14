import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_valbury/presentation/login/login_screen.dart';
import 'package:test_valbury/presentation/register/bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: MaterialApp(home: RegisterPage()),
    );
  }
}

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registerBloc = BlocProvider.of<RegisterBloc>(context);

    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegistrationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Registration successful!'),
                duration: Duration(seconds: 2),
              ),
            );
          }

          if (state is RegisterNavigateLogin) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const LoginScreen()));
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Register"),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    return TextField(
                      controller: emailController,
                      onChanged: (value) {
                        registerBloc.add(EmailChanged(email: value));
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: state.errorEmail,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    return TextField(
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                      onChanged: (value) {
                        registerBloc.add(PhoneChanged(phone: value));
                      },
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        errorText: state.errorPhone,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final email = emailController.text;
                        final phone = phoneController.text;
                        registerBloc.add(
                            SubmitButtonPressed(email: email, phone: phone));
                      },
                      child: const Text('Register'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
