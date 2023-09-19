import 'package:uni_store/models/store_item/store_item.dart';

class SavedCode {
  final String code;
  final int validTill;
  final StoreItem storeItem;
  final StoreVariety variety;

  SavedCode({
    required this.code,
    required this.validTill,
    required this.storeItem,
    required this.variety,
  });
}
