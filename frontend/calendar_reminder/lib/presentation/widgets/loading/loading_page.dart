import 'package:animate_do/animate_do.dart';
import 'package:calendar_reminder/core/theme/images_loading.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late final Stream<int> stream;

  @override
  void initState() {
    super.initState();

    stream = Stream.periodic(const Duration(milliseconds: 300), (count) {
      return count % ImagesLoading.imagesLoad.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: stream,
      builder: (context, snapshot) {
        final indexNow = snapshot.data ?? 0;
        final figure = ImagesLoading.imagesLoad[indexNow];

        return Center(
          child: SizedBox(
            width: 60,
            child: ZoomIn(
              duration: const Duration(milliseconds: 600),
              key: ValueKey(figure),
              child: Image.asset(figure, fit: BoxFit.contain),
            ),
          ),
        );
      },
    );
  }
}
