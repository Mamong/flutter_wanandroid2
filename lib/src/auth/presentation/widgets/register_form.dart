import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/core/utils/core_utils.dart';
import 'package:flutter_wanandroid2/src/auth/presentation/app/riverpod/auth_provider.dart';
import 'package:go_router/go_router.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => RegisterFormState();
}

class RegisterFormState extends ConsumerState<RegisterForm> {
  final TextEditingController unameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();
  final obscurePasswordNotifier = ValueNotifier(true);
  final obscurePasswordAgainNotifier = ValueNotifier(true);

  @override
  void dispose() {
    super.dispose();
    unameController.dispose();
    passwordController.dispose();
    passwordAgainController.dispose();
    obscurePasswordNotifier.dispose();
    obscurePasswordAgainNotifier.dispose();
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
      } else if (next is Registered) {
        CoreUtils.postFrameCall(() => context.go('/', extra: 'home'));
      }
    });

    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
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
                return v!.trim().isNotEmpty ? null : '用户名不能为空';
              },
            ),
            ValueListenableBuilder(
                valueListenable: obscurePasswordNotifier,
                builder: (_, value, __) {
                  return TextFormField(
                    autofocus: true,
                    obscureText: value,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "输入密码",
                      icon: const Icon(Icons.lock),
                      suffix: IconButton(
                        icon: const Icon(Icons.remove_red_eye),
                        onPressed: () {
                          obscurePasswordNotifier.value = !value;
                        },
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return '密码不能为空';
                      return null;
                    },
                  );
                }),
            ValueListenableBuilder(
                valueListenable: obscurePasswordAgainNotifier,
                builder: (_, value, __) {
                  return TextFormField(
                    autofocus: true,
                    obscureText: value,
                    controller: passwordAgainController,
                    decoration: InputDecoration(
                      labelText: "确认密码",
                      hintText: "再次输入密码",
                      icon: const Icon(Icons.lock),
                      suffix: IconButton(
                        icon: const Icon(Icons.remove_red_eye),
                        onPressed: () {
                          obscurePasswordAgainNotifier.value = !value;
                        },
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return '密码不能为空';
                      return null;
                    },
                  );
                }),
            ElevatedButton(
                onPressed: authState is AuthLoading
                    ? null
                    : () {
                        if ((_formKey.currentState as FormState).validate()) {
                          ref.read(authProvider().notifier).register(
                              username: unameController.text,
                              password: passwordController.text,
                              repassword: passwordAgainController.text);
                        }
                      },
                child: authState is AuthLoading
                    ? const CircularProgressIndicator()
                    : const Text('注册')),
          ],
        ));
  }
}
