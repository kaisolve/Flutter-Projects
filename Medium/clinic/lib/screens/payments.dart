import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Options'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPaymentOption('Visa'),
            _buildPaymentOption('MasterCard'),
            _buildPaymentOption('Vodafone Cash'),
            // Add Google Pay option when supported
            // _buildPaymentOption('Google Pay'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle the payment based on the selected option
                if (selectedPaymentOption.isNotEmpty) {
                  // Perform the payment processing
                  _processPayment(selectedPaymentOption);
                } else {
                  // Show an error message or handle accordingly
                  print('Please select a payment option.');
                }
              },
              child: Text('Proceed to Pay'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String option) {
    return Row(
      children: [
        Radio(
          value: option,
          groupValue: selectedPaymentOption,
          onChanged: (value) {
            setState(() {
              selectedPaymentOption = value.toString();
            });
          },
        ),
        Text(option),
      ],
    );
  }

  void _processPayment(String paymentOption) {
    // Implement payment processing logic based on the selected option
    // This is where you would integrate with the payment gateway
    // For this example, let's just print the selected option.
    print('Processing payment with $paymentOption');
  }
}
