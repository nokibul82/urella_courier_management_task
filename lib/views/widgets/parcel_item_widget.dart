import 'package:flutter/material.dart';
import '../../models/response_model.dart';

class ParcelItemWidget extends StatelessWidget {
  const ParcelItemWidget({super.key, required this.parcelModel});
  final ParcelModel parcelModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.secondaryContainer),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Zone: ${parcelModel.recipientZone}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "Area: ${parcelModel.recipientArea}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "City: ${parcelModel.recipientCity}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  parcelModel.cityType,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  parcelModel.paymentStatus,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ]),
        ));
  }
}
