import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mask_inventory_app/viewmodel/store_model.dart';
import 'package:provider/provider.dart';

import '../data/model/store.dart';
import '../data/repository/mask_store_repository.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // List<Store> storeList = [];
  // final MaskStoreRepository repository = MaskStoreRepository();
  bool isLoading = false;

  final storeModel = StoreModel();

  @override
  void initState() {
    super.initState();
    // maskStoreList();
  }

  // Future<void> maskStoreList() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   storeList = await repository.getStoreList();
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final storeModel = Provider.of<StoreModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const FlutterLogo(),
        title: Text(
          '마스크 재고 있는 곳 : ${storeModel.stores}곳',
          style: const TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                storeModel.fetch();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: isLoading
            ? loadingWidget()
            : ListView.builder(
                itemCount: storeModel.stores.length,
                itemBuilder: (BuildContext context, int index) {
                  // print(storeList.toString());
                  final Store store = storeModel.stores[index];
                  // print('재고 수량 : ${store.remainStat}');

                  return ListTile(
                    title: Text(store.name),
                    subtitle: Text(store.addr),
                    trailing: _buildRemainStatWidget(store: store),
                  );
                },
              ),
      ),
    );
  }

  Widget loadingWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('정보를 가져오는 중'),
          SizedBox(
            height: 24,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget _buildRemainStatWidget({required Store store}) {
    String remainStat = '판매중지';
    String description = '판매중지';
    Color color = Colors.black;
    switch (store.remainStat) {
      case 'plenty':
        remainStat = '충분';
        description = '100개 이상';
        color = Colors.green;
        break;
      case 'some':
        remainStat = '보통';
        description = '30 ~ 100개';
        color = Colors.yellow;
        break;
      case 'few':
        remainStat = '부족';
        description = '2 ~ 30개';
        color = Colors.red;
        break;
      case 'empty':
        remainStat = '소진 임박';
        description = '1개 이상';
        color = Colors.grey;
        break;
      default:
    }
    return Column(
      children: [
        Text(
          remainStat,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        Text(
          description,
        ),
      ],
    );
  }
}
