import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/auth/sing_up_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';
import 'package:greengrocer/src/config/custom%20colors.dart';

import 'componets/custom_text_field.dart';

class singInScreen extends StatelessWidget {
  const singInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Size.height,
          width: Size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nome do app
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Green',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'grocer',
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Categorias
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Cereais'),
                            FadeAnimatedText('Laticíneos'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Formulário
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Email
                    const customTextField(
                      icon: Icons.email,
                      label: 'Email',
                    ),

                    //Senha
                    const customTextField(
                      icon: Icons.lock,
                      label: 'senha',
                      isScret: true,
                    ),

                    // Botão de entrar
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (c) {
                            return const BaseScreen();
                          }));
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    // Esqueceu a Senha
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: CustomColors.customContrastColor,
                          ),
                        ),
                      ),
                    ),

                    // Divisor
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('Ou'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///botão de novo usuário
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          side: const BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (c) {
                              return SingUpScreen();
                            }),
                          );
                        },
                        child: const Text(
                          'criar conta',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
