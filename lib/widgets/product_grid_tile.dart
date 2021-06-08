import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/providers/products.dart';
import 'package:state_management_demo/widgets/product_item.dart';

class ProductGridTile extends StatelessWidget {
  final bool showOnlyFav;

  ProductGridTile(this.showOnlyFav);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context);
    final products =
    showOnlyFav ? productProvider.favouriteItems : productProvider.items;
    return GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          var product = products[index];
          return ChangeNotifierProvider.value(
            value: product,
            child: ProductItem(),
          );
        });
  }
}
