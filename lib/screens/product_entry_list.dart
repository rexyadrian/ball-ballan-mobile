import 'package:flutter/material.dart';
import 'package:ball_ballan/models/product_entry.dart';
import 'package:ball_ballan/widgets/left_drawer.dart';
import 'package:ball_ballan/screens/product_detail.dart';
import 'package:ball_ballan/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

enum ProductFilter { allProduct, myProduct }

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  ProductFilter currentFilter = ProductFilter.allProduct;
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {

    // Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000

    final response = await request.get('http://localhost:8000/products/json/');

    // Decode response to json format
    var data = response;

    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    final dynamic userId = request.jsonData['user_id'];

    int? currentUserId;
    if (userId != null) {
      if (userId is int) {
        currentUserId = userId;
      } else if (userId is String) {
        currentUserId = int.tryParse(userId);
      }
    }

    debugPrint("ID User Login: $currentUserId");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,

      ),

      drawer: const LeftDrawer(),
      // 3. Ubah Body jadi Column untuk menampung Tombol Filter + List
      body: Column(
        children: [
          const SizedBox(height: 16),

          // --- TOMBOL FILTER ---
          SegmentedButton<ProductFilter>(
            segments: const <ButtonSegment<ProductFilter>>[
              ButtonSegment<ProductFilter>(
                value: ProductFilter.allProduct,
                label: Text('All Products'),
                icon: Icon(Icons.list),
              ),
              ButtonSegment<ProductFilter>(
                value: ProductFilter.myProduct,
                label: Text('My Products'),
                icon: Icon(Icons.person),
              ),
            ],
            selected: <ProductFilter>{currentFilter},
            onSelectionChanged: (Set<ProductFilter> newSelection) {
              setState(() {
                currentFilter = newSelection.first;
              });
            },
          ),
          const SizedBox(height: 16),

          // --- LIST PRODUK ---
          Expanded(
            child: FutureBuilder(
              future: fetchProduct(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return const Center(child: Text('No data.'));
                  } else {
                    List<ProductEntry> listProduct = snapshot.data!;

                    // 4. LOGIKA FILTER
                    if (currentFilter == ProductFilter.myProduct) {
                      if (currentUserId == null) {
                        // Jika User ID tidak terbaca (belum login ulang), kosongkan list
                        listProduct = [];
                      } else {
                        // Filter hanya produk milik user ini
                        listProduct = listProduct
                            .where((element) => element.userId == currentUserId)
                            .toList();
                      }
                    }

                    if (listProduct.isEmpty) {
                      return const Center(
                        child: Text(
                          'No products found.',
                          style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: listProduct.length,
                      itemBuilder: (_, index) => ProductEntryCard(
                        product: listProduct[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                product: listProduct[index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}