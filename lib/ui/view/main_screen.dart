import 'package:flutter/material.dart';
import 'package:mask_inventory_app/ui/widget/remain_stat_list_tile.dart';
import 'package:mask_inventory_app/viewmodel/store_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
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
            : storeModel.stores.isEmpty
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('반경 5km 이내에 재고가 있는 매장이 없습니다.'),
                      Text('또는 인터넷이 연결되어 있는지 확인해 주세요')
                    ],
                  )
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: storeModel.stores.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Store store = storeModel.stores[index];

                        return ListTile(
                          title: Text(store.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(store.addr),
                              Text('${store.km}km'),
                            ],
                          ),
                          trailing: RemainStatListTile(store: store),
                          onTap: () {
                            _launchUrl(store.lat, store.lng);
                          },
                        );
                      },
                    ),
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

  Future<void> _launchUrl(num lat, num lng) async {
    final url = 'https://google.com/maps/search/?api=1&query=$lat,$lng';
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch ${Uri.parse(url)}');
    }
  }
}
