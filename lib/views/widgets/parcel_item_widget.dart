import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urella_courier_management_task/views/screens/update_parcel_screen.dart';
import '../screens/qourier_details_screen.dart';
import '../../models/response_model.dart';

class ParcelItemWidget extends StatelessWidget {
  const ParcelItemWidget({super.key, required this.parcelModel});
  final ParcelModel parcelModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.to(ParcelDetailsScreen(parcel: parcelModel));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.secondaryContainer),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.surface),
                child: Text(
                  "Order id: ${parcelModel.merchantOrderId}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      parcelModel.recipientName,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const Icon(Icons.call,size: 15,),
                  Text(
                    parcelModel.recipientPhone,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "City: ${parcelModel.recipientCity}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "Address: ${parcelModel.recipientAddress}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    parcelModel.status,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.surface),
                    child: Text(
                      "Amount to Collect: BDT ${parcelModel.amountToCollect.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: IconButton(
                          onPressed: () {
                            Get.to(UpdateParcelScreen(parcelModel: parcelModel));
                          }, icon: const Icon(Icons.edit)),
                  )
                ],
              )
            ]),
          ),
        ));
  }
}
