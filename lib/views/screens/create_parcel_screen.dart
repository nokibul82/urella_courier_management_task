import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urella_courier_management_task/controllers/parcel_controller.dart';

class CreateParcelScreen extends StatefulWidget {
  const CreateParcelScreen({super.key});

  @override
  State<CreateParcelScreen> createState() => _CreateParcelScreenState();
}

class _CreateParcelScreenState extends State<CreateParcelScreen> {
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
  String _shopId = "";

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
                    Get.find<ParcelController>().createParcel(
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
                        specialInstruction: _specialInstruction,
                        shopId: _shopId);
                    //_formKey.currentState!.reset();
                    Get.back();
                  }
                },
                child: Text("Create"))
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
                        initialValue: _merchantOrderId,
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
                        initialValue: _recipientName,
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
                        initialValue: _recipientPhone,
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
                        initialValue: _recipientCity,
                        onSaved: (newValue) => _recipientCity = newValue!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Recipient Area'),
                        initialValue: _recipientArea,
                        onSaved: (newValue) => _recipientArea = newValue!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Recipient Zone'),
                        initialValue: _recipientZone,
                        onSaved: (newValue) => _recipientZone = newValue!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Recipient Address'),
                        initialValue: _recipientAddress,
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
                        initialValue: _amountToCollect.toString(),
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
                        initialValue: _stockPrice.toString(),
                        keyboardType: TextInputType.number,
                        onSaved: (newValue) =>
                            _stockPrice = int.parse(newValue!),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Item Description'),
                        initialValue: _itemDescription,
                        onSaved: (newValue) => _itemDescription = newValue!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Item Quantity'),
                        initialValue: _itemQuantity.toString(),
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
                        initialValue: _itemWeight.toString(),
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
                        initialValue: _specialInstruction,
                        maxLines:
                            null, // Allows multiline input for instructions
                        onSaved: (newValue) => _specialInstruction = newValue!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Shop ID'),
                        initialValue: _shopId,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the shop ID';
                          }
                          return null;
                        },
                        onSaved: (newValue) => _shopId = newValue!,
                      ),
                    ])))));
  }
}
