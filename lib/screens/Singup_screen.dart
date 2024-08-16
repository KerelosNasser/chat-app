import 'package:flutter/material.dart';
import '../components/crud.dart';
import '../components/validtors.dart';
import '../widgets/custom_button.dart';
import '../widgets/customtextfield.dart';
import 'Home_screen.dart';
import 'Login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.person_add,
                      size: 80,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _nameController,
                      labelText: 'Name',
                      validator: InputValidators.validateName,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _emailController,
                      labelText: 'Email',
                      validator: InputValidators.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _passwordController,
                      labelText: 'Password',
                      obscureText: true,
                      validator: InputValidators.validatePassword,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          bool success = await createUser(
                            _nameController.text,
                            _emailController.text,
                            _passwordController.text,
                          );

                          if (success) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeScreen()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Sign up failed. Please try again.'),
                              ),
                            );
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text(
                        'Already signed up? Login',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
