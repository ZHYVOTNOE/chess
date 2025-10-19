import 'package:chess/screens/signin_screen.dart';
import 'package:chess/screens/signup_screen.dart';
import 'package:chess/theme/theme.dart';
import 'package:chess/widgets/custom_scaffold.dart';
import 'package:chess/widgets/welcome_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
            flex: 8,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Добро пожаловать!\n',
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '\nВойдите в личный кабинет',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                      child: WelcomeButton(
                        buttonText: 'Регистрация',
                        onTap: SignUpScreen(),
                        color: Colors.transparent,
                        textColor: Colors.white,
                      )
                  ),
                  Expanded(
                      child: WelcomeButton(
                        buttonText: 'Авторизация',
                        onTap: SignInScreen(),
                        color: Colors.white,
                        textColor: lightColorScheme.primary,
                      )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
