import 'package:flutter/material.dart';
import 'package:mask_inventory_app/ui/widget/remain_stat_list_tile.dart';
import 'package:mask_inventory_app/viewmodel/store_model.dart';
import 'package:provider/provider.dart';

import '../../data/model/store.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storeModel = Provider.of<StoreModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const FlutterLogo(),
        title: Text(
          '마스크 재고 있는 곳 : ${storeModel.stores.length}곳',
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
        child: storeModel.isLoading == true
            ? loadingWidget()
            : ListView.builder(
                itemCount: storeModel.stores.length,
                itemBuilder: (BuildContext context, int index) {
                  final Store store = storeModel.stores[index];

                  return ListTile(
                    title: Text(store.name),
                    subtitle: Text(store.addr),
                    trailing: RemainStatListTile(store: store),
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
}

