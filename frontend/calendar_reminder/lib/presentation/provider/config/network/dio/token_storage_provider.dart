import 'package:calendar_reminder/core/network/tokens_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenStorageProvider = Provider<TokensStorage>((ref) {
  return TokensStorage();
});
