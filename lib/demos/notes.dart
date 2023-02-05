import 'package:first_project/101/image_view.dart';
import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);
  final String title = 'Create your first note';
  final String description = 'Add note heree. ';
  final String _createNote = 'Create a note';
  final String _importNotes = 'Import Notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(),
      body: Padding(
        padding: NotePaddings.horizontalPadding,
        child: Column(
          children: [
            PngImageView(
              name: ImageItems().appleWithBookName,
              height: 200,
            ),
            _TitleView(title: title),
            Padding(
              padding: NotePaddings.verticalPadding,
              child: _SubtitleView(
                text: description * 10,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            ElevatedButton(onPressed: () {}, child: SizedBox(height: 50, child: Center(child: Text(_createNote)))),
            TextButton(onPressed: () {}, child: Text(_importNotes)),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

class _SubtitleView extends StatelessWidget {
  const _SubtitleView({Key? key, required this.text, this.textAlign = TextAlign.center}) : super(key: key);

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}

class _TitleView extends StatelessWidget {
  const _TitleView({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black, fontWeight: FontWeight.w800),
    );
  }
}

class NotePaddings {
  static EdgeInsets horizontalPadding = const EdgeInsets.symmetric(horizontal: 20);
  static EdgeInsets verticalPadding = const EdgeInsets.symmetric(vertical: 10);
}
