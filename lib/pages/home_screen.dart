import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number_authentication/cubit/auth_cubit/auth_cubit.dart';
import 'package:phone_number_authentication/cubit/auth_cubit/auth_state.dart';
import 'package:phone_number_authentication/pages/otp_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                hintText: 'Enter Phone Number',
              ),
            ),
            SizedBox(height: 16.0),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthCodeSentState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OtpScreen()),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthCodeLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                  onPressed: () {
                    String phoneNumber = '+92' + phoneNumberController.text;
                    BlocProvider.of<AuthCubit>(context).sendOTP(phoneNumber);
                  },
                  child: Text('Send OTP'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
