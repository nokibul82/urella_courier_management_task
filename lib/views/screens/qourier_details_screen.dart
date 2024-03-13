import 'package:flutter/material.dart';
import '../../models/response_model.dart';

class ParcelDetailsScreen extends StatelessWidget {
  final ParcelModel parcel;

  const ParcelDetailsScreen({required this.parcel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parcel Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderRow(context),
                const SizedBox(height: 8.0),
                _buildDetailsRow(),
                const SizedBox(height: 8.0),
                _buildRecipientRow(),
                const SizedBox(height: 8.0),
                _buildSellerRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildHeaderRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          parcel.recipientName,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          parcel.status,
          style: TextStyle(
            color: _getStatusColor(parcel.status),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Row _buildDetailsRow() {
    return Row(
      children: [
        Text(
          'Order ID: ${parcel.merchantOrderId}',
          style: const TextStyle(fontSize: 12.0),
        ),
        const Spacer(),
        Text(
          '${parcel.codCharge} COD',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Row _buildRecipientRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.location_on_outlined, size: 16.0),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            '${parcel.recipientAddress}, ${parcel.recipientCity}',
            style: const TextStyle(fontSize: 12.0),
          ),
        ),
      ],
    );
  }

  Row _buildSellerRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.person, size: 16.0),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            '${parcel.seller.companyName}, ${parcel.seller.verified ? 'Verified' : 'Unverified'}',
            style: const TextStyle(fontSize: 12.0),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Delivered':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Returned':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
