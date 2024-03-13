import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urella_courier_management_task/controllers/login_controller.dart';
import 'package:urella_courier_management_task/models/response_model.dart';
import 'package:urella_courier_management_task/views/screens/create_parcel_screen.dart';

import '../../controllers/parcel_controller.dart';
import '../widgets/parcel_item_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final scrollController = ScrollController();
    final parcelController = Get.put(ParcelController());

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 50,
        title: TextFormField(
          decoration: const InputDecoration(
            hintText: "Search for parcel",
            border: InputBorder.none,
          ),
          controller: searchController,
          onChanged: (searchText) {
            print(searchText);
            parcelController.update();
          },
        ),
      ),
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: () async {
          parcelController.getAllParcel();
        },
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            Obx(() {
              parcelController.filtered_list.value = parcelController.parcel_list
                  .where((parcel) => parcel.recipientName.toLowerCase().contains(searchController.text.toLowerCase()) ||
                  parcel.recipientPhone.toLowerCase().contains(searchController.text.toLowerCase()) ||
                  parcel.recipientCity.toLowerCase().contains(searchController.text.toLowerCase())
              ).toList();
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ParcelItemWidget(
                      parcelModel: parcelController.filtered_list[index]);
                },
                childCount: parcelController.filtered_list.length,
              ));
            }),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverToBoxAdapter(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).secondaryHeaderColor,
                        padding: const EdgeInsets.all(20)),
                    onPressed: () {
                      Get.find<LoginController>().logout();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Logout",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Icon(Icons.logout)
                      ],
                    )),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 100,
              ),
            )
          ],
        ),
      )),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Get.to(const CreateParcelScreen());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add),
            SizedBox(width: 5,),
            Text("Create\nParcel"),

          ],
        ),
      ),
    );
  }
}
