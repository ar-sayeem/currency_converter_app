import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Icons.monetization_on,
        splashIconSize: 100,
        duration: 2000,
        backgroundColor: Colors.blueAccent,
        nextScreen: const CurrencyConverterScreen(),
      ),
    );
  }
}

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  CurrencyConverterScreenState createState() => CurrencyConverterScreenState();
}

class CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final String apiUrl = "https://api.exchangerate-api.com/v4/latest/USD";
  Map<String, dynamic>? exchangeRates;
  String fromCurrency = 'USD';
  String toCurrency = 'BDT';
  double amount = 1.0;
  double convertedAmount = 0.0;
  final TextEditingController _amountController = TextEditingController(text: '1.0');
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchExchangeRates();
  }

  Future<void> fetchExchangeRates() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
          exchangeRates = json.decode(response.body)['rates'];
          isLoading = false;
        });
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  void convertCurrency() {
    if (exchangeRates != null && exchangeRates!.containsKey(fromCurrency) && exchangeRates!.containsKey(toCurrency)) {
      double rate = exchangeRates![toCurrency] / exchangeRates![fromCurrency];
      setState(() {
        convertedAmount = amount * rate;
      });
    }
  }

  void swapCurrencies() {
    setState(() {
      String temp = fromCurrency;
      fromCurrency = toCurrency;
      toCurrency = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        backgroundColor: Colors.blueAccent,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : hasError
              ? const Center(child: Text("Failed to fetch exchange rates. Please try again."))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.blue.shade50,
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            amount = double.tryParse(value) ?? 0.0;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DropdownButton<String>(
                            value: fromCurrency,
                            items: exchangeRates?.keys
                                    .map((String currency) => DropdownMenuItem(
                                          value: currency,
                                          child: Text(currency),
                                        ))
                                    .toList() ?? [],
                            onChanged: (value) {
                              setState(() {
                                fromCurrency = value!;
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.swap_horiz, size: 30, color: Colors.blueAccent),
                            onPressed: swapCurrencies, // Call the swapCurrencies method
                          ),
                          DropdownButton<String>(
                            value: toCurrency,
                            items: exchangeRates?.keys
                                    .map((String currency) => DropdownMenuItem(
                                          value: currency,
                                          child: Text(currency),
                                        ))
                                    .toList() ?? [],
                            onChanged: (value) {
                              setState(() {
                                toCurrency = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: convertCurrency,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                        ),
                        child: const Text('Convert', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 20),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Converted Amount: \$${convertedAmount.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
