import 'package:flutter/material.dart';

import '../data/model/store.dart';
import '../data/repository/mask_store_repository.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Store> storeList = [];
  final MaskStoreRepository repository = MaskStoreRepository();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    maskStoreList();
  }

  Future<void> maskStoreList() async {
    setState(() {
      isLoading = true;
    });
    storeList = await repository.getStoreList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const FlutterLogo(),
        title: Text(
          '마스크 재고 있는 곳 : ${storeList.length}곳',
          style: const TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  storeList.clear();

                  maskStoreList();
                  print('새로고침');
                });
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: isLoading
            ? loadingWidget()
            : ListView.builder(
          itemCount: storeList.length,
          itemBuilder: (BuildContext context, int index) {
            // print(storeList.toString());
            final Store store = storeList[index];
            // print('재고 수량 : ${store.remainStat}');

            return ListTile(
              title: Text(store.name),
              subtitle: Text(store.addr),
              trailing: Text(store.remainStat),
            );
          },
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('정보를 가져오는 중'),
          SizedBox(height: 24,),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
