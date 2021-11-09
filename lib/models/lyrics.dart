import 'package:flutter/foundation.dart';

class Lyric extends ChangeNotifier {
  final int priority;
  final String startTime;
  final String endTime;
  final String lyricString;

  Lyric(
    this.priority,
    this.startTime,
    this.endTime,
    this.lyricString,
  );
}
