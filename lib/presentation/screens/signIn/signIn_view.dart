import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/widgets/components/change_language.dart';
import 'package:food_delivery/presentation/widgets/components/general_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help,
              color: Colors.black,
            ),
          ),
          ChangeLanguage(onClick: (locale) {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12.0),
            const Text(
              'Đăng nhập ứng dụng',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Đăng nhập hoặc tạo tài khoản chỉ với vài bước đơn giản',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Số điện thoại',
                hintText: 'Nhập số điện thoại của bạn',
                suffixIcon: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 12.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            GeneralButton(
                content: 'Tiếp tục',
                backgroundColor: Colors.green.shade700,
                textColor: Colors.white,
                onClick: () async {

                }),
            const SizedBox(height: 12.0),
            RichText(
                text: TextSpan(
                    text: 'footer.signIn'.tr(),
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: [
                  TextSpan(
                      text: 'term_of_service.signIn'.tr(),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.teal,
                        decoration: TextDecoration.underline,
                      )),
                  TextSpan(
                      text: 'and.signIn'.tr(),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      )),
                  TextSpan(
                      text: 'privacy_policy.signIn'.tr(),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.teal,
                        decoration: TextDecoration.underline,
                      ))
                ])),
          ],
        ),
      ),
    );
  }
}
