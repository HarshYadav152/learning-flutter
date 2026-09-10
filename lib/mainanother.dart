import 'package:flutter/material.dart';
import 'package:learningflutter/battery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battery Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const BatteryEntryScreen(),
      home: const BatteryDetailScreen(battery: ,),
    );
  }
}

class BatteryEntryScreen extends StatefulWidget {
  const BatteryEntryScreen({super.key});

  @override
  State<BatteryEntryScreen> createState() => _BatteryEntryScreenState();
}

class _BatteryEntryScreenState extends State<BatteryEntryScreen> {
  // Simple text controllers
  TextEditingController srNoController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController batteryDetailsController = TextEditingController();
  TextEditingController modelNoController = TextEditingController();
  TextEditingController serialNoController = TextEditingController();
  TextEditingController modePaidController = TextEditingController();
  TextEditingController remainController = TextEditingController();
  TextEditingController dealerCodeController = TextEditingController();
  TextEditingController dealerNameController = TextEditingController();
  TextEditingController billingDateController = TextEditingController();

  String paymentType = 'Cash';
  String dealerDetails = 'Yes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yadav Battery Shop'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  'Add Battery Details',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              // Form Fields
              buildTextField('SR No', srNoController),
              buildTextField('Date of Sale', dateController),
              buildTextField('Customer Name', customerNameController),
              buildTextField('Address', addressController, lines: 3),
              buildTextField('Mobile', mobileController),
              buildTextField('Battery Details', batteryDetailsController),
              
              // Row for Model No and Serial No
              Row(
                children: [
                  Expanded(
                    child: buildTextField('Model No', modelNoController),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: buildTextField('Serial No', serialNoController),
                  ),
                ],
              ),

              // Payment Type Dropdown
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Payment Type',
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButton<String>(
                        value: paymentType,
                        isExpanded: true,
                        underline: Container(),
                        items: ['Cash', 'Credit Card', 'UPI', 'Cheque']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            paymentType = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Amount Paid and Remain
              Row(
                children: [
                  Expanded(
                    child: buildTextField('Amount Paid', modePaidController),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: buildTextField('Remain Amount', remainController),
                  ),
                ],
              ),

              // Dealer Details Dropdown
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dealer Details',
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButton<String>(
                        value: dealerDetails,
                        isExpanded: true,
                        underline: Container(),
                        items: ['Yes', 'No'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            dealerDetails = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Dealer fields (only show if dealer details is Yes)
              if (dealerDetails == 'Yes') ...[
                buildTextField('Dealer Code', dealerCodeController),
                buildTextField('Dealer Name', dealerNameController),
                buildTextField('Billing Date', billingDateController),
              ],

              // Submit Button
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    // Create data object for API
                    Map<String, dynamic> batteryData = {
                      'srNo': srNoController.text,
                      'date': dateController.text,
                      'customerName': customerNameController.text,
                      'address': addressController.text,
                      'mobile': mobileController.text,
                      'batteryDetails': batteryDetailsController.text,
                      'modelNo': modelNoController.text,
                      'serialNo': serialNoController.text,
                      'paymentType': paymentType,
                      'modePaid': modePaidController.text,
                      'remain': remainController.text,
                      'dealerDetails': dealerDetails,
                      'dealerCode': dealerCodeController.text,
                      'dealerName': dealerNameController.text,
                      'billingDate': billingDateController.text,
                    };

                    // TODO: Call your API here
                    print('Battery Data: $batteryData');
                    
                    // Show success message
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Success'),
                        content: const Text('Data ready for API submission'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Submit Battery Entry',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {int lines = 1}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            maxLines: lines,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }
}