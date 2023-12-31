import 'package:flutter/foundation.dart';
import 'package:mask_inventory_app/data/repository/mask_store_repository.dart';

import '../data/model/store.dart';

class StoreModel with ChangeNotifier {
  List<Store> stores = [];
  final MaskStoreRepository _repository = MaskStoreRepository();

  StoreModel(){
    fetch();
  }
  Future fetch() async {
    stores = await _repository.getStoreList();
    notifyListeners();
  }
}
