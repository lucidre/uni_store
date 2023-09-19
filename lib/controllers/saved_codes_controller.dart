import 'package:uni_store/models/saved_codes/saved_codes.dart';

class SavedCodesController {
  static SavedCodesController? _instance;

  SavedCodesController._();

  factory SavedCodesController() {
    _instance ??= SavedCodesController._();
    return _instance!;
  }

  final List<SavedCode> _savedCodes = [];

  int get itemCount => _savedCodes.length;

  void saveCode(SavedCode savedCode) {
    final itemDuplicate =
        _savedCodes.where((element) => element.code == savedCode.code);

    if (itemDuplicate.isNotEmpty) return;
    _savedCodes.insert(0, savedCode);
  }

  List<SavedCode> get savedCodes => _savedCodes;
}
