enum Level {
  easy,
  medium,
  hard,
  expert,
}

const _levelList = {
  'easy': Level.easy,
  'medium': Level.medium,
  'hard': Level.hard,
  'expert': Level.expert,
};

getLevel(dynamic level) => level is String
    ? _levelList[level]
    : _levelList.map((key, value) => MapEntry(value, key))[level];
