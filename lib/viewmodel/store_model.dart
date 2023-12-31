import 'package:flutter/foundation.dart';
import 'package:mask_inventory_app/data/repository/location_repository.dart';
import 'package:mask_inventory_app/data/repository/mask_store_repository.dart';
import 'package:geolocator/geolocator.dart';

import '../data/model/store.dart';

class StoreModel with ChangeNotifier {
  List<Store> stores = [];
  bool isLoading = false;
  final MaskStoreRepository _repository = MaskStoreRepository();
  final _locationRepository = LocationRepository();

  // StoreModel(){
  //   fetch();
  // }
  Future fetch() async {
    isLoading = true;
    notifyListeners();

    Position position = await _locationRepository.getCurrentLocation();

    stores = await _repository.getStoreList(
      lat: position.latitude,
      lng: position.longitude,
    );
    isLoading = false;
    notifyListeners();
  }
}
