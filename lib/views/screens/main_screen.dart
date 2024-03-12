import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urella_courier_management_task/controllers/login_controller.dart';

import '../../controllers/parcel_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    final scrollController = ScrollController();
    final parcelController = Get.put(ParcelController());
    return Scaffold(
        appBar: AppBar(
          title: TextFormField(
            controller: textEditingController,
          ),
        ),
        body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async{
                parcelController.getAllParcel();
              },
              child: CustomScrollView(
          controller: scrollController,
          slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                          padding: const EdgeInsets.all(20)
                      ),
                      onPressed: () {
                        parcelController.getAllParcel();
                      }, child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Create Parcel",style: Theme.of(context).textTheme.titleMedium,),
                      const Icon(Icons.add)
                    ],
                  )),
                ),
              ),
              Obx(() {
                return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return ListTile(
                      title: Text(parcelController.parcel_list[index].id));
                }, childCount: parcelController.parcel_list.length));
              }),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                          padding: const EdgeInsets.all(20)
                      ),
                      onPressed: () {
                    Get.find<LoginController>().logout();
                  }, child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Logout",style: Theme.of(context).textTheme.titleMedium,),
                      const Icon(Icons.logout)
                    ],
                  )),
                ),
              )
          ],
        ),
            )));
  }
}
