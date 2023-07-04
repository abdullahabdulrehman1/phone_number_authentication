import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number_authentication/cubit/auth_cubit/auth_cubit.dart';
import 'package:phone_number_authentication/cubit/auth_cubit/auth_state.dart';
import 'package:phone_number_authentication/pages/first_page.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();

  void login() {
    // Perform login logic here
    String otp = otpController.text;
    // Validate and handle the OTP, e.g., authenticate, navigate to the next screen, etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: otpController,
              decoration: InputDecoration(
                hintText: 'Enter OTP',
              ),
            ),
            SizedBox(height: 16.0),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthCodeLoggedInState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => FirstPage()),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthCodeLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is AuthCodeErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.error.toString()),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2),
                  ));
                }
                return ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context)
                        .verifyOTP(otpController.text);
                  },
                  child: Text('Verify And LogIn'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
