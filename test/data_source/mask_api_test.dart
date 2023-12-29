import 'package:flutter_test/flutter_test.dart';
import 'package:mask_inventory_app/data/data_source/mask_api.dart';
import 'package:mask_inventory_app/data/dto/mask_dto.dart';

void main() {
  test('mask api의 데이터가 dto에 전달되는지 테스트', () async {
    final MaskApi api = MaskApi();
    MaskDto dto = await api.getMaskResult();
    expect(dto, isNotNull);
    expect(dto.stores, isNotNull);
  });
}
