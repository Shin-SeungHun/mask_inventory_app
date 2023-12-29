import 'package:flutter_test/flutter_test.dart';
import 'package:mask_inventory_app/data/dto/mask_dto.dart';
import 'package:mask_inventory_app/data/mapper/store_mapper.dart';
import 'package:mask_inventory_app/data/model/store.dart';

void main() {
  test('mapper가 model에 데이터를 잘 전달하는지 테스트', () async {
    Stores stores = Stores(
      addr: '서울특별시 강북구 솔매로 38 (미아동)',
      code: '11817488',
      createdAt: '2020/07/03 11:00:00',
      lat: 37.6254369,
      lng: 127.0164096,
      name: '승약국',
      remainStat: 'plenty',
      stockAt: '2020/07/02 18:05:00',
      type: '01',
    );

    Store store = stores.toStore();

    expect(store.addr, '서울특별시 강북구 솔매로 38 (미아동)');
    expect(store.name, '승약국');
  });
}
