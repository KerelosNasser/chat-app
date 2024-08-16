import 'package:flutter/material.dart';
import '../components/crud.dart';
import '../components/validtors.dart';
import '../widgets/custom_button.dart';
import '../widgets/customtextfield.dart';
import 'Home_screen.dart';
import 'Singup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  void _login() async {
    setState(() {
      _emailError = InputValidators.validateEmail(_emailController.text);
      _passwordError = InputValidators.validatePassword(_passwordController.text);
    });

    if (_emailError == null && _passwordError == null) {
      final response = await loginUser(
        _emailController.text,
        _passwordController.text,
      );

      if (response['success'] == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login failed. Please check your credentials.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 35.0),
                  child: Icon(
                    Icons.login,
                    size: 90,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'LogIn',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _emailController,
                  labelText: 'Email',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Log In',
                  onPressed: _login,
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ),
                  ),
                  child: const Text(
                    'Don\'t have an account? Sign up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
