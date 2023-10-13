import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/auth/componets/custom_text_field.dart';
import 'package:greengrocer/src/config/custom%20colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({super.key});

  final cpfformatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneformatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Size.height,
          width: Size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),

                  //Formulario
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const customTextField(
                          icon: Icons.email,
                          label: 'Email',
                        ),
                        const customTextField(
                          icon: Icons.lock,
                          label: 'Senha',
                          isScret: true,
                        ),
                        const customTextField(
                          icon: Icons.person,
                          label: 'Nome',
                        ),
                        customTextField(
                          icon: Icons.phone,
                          label: 'Celular',
                          inputFormatter: [phoneformatter],
                        ),
                        customTextField(
                          icon: Icons.file_copy,
                          label: 'CPF',
                          inputFormatter: [cpfformatter],
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Cadastrar usuário',
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
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
