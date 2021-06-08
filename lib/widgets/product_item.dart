import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/providers/cart.dart';
import 'package:state_management_demo/providers/product.dart';
import 'package:state_management_demo/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<Product>(context, listen: false);
    Cart cart = Provider.of<Cart>(context, listen: false);
    print("Build widget");
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        header: Container(
            padding: EdgeInsets.all(5),
            color: Colors.black54,
            child: Text(
              product.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white
              ),
            )),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, child)=>
            IconButton(
              icon: Icon(
                product.isFavourite ? Icons.favorite : Icons.favorite_border_outlined,
                size: 15,
                color: Theme.of(context).accentColor,
              ),
              onPressed:()=> product.toggleFavouriteStatus(),
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 15,
              color: Theme.of(context).accentColor,
            ),
            onPressed: (){
              cart.addItemsToCart(product.title, product.id, product.price);
            },
          ),
          title: Text(
            'Rs ${product.price}',
            textAlign: TextAlign.start,
            textScaleFactor: 0.75,
          ),
        ),
      ),
    );
  }
}
