import 'package:app/core/models/validation.model.dart';
import 'package:app/pages/signup/controllers/signup.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child:
                    Text('Informações básicas', style: Get.textTheme?.caption),
              ),
              ObxValue<Rx<ValidationModel?>>(
                (state) => TextFormField(
                  onChanged: (v) =>
                      controller.userDto.update((val) => val?.firstName = v),
                  decoration: InputDecoration(
                    labelText: 'Primeiro nome',
                    errorText: state.value?.getFirstError('firstName'),
                  ),
                ),
                controller.errors,
              ),
              SizedBox(height: 10),
              ObxValue<Rx<ValidationModel?>>(
                (state) => TextFormField(
                  onChanged: (v) =>
                      controller.userDto.update((val) => val?.lastName = v),
                  decoration: InputDecoration(
                    labelText: 'Ultimo nome',
                    errorText: state.value?.getFirstError('lastName'),
                  ),
                ),
                controller.errors,
              ),
              SizedBox(height: 10),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Autenticação', style: Get.textTheme?.caption),
              ),
              ObxValue<Rx<ValidationModel?>>(
                (state) => TextFormField(
                  onChanged: (v) =>
                      controller.userDto.update((val) => val?.email = v),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    errorText: state.value?.getFirstError('email'),
                  ),
                ),
                controller.errors,
              ),
              SizedBox(height: 10),
              ObxValue<Rx<ValidationModel?>>(
                (state) => TextFormField(
                  obscureText: controller.obscureText.value,
                  onChanged: (v) =>
                      controller.userDto.update((val) => val?.password = v),
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    errorText: state.value?.getFirstError('password'),
                    suffixIcon: IconButton(
                      icon: Icon(controller.obscureText.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: controller.changePasswordVisibility,
                    ),
                  ),
                ),
                controller.errors,
              ),
              SizedBox(height: 10),
              Obx(
                () => ElevatedButton(
                  onPressed:
                      controller.isLoading.value ? null : controller.onSignup,
                  child: controller.isLoading.value
                      ? CircularProgressIndicator()
                      : Text('Cadastrar-se'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
