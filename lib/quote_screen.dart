import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  Map<String, dynamic>? _quoteData;
  bool _isLoading = true;
  // IMPORTANT: Make sure this is your actual API key
  final String _apiKey = 'mNsmhS1vsFLkx3TZuC2OIA==sVN09rjYMi9gn3Pk';

  @override
  void initState() {
    super.initState();
    _fetchQuote();
  }

  Future<void> _fetchQuote() async {
    // Set loading state for the initial load or to disable the button during fetch
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('https://api.api-ninjas.com/v1/quotes'),
        headers: {'X-Api-Key': _apiKey},
      );

      if (mounted) {
        // Check if the widget is still in the tree
        if (response.statusCode == 200) {
          final List<dynamic> responseData = jsonDecode(response.body);
          if (responseData.isNotEmpty) {
            setState(() {
              _quoteData = responseData[0];
              _isLoading = false;
            });
          }
        } else {
          throw Exception(
            'Failed to load quote. Status code: ${response.statusCode}',
          );
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _quoteData = {
            'quote': 'Failed to load quote. Please try again.',
            'author': 'Error',
          };
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2C3E50), Color(0xFF34495E)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            // The main column is now balanced with spaceBetween
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1. Modern Heading Added
                const Text(
                  'Quote of the Day',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),

                // Flexible widget allows the quote area to take available space
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    // 2. AnimatedSwitcher for smooth transitions
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 700),
                      // This layoutBuilder prevents the "white flash" by stacking widgets during transition
                      layoutBuilder: (currentChild, previousChildren) {
                        return Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            ...previousChildren,
                            if (currentChild != null) currentChild,
                          ],
                        );
                      },
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                      // The child of the switcher changes based on loading state
                      child: _isLoading && _quoteData == null
                          ? const Center(
                              key: ValueKey('loader'),
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Container(
                              // Using the quote text as a key ensures the animation triggers on new quotes
                              key: ValueKey<String>(_quoteData?['quote'] ?? ''),
                              // 3. SingleChildScrollView prevents pixel overflow for long quotes
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.format_quote,
                                      color: Colors.white.withOpacity(0.6),
                                      size: 40,
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      _quoteData?['quote'] ?? "Loading...",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5, // Improves readability
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      '- ${_quoteData?['author'] ?? ''}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 16,
                                        color: Colors.white70,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ),
                ),

                // Button is now updated to include text
                ElevatedButton.icon(
                  onPressed: _isLoading
                      ? null
                      : _fetchQuote, // Disable button while loading
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF2C3E50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    elevation: 8,
                  ),
                  icon: const Icon(Icons.refresh, size: 24),
                  label: const Text(
                    'New Quote',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
