import 'package:app/pages/signup/controllers/confirm.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmPage extends GetView<ConfirmController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  controller.email ?? '',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Digite o código que enviamos no seu e-mail',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodyText1,
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: PinCodeTextField(
                    appContext: context,
                    keyboardType: TextInputType.number,
                    dialogConfig: DialogConfig(
                      dialogTitle: 'Colar Código',
                      affirmativeText: 'Colar',
                      negativeText: 'Cancelar',
                      dialogContent: 'Deseja colar esse código: ',
                    ),
                    length: 4,
                    onChanged: (data) {},
                    onCompleted: (data) => controller.code.value = data,
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: controller.onConfirm,
                  child: Text('Confirmar'),
                ),
                SizedBox(height: 8),
                OutlinedButton(
                  onPressed: controller.onResend,
                  child: Text('Reenviar código'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
