import 'package:app/pages/login/controllers/login.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BubblesBackgroundPaint extends CustomPainter {
  late final Color primaryColor;

  BubblesBackgroundPaint() {
    this.primaryColor = Get.theme?.primaryColor ?? Colors.black;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = primaryColor.withOpacity(0.6);

    canvas.drawCircle(Offset(size.width, 0.0), 240.0, paint);

    paint.color = primaryColor.withOpacity(0.2);
    canvas.drawCircle(Offset(0.0, size.width / 2), 100.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomPaint(
        painter: BubblesBackgroundPaint(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Obx(() => SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Entrar',
                            style: Get.textTheme?.headline5,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            validator: controller.emailError,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) => controller.authDto
                                .update((val) => val?.identifier = value),
                            decoration: InputDecoration(
                              labelText: 'E-mail',
                              hintText: 'voce@exemplo.com',
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            validator: controller.passwordError,
                            onChanged: (value) => controller.authDto
                                .update((val) => val?.password = value),
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {},
                            child: Text('Esqueceu sua senha?'),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed:
                                controller.authDto.value.isValid == true &&
                                        !controller.isLoading.value
                                    ? controller.onLogin
                                    : null,
                            child: controller.isLoading.value
                                ? CircularProgressIndicator()
                                : Text('Entrar'),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {},
                            child: Text('Ainda não tem conta? Cadastre-se'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
