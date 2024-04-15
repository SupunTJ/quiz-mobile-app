import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_quiz_app/configs/themes/app_colors.dart';
import 'package:mobile_quiz_app/controllers/question_paper/auth_controller.dart';
import 'package:mobile_quiz_app/screens/login/Validators.dart';
import 'package:mobile_quiz_app/widgets/common/main_button.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends GetView<AuthConatroller> {
  LoginScreen({Key? key});

  static const String routeName = "/login";

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var appValidator = AppValidators();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: mainGradient()),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 280.0, top: 50), // Adjust the left margin as needed
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor:
                            Theme.of(context).splashColor.withOpacity(0.2),
                        elevation: 5,
                        shadowColor: const Color.fromARGB(255, 34, 37, 41),
                        minimumSize: const Size.fromHeight(45)),
                    onPressed: () {
                      // Navigate to the registration page
                      controller.navigateToHomePage();
                    },
                    child: const Text(
                      "<-",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Lottie.network(
                      "https://lottie.host/0e3bbba2-3cca-4199-b031-cbe6b7840d4e/fL5Xl7Cub0.json",
                      width: 300),

                  // Image.asset(
                  //   "assets/images/giphy.gif",
                  //   width: 200,
                  //   height: 200,
                  // ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  child: Text(
                    "Login, Quiz, Thrive: Your daily dose of mobile brainpower",
                    style: TextStyle(
                      color: onSurfaceTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Email text field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    labelText: 'Email',
                  ),
                  validator: appValidator.validateEmail,
                ),
                // Password text field
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your Password',
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: appValidator.validatePassword,
                ),
                const SizedBox(
                    height: 16), // Add some space between text field and button
                // Sign In button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      controller.signInWithEmailAndPassword(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor:
                          Theme.of(context).splashColor.withOpacity(0.5),
                      elevation: 10,
                      shadowColor: const Color.fromARGB(255, 34, 37, 41),
                      minimumSize: const Size.fromHeight(45)),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),

                const Center(
                  child: Text(
                      "If you don't have an account please register by clicking below button..."),
                ),
                // Register button
                TextButton(
                  onPressed: () {
                    // Navigate to the registration page
                    controller.navigateToRegisterPage();
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Sign In with Google button (your existing code)
                ElevatedButton(
                  onPressed: () {
                    controller.signInWithGoogle();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor:
                          Theme.of(context).splashColor.withOpacity(0.5),
                      elevation: 10,
                      shadowColor: const Color.fromARGB(255, 34, 37, 41),
                      minimumSize: const Size.fromHeight(45)),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        child: Transform.scale(
                          scale: 2,
                          child: Container(
                            width: 20,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: SvgPicture.asset(
                                "assets/icons/google.svg",
                                width: 36,
                                height: 36,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Sign in with Google",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
