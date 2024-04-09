import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_wanandroid2/core/res/styles/colors.dart';
import 'package:flutter_wanandroid2/core/utils/core_utils.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/auth/presentation/app/riverpod/auth_provider.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final TextEditingController unameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();
  final TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();
  final ScrollController scrollController = ScrollController();
  final lastFocusNode = FocusNode();

  final GlobalKey _formKey = GlobalKey<FormState>();
  final obscurePasswordNotifier = ValueNotifier(true);
  final obscurePasswordAgainNotifier = ValueNotifier(true);

  /// StatefulBuilder compares with ValueListenableBuilder
  /// do not need to dispose the notifier, but can only update widget in builder
  var obscureTextAgain = true;

  @override
  void initState() {
    super.initState();
    tapGestureRecognizer.onTap = () {
      context.replace("/login");
    };
    lastFocusNode.addListener(() {
      if (lastFocusNode.hasFocus) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    unameController.dispose();
    passwordController.dispose();
    passwordAgainController.dispose();
    obscurePasswordNotifier.dispose();
    obscurePasswordAgainNotifier.dispose();
    tapGestureRecognizer.dispose();
    lastFocusNode.dispose();
    scrollController.dispose();
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
      } else if (next is Registered) {
        CoreUtils.postFrameCall(() => context.go('/', extra: 'home'));
      }
    });

    return SingleChildScrollView(
        controller: scrollController,
        child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
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
                            autofocus: true,
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
                                  obscurePasswordNotifier.value = !value;
                                },
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) {
                                return l10n.tips_pwd_empty;
                              }
                              return null;
                            },
                          );
                        }),
                    StatefulBuilder(builder: (context, setInnerState) {
                      return TextFormField(
                        focusNode: lastFocusNode,
                        autofocus: true,
                        obscureText: obscureTextAgain,
                        controller: passwordAgainController,
                        decoration: InputDecoration(
                          hintText: l10n.register_confirm_pwd,
                          icon: const Icon(Icons.lock),
                          suffix: IconButton(
                            icon: Icon(obscureTextAgain
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setInnerState(() {
                                obscureTextAgain = !obscureTextAgain;
                              });
                            },
                          ),
                        ),
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return l10n.tips_pwd_confirm_empty;
                          }
                          return null;
                        },
                      );
                    }),
                    // ValueListenableBuilder(
                    //     valueListenable: obscurePasswordAgainNotifier,
                    //     builder: (_, value, __) {
                    //       return TextFormField(
                    //         focusNode: lastFocusNode,
                    //         autofocus: true,
                    //         obscureText: value,
                    //         controller: passwordAgainController,
                    //         decoration: InputDecoration(
                    //           //labelText: l10n.register_confirm_pwd,
                    //           hintText: l10n.register_confirm_pwd,
                    //           icon: const Icon(Icons.lock),
                    //           suffix: IconButton(
                    //             icon: Icon(value
                    //                                     ? Icons.visibility_off
                    //                                     : Icons.visibility),
                    //             onPressed: () {
                    //               obscurePasswordAgainNotifier.value = !value;
                    //             },
                    //           ),
                    //         ),
                    //         validator: (v) {
                    //           if (v == null || v.trim().isEmpty) {
                    //             return l10n.tips_pwd_confirm_empty;
                    //           }
                    //           return null;
                    //         },
                    //       );
                    //     }),
                    Gap(60.w),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: SizedBox(
                          height: 100.w,
                          child: FilledButton(
                              onPressed: authState is AuthLoading
                                  ? null
                                  : () {
                                      if ((_formKey.currentState as FormState)
                                          .validate()) {
                                        ref
                                            .read(authProvider().notifier)
                                            .register(
                                                username: unameController.text,
                                                password:
                                                    passwordController.text,
                                                repassword:
                                                    passwordAgainController
                                                        .text);
                                      }
                                    },
                              child: authState is AuthLoading
                                  ? const CircularProgressIndicator()
                                  : Text(l10n.register))),
                    ),
                    Gap(40.w),
                    RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 28.w, color: Colours.TEXT_LIGHT),
                          children: [
                            TextSpan(text: l10n.register_to_login),
                            TextSpan(
                                text: l10n.login,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                                recognizer: tapGestureRecognizer)
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ))));
  }
}
