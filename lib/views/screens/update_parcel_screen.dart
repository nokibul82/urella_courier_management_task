import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/parcel_controller.dart';
import '../../models/response_model.dart';

class UpdateParcelScreen extends StatefulWidget {
  const UpdateParcelScreen({super.key,required this.parcelModel});
  final ParcelModel parcelModel;
  @override
  State<UpdateParcelScreen> createState() => _UpdateParcelScreenState();
}

class _UpdateParcelScreenState extends State<UpdateParcelScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _merchantOrderId = "";
  String _recipientName = "";
  String _recipientPhone = "";
  String _recipientCity = "";
  String _recipientArea = "";
  String _recipientZone = "";
  String _recipientAddress = "";
  int _amountToCollect = 0;
  int _stockPrice = 0;
  String _itemDescription = "";
  int _itemQuantity = 0;
  int _itemWeight = 0;
  String _specialInstruction = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Parcel form'),
          actions: [
            TextButton(
                onPressed: () async{
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process the form data here (e.g., submit to a server)
                    await Get.find<ParcelController>().updateParcel(
                        id: widget.parcelModel.id,
                        merchantOrderId: _merchantOrderId,
                        recipientName: _recipientName,
                        recipientPhone: _recipientPhone,
                        recipientCity: _recipientCity,
                        recipientArea: _recipientArea,
                        recipientZone: _recipientZone,
                        recipientAddress: _recipientAddress,
                        amountToCollect: _amountToCollect,
                        stockPrice: _stockPrice,
                        itemDescription: _itemDescription,
                        itemQuantity: _itemQuantity,
                        itemWeight: _itemWeight,
                        specialInstruction: _specialInstruction);
                  }
                  _formKey.currentState!.reset();
                  Get.back();
                },
                child: Text("Update"))
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Merchant Order ID'),
                        initialValue: widget.parcelModel.merchantOrderId,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid Order ID';
                          }
                          return null;
                        },
                        onSaved: (newValue) => _merchantOrderId = newValue!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Recipient Name'),
                        initialValue: widget.parcelModel.recipientName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the recipient\'s name';
                          }
                          return null;
                        },
                        onSaved: (newValue) => _recipientName = newValue!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          labelText: 'Recipient Phone',
                        ),
                        initialValue: widget.parcelModel.recipientPhone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the recipient\'s phone number';
                          }
                          return null;
                        },
                        onSaved: (newValue) => _recipientPhone = newValue!,
                      ),
                      // Similarly add TextFormFields for other data points
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Recipient City'),
                        initialValue: widget.parcelModel.recipientCity,
                        onSaved: (newValue) => _recipientCity = newValue!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Recipient Area'),
                        initialValue: widget.parcelModel.recipientArea,
                        onSaved: (newValue) => _recipientArea = newValue!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Recipient Zone'),
                        initialValue: widget.parcelModel.recipientZone,
                        onSaved: (newValue) => _recipientZone = newValue!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Recipient Address'),
                        initialValue: widget.parcelModel.recipientAddress,
                        maxLines: null,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the recipient address';
                          }
                          return null;
                        },
                        // Allows multiline input for address
                        onSaved: (newValue) => _recipientAddress = newValue!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Amount to Collect'),
                        initialValue: widget.parcelModel.amountToCollect.toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.parse(value) <= 0) {
                            return 'Please enter the amount to collect';
                          }
                          return null;
                        },
                        onSaved: (newValue) =>
                        _amountToCollect = int.parse(newValue!),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Stock Price'),
                        initialValue: widget.parcelModel.stockPrice.toString(),
                        keyboardType: TextInputType.number,
                        onSaved: (newValue) =>
                        _stockPrice = int.parse(newValue!),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Item Description'),
                        initialValue: widget.parcelModel.itemDescription,
                        onSaved: (newValue) => _itemDescription = newValue!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Item Quantity'),
                        initialValue: widget.parcelModel.itemQuantity.toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the item quantity';
                          }
                          return null;
                        },
                        onSaved: (newValue) =>
                        _itemQuantity = int.parse(newValue!),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Item Weight (kg/g)'),
                        initialValue: widget.parcelModel.itemWeight.toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the item weight';
                          }
                          return null;
                        },
                        onSaved: (newValue) =>
                        _itemWeight = int.parse(newValue!),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Special Instructions (Optional)'),
                        initialValue: widget.parcelModel.specialInstruction,
                        maxLines:
                        null, // Allows multiline input for instructions
                        onSaved: (newValue) => _specialInstruction = newValue!,
                      ),
                    ])))));
  }
}
