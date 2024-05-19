import 'package:flexify_client_app/mixin/validation/auth_validation.dart';
import 'package:flexify_client_app/services/auth_service.dart';
import 'package:flexify_client_app/views/auth/login/login_view.dart';
import 'package:flexify_client_app/widgets/auth_text_field.dart';
import 'package:flexify_client_app/widgets/custom_button.dart';
import 'package:flexify_client_app/widgets/custom_lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with AuthValidation {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const CustomLottie(
                    lottiePath: "assets/lotties/login_lottie.json"),
                const SizedBox(height: 10),
                _title(),
                const SizedBox(height: 10),
                AuthTextField(
                  controller: _nameController,
                  labelText: 'Ad',
                  hintText: '',
                  iconData: Icons.person,
                  validator: validateName,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                AuthTextField(
                  controller: _surNameController,
                  labelText: 'Soyad',
                  hintText: '',
                  iconData: Icons.person,
                  validator: validateSurName,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                AuthTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  hintText: 'örnek@gmail.com',
                  iconData: Icons.email,
                  validator: validateEmail,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                AuthTextField(
                  controller: _passwordController,
                  obscureText: true,
                  labelText: 'Şifre',
                  hintText: '******',
                  iconData: Icons.lock,
                  validator: validatePassword,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                AuthTextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  labelText: 'Şifre Tekrar',
                  hintText: '******',
                  iconData: Icons.lock,
                  validator: (confirmValue) => validateConfirmPassword(
                      confirmValue, _passwordController.text),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                      text: "Kayıt Ol",
                      onPressed: () => _handleSignUp(context)),
                ),
                const SizedBox(height: 10),
                _buildLoginButton(context),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _title() {
    return const Text(
      "Kayıt Ol",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Row _buildLoginButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Zaten hesabınız var mı?",
          style: TextStyle(color: Colors.grey.shade600),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Giriş Yap"),
        ),
      ],
    );
  }

  void _handleSignUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final AuthService authService = AuthService();
      final response = await authService.register(
        _emailController.text,
        _passwordController.text,
        _confirmPasswordController.text,
        _nameController.text,
        _surNameController.text,
      );

      if (response != null && response.statusCode == 201) {
        Get.offAll(() => const LoginView());
        Get.snackbar("Kayıt Başarılı", "Giriş yapabilirsiniz.");
      } else {
        Get.snackbar("Kayıt Başarısız", response?.data['detail'] ?? "");
      }
    }
  }
}
