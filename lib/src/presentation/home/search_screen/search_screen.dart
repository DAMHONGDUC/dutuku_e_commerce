import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];
  final List<String> _allProducts = [
    'Laptop Pro',
    'Gaming Mouse X',
    'Mechanical Keyboard',
    'HD Webcam',
    'Wireless Earbuds',
    'Smartwatch Series 5',
    'External SSD 1TB',
    'USB-C Hub',
    'Monitor 4K',
    'Ergonomic Chair',
  ]; // Mock data

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _searchResults = []; // Clear results if query is empty
      } else {
        _searchResults = _allProducts
            .where(
              (product) => product.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
        // You can make the search bar part of the AppBar for a more integrated look
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for products...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _performSearch(''); // Clear results
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (query) {
                // Optional: Perform live search as user types
                _performSearch(query);
              },
              onSubmitted:
                  _performSearch, // Perform search when Enter is pressed
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: _searchResults.isEmpty && _searchController.text.isNotEmpty
                  ? const Center(child: Text('No results found.'))
                  : _searchResults.isEmpty && _searchController.text.isEmpty
                  ? const Center(
                      child: Text('Start typing to search for products.'),
                    )
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final product = _searchResults[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          child: ListTile(
                            title: Text(product),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              // TODO: Navigate to product detail screen
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Tapped on $product')),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
