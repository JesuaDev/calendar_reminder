import 'package:calendar_reminder/infraestructure/dtos/user/login_dtos.dart';
import 'package:calendar_reminder/presentation/provider/features/auth/data/notifier/forms/auth_form_notifier.dart';
import 'package:calendar_reminder/presentation/provider/features/auth/data/notifier/response/auth_response_notifier.dart';
import 'package:calendar_reminder/presentation/screens/screens.dart';
import 'package:calendar_reminder/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:hugeicons/hugeicons.dart';

import 'package:calendar_reminder/core/theme/app_theme.dart';
import 'package:calendar_reminder/core/extensions/extensions.dart';
import 'package:uuid/uuid.dart';

class LoginScreen extends StatelessWidget {
  static const namePage = 'login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ContentLogin());
  }
}

class ContentLogin extends ConsumerStatefulWidget {
  const ContentLogin({super.key});

  @override
  ConsumerState<ContentLogin> createState() => _ContentLoginState();
}

class _ContentLoginState extends ConsumerState<ContentLogin> {
  bool isSlide = false;

  late final TextEditingController controllerUser;
  late final TextEditingController controllerPassword;

  @override
  void initState() {
    controllerUser = TextEditingController();
    controllerPassword = TextEditingController();
    super.initState();

    Future.microtask(() {
      ref.read(authResponseNotifier.notifier).verifyToken();
    });
  }

  @override
  void dispose() {
    controllerUser.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? inputTextUser = ref.watch(authFormNotifier).userInput;
    final String? inputTextPassword = ref.watch(authFormNotifier).passwordInput;
    final Uuid uuid = Uuid();
    final authProvider = ref.watch(authResponseNotifier);
    ref.listen(authResponseNotifier, (previus, next) {
      if (next.statusCode == 200) {
        context.pushNamed(HomeScreen.namePage);
      }
    });

    return authProvider.isLoading!
        ? LoadingPage()
        : Stack(
            children: [
              SizedBox.expand(
                child: Image.asset(
                  "assets/images/ellayyo/116989.webp",
                  fit: BoxFit.cover,
                ),
              ),

              if (!isSlide)
                ContentPresentationLogin(
                  onSlide: () {
                    setState(() {
                      isSlide = true;
                    });
                  },
                ),

              Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: ContentFormLogin(
                  controllerUser: controllerUser,
                  controllerPassword: controllerPassword,
                  isSlide: isSlide,
                  onChangedEmail: ref
                      .read(authFormNotifier.notifier)
                      .addInputUser,
                  onChangedPassword: ref
                      .read(authFormNotifier.notifier)
                      .addInputPassword,
                  onSubmit: () => {
                    if (!(inputTextUser != null) ||
                        !(inputTextPassword != null))
                      {},

                    ref
                        .read(authResponseNotifier.notifier)
                        .authResponse(
                          LoginDtos(
                            user: inputTextUser!,
                            password: inputTextPassword!,
                            uuid: uuid.v4(),
                          ),
                        ),
                  },
                ),
              ),
            ],
          );
  }
}

class ContentFormLogin extends StatelessWidget {
  const ContentFormLogin({
    super.key,
    required this.isSlide,
    required this.onChangedEmail,
    required this.onChangedPassword,
    required this.onSubmit,
    required this.controllerUser,
    required this.controllerPassword,
  });

  final bool isSlide;

  final ValueChanged<String> onChangedEmail;
  final ValueChanged<String> onChangedPassword;
  final VoidCallback onSubmit;

  final TextEditingController controllerUser;
  final TextEditingController controllerPassword;

  @override
  Widget build(BuildContext context) {
    final Color colorSurface = AppTheme.colorLigSurface;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      height: isSlide ? context.sizeH * .70 : 0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.themeColor.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),

      child: isSlide
          ? Stack(
              clipBehavior: Clip.none,
              children: [
                LogLetterLogin(
                  colorSurface: colorSurface,
                  textStyle: context.textTheme.titleLarge?.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 8
                      ..color = colorSurface,
                  ),
                ),

                // Relleno verde oscuro
                LogLetterLogin(
                  colorSurface: colorSurface,
                  textStyle: context.textTheme.titleLarge?.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: context.themeColor.surface,
                  ),
                ),

                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsetsGeometry.only(
                      top: 80,
                      left: 20,
                      right: 20,
                      bottom: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContentWelcome(),
                        SizedBox(height: 30),
                        Text("Usuario", style: context.textTheme.bodyLarge),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controllerUser,
                          onChanged: onChangedEmail,
                          decoration: InputDecoration(
                            fillColor: context.themeColor.onSecondary,
                          ),
                        ),

                        SizedBox(height: 20),
                        Text("Contraseña", style: context.textTheme.bodyLarge),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controllerPassword,
                          onChanged: onChangedPassword,

                          decoration: InputDecoration(
                            fillColor: context.themeColor.onSecondary,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: context.sizeW,
                          child: Text(
                            "¿Olvido la contraseña?",
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: context.themeColor.secondary,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        SizedBox(height: 40),
                        ActionButton(
                          colorSurface: colorSurface,
                          onAction: onSubmit,
                          hint: "Iniciar sesión",
                          backgroundColor: context.themeColor.secondary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : SizedBox.shrink(),
    );
  }
}

class ContentWelcome extends StatelessWidget {
  const ContentWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Bienvenida!, Te Quiero\n",
              style: context.textTheme.titleLarge?.copyWith(fontSize: 22),
            ),
            TextSpan(text: "\n"),

            TextSpan(
              text:
                  "Está es mi forma de decirte lo mucho que me importas, y lo mucho que te quiero, espero te guste mi amor.",
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.themeColor.onSurface.withValues(alpha: .4),
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class LogLetterLogin extends StatelessWidget {
  const LogLetterLogin({
    super.key,
    required this.colorSurface,
    required this.textStyle,
  });

  final Color colorSurface;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -20,
      right: 0,
      left: 0,
      child: Text(
        "RAPPEL D’AMOUR".toUpperCase(),
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ContentPresentationLogin extends StatelessWidget {
  final VoidCallback onSlide;

  const ContentPresentationLogin({super.key, required this.onSlide});

  @override
  Widget build(BuildContext context) {
    final Color colorSurface = AppTheme.colorLigSurface;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 40, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'BELLE.\n'),
                TextSpan(text: 'DOUCE.\n'),
                TextSpan(text: 'INCROYABLE.'),
              ],
            ),

            style: context.textTheme.displayLarge?.copyWith(
              color: colorSurface,
            ),
          ),

          Text(
            'Login to connect with the comunity. schedule matches, and enjoy sports together.',
            style: context.textTheme.bodyMedium?.copyWith(
              color: colorSurface.withValues(alpha: .5),
            ),

            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20),

          ActionButton(
            colorSurface: colorSurface,
            onAction: onSlide,
            icon: HugeIcons.strokeRoundedUser,
            hint: "Iniciar sesión con usuario",
            backgroundColor: context.themeColor.surface,
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.colorSurface,
    required this.onAction,
    required this.hint,
    this.icon,
    required this.backgroundColor,
  });
  final String hint;
  final Color colorSurface;
  final Color backgroundColor;
  final dynamic icon;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onAction,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: backgroundColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) HugeIcon(icon: icon),

            SizedBox(width: 10),
            Text(hint, style: context.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
