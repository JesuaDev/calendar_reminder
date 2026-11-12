import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:calendar_reminder/core/extensions/extensions.dart';
import 'package:calendar_reminder/helpers/format/date/format_date.dart';
import 'package:calendar_reminder/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const namePage = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ContentPage());
  }
}

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(top: 50, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Shortcuts(),
              SizedBox(height: 50),
              ContentDate(),
            ],
          ),
        ),

        SizedBox(height: 20),
        Expanded(child: ContentTaskToday()),
      ],
    );
  }
}

class ContentTaskToday extends StatelessWidget {
  const ContentTaskToday({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,

      decoration: BoxDecoration(
        color: context.themeColor.tertiary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 10),
            child: Row(
              children: [
                Text("Tareas/hoy", style: context.textTheme.bodyLarge),
                Spacer(),
                CustomButton(hint: "Recordatorios"),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 225,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                  decoration: BoxDecoration(
                    color: Color(0xFF674188).withValues(alpha: .5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          "You Have A Meeting",
                          style: context.textTheme.displaySmall?.copyWith(
                            color: Color(0xFF674188),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextHourTask(hour: "8:55 pm", hint: "Inicio"),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 20,
                            ),

                            decoration: BoxDecoration(
                              color: Color(0xFF674188),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "5 min.",
                              style: context.textTheme.bodyLarge?.copyWith(
                                color: context.themeColor.tertiary,
                              ),
                            ),
                          ),
                          TextHourTask(hour: "9:00 pm", hint: "Fin"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextHourTask extends StatelessWidget {
  final String hour;
  final String hint;
  const TextHourTask({super.key, required this.hour, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "$hour \n",
            style: context.textTheme.bodyLarge?.copyWith(
              color: Color(0xFF674188),
              fontWeight: FontWeight.w800,
              fontSize: 22,
            ),
          ),
          TextSpan(
            text: hint,
            style: context.textTheme.bodyLarge?.copyWith(
              color: Color(0xFF674188),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class Shortcuts extends StatelessWidget {
  const Shortcuts({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(isFilled: true, hint: "Hoy"),
        SizedBox(width: 10),
        CustomButton(hint: "Calendario"),

        Spacer(),
        CustomIconButton(icon: HugeIcons.strokeRoundedAdd01),
      ],
    );
  }
}

class ContentDate extends StatefulWidget {
  const ContentDate({super.key});

  @override
  State<ContentDate> createState() => _ContentDateState();
}

class _ContentDateState extends State<ContentDate> {
  late Timer _timer;
  String timeFormat = FormatDate.formatHour();

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic((const Duration(seconds: 30)), (timer) {
      updateFormat();
    });
  }

  void updateFormat() {
    String formatHour = FormatDate.formatHour();

    setState(() {
      timeFormat = formatHour;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(FormatDate.formatDay(), style: context.textTheme.titleLarge),
        SizedBox(height: 2),
        Text(
          timeFormat,
          style: context.textTheme.displayLarge?.copyWith(fontSize: 80),
        ),

        Text(
          FormatDate.formatMonth().toUpperCase(),
          style: context.textTheme.displayLarge?.copyWith(
            fontSize: 80,
            letterSpacing: 5,
          ),
        ),
      ],
    );
  }
}
