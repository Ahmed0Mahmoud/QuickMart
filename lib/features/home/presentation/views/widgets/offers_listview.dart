import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/data/models/product_model/product_model.dart';
import 'package:quick_mart/features/home/presentation/views/product_details_view.dart';
import 'offer_card.dart';

class OffersListView extends StatefulWidget {
  final List<ProductModel> models;
  const OffersListView({super.key, required this.models});

  @override
  State<OffersListView> createState() => _OffersListViewState();
}

class _OffersListViewState extends State<OffersListView> {
  final ScrollController scrollController = ScrollController();
  late Timer _autoScrollTimer;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (scrollController.hasClients && widget.models.isNotEmpty) {

        double itemWidth = MediaQuery.of(context).size.width * 0.8;

        currentIndex++;
        if (currentIndex >= widget.models.length) {
          currentIndex = 0;
        }

        scrollController.animateTo(
          currentIndex * itemWidth,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.8;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.23,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.models.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: cardWidth,
              child: OfferCard(product: widget.models[index]),
            ),
          );
        },
      ),
    );
  }
}
