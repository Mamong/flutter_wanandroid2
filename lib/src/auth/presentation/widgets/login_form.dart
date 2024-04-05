import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/core/utils/core_utils.dart';
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

  final GlobalKey formKey = GlobalKey<FormState>();
  final obscurePasswordNotifier = ValueNotifier(true);

  @override
  void dispose() {
    super.dispose();
    unameController.dispose();
    passwordController.dispose();
    obscurePasswordNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  controller: unameController,
                  decoration: const InputDecoration(
                      labelText: "用户名",
                      hintText: "输入用户名",
                      icon: Icon(Icons.person)),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return '用户名不能为空';
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
                          labelText: "密码",
                          hintText: "输入密码",
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
                          if (v == null || v.trim().isEmpty) return '密码不能为空';
                          return null;
                        },
                      );
                    }),
                const Gap(20),
                ElevatedButton(
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
                        : const Text('登录')),
              ],
            )));
  }
}
