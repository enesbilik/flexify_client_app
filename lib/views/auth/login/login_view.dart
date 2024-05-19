import 'package:flexify_client_app/cache/cache_manager.dart';
import 'package:flexify_client_app/mixin/validation/auth_validation.dart';
import 'package:flexify_client_app/services/auth_service.dart';
import 'package:flexify_client_app/views/auth/register/register_view.dart';
import 'package:flexify_client_app/views/main/main_view.dart';
import 'package:flexify_client_app/widgets/auth_text_field.dart';
import 'package:flexify_client_app/widgets/custom_button.dart';
import 'package:flexify_client_app/widgets/custom_lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with AuthValidation {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
                _title("Giriş Yap"),
                const SizedBox(height: 10),
                AuthTextField(
                  controller: emailController,
                  labelText: 'Email',
                  hintText: 'örnek@gmail.com',
                  iconData: Icons.email,
                  validator: validateEmail,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                AuthTextField(
                  controller: passwordController,
                  obscureText: true,
                  labelText: 'Şifre',
                  hintText: '******',
                  iconData: Icons.lock,
                  validator: validatePassword,
                ),
                const SizedBox(height: 10),
                _buildForgotButton(context),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    text: "Giriş Yap",
                    onPressed: () => _handleLogin(context),
                  ),
                ),
                const SizedBox(height: 10),
                _buildRegisterButton(context),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildRegisterButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hesabın yok mu?",
          style: TextStyle(color: Colors.grey.shade600),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterView()));
          },
          child: const Text("Kayıt ol!"),
        ),
      ],
    );
  }

  Align _buildForgotButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const ForgotPasswordView()));
        },
        child: const Text(
          "Şifremi unuttum?",
        ),
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final AuthService authService = AuthService();
      var response = await authService.login(
          emailController.text, passwordController.text);

      if (response != null && response.statusCode == 200) {
        CacheManager().setApiKey(response?.data['accessToken']);
        Get.offAll(() => const MainView());
      } else {
        Get.snackbar("Giriş Başarısız", response?.data['detail'] ?? "");
      }
    }
  }

  Widget _title(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
