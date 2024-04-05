import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/res/styles/colors.dart';
import 'package:flutter_wanandroid2/core/utils/core_utils.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/auth/presentation/app/riverpod/auth_provider.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final TextEditingController unameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();

  final GlobalKey formKey = GlobalKey<FormState>();
  final obscurePasswordNotifier = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    tapGestureRecognizer.onTap = () {
      context.replace("/register");
    };
  }

  @override
  void dispose() {
    unameController.dispose();
    passwordController.dispose();
    obscurePasswordNotifier.dispose();
    tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final authState = ref.watch(authProvider());
    ref.listen(authProvider(), (_, next) {
      //处理失败和成功
      if (next is AuthError) {
        if (!mounted) return;
        final AuthError(:message) = next;
        CoreUtils.showSnackBar(
          context,
          message: message,
        );
      } else if (next is LoggedIn) {
        CoreUtils.postFrameCall(() => context.go('/', extra: 'home'));
      }
    });

    return Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
            padding: EdgeInsets.all(60.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(40.w),
                TextFormField(
                  autofocus: true,
                  controller: unameController,
                  decoration: InputDecoration(
                      //labelText: l10n.login_userName,
                      hintText: l10n.login_userName,
                      icon: const Icon(Icons.person)),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return l10n.tips_username_empty;
                    }
                    return null;
                  },
                ),
                ValueListenableBuilder(
                    valueListenable: obscurePasswordNotifier,
                    builder: (_, value, __) {
                      return TextFormField(
                        obscureText: value,
                        controller: passwordController,
                        decoration: InputDecoration(
                          //labelText: l10n.login_pwd,
                          hintText: l10n.login_pwd,
                          icon: const Icon(Icons.lock),
                          suffix: IconButton(
                            icon: Icon(value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              obscurePasswordNotifier.value =
                                  !obscurePasswordNotifier.value;
                            },
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return l10n.tips_pwd_empty;
                          }
                          return null;
                        },
                      );
                    }),
                Gap(80.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: SizedBox(
                      height: 100.w,
                      child: FilledButton(
                          onPressed: authState is AuthLoading
                              ? null
                              : () {
                                  if ((formKey.currentState as FormState)
                                      .validate()) {
                                    ref.read(authProvider().notifier).login(
                                        username: unameController.text,
                                        password: passwordController.text);
                                  }
                                },
                          child: authState is AuthLoading
                              ? const CircularProgressIndicator()
                              : Text(l10n.login))),
                ),
                Gap(40.w),
                RichText(
                  text: TextSpan(
                      style:
                          TextStyle(fontSize: 28.w, color: Colours.TEXT_LIGHT),
                      children: [
                        TextSpan(text: l10n.login_to_register),
                        TextSpan(
                            text: l10n.register,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                            recognizer: tapGestureRecognizer)
                      ]),
                  textAlign: TextAlign.center,
                ),
              ],
            )));
  }
}
