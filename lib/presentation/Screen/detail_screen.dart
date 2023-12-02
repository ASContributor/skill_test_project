import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_test_project/business/productBloc/product_bloc.dart';
import 'package:skill_test_project/data/model/product.dart';

import '../../business/postBloc/posts_data_bloc.dart';
import '../../data/model/post.dart';

class detailScreen extends StatefulWidget {
  const detailScreen({super.key});

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  @override
  void initState() {
    if (data.isEmpty) {
      BlocProvider.of<ProductBloc>(context).add(GetProductEvent());
    }
  }

  List<post> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductLoadedState) {
            setState(() {
              data = BlocProvider.of<PostsDataBloc>(context).state.posts;
            });
          }
        },
        builder: (context, state) {
          List<Item> product = [];
          if (state is ProductLoadingState) {}
          if (state is ProductLoadedState) {
            product = state.product;
          } else if (state is ProductErrorState) {
            print(state.error);
          }

          return Center(
            child: ListView.builder(
              itemBuilder: (context, index) => Card(
                child: Text("${product[index].category}"),
              ),
              itemCount: product.length,
            ),
          );
        },
      ),
    );
  }
}
