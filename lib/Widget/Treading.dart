import 'dart:async';
import 'dart:convert';
import 'package:movia_app/Details/TreandingDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart ' as http;

class Treading extends StatefulWidget {
  const Treading({Key? key}) : super(key: key);

  @override
  State<Treading> createState() => _TreadingState();
}

class _TreadingState extends State<Treading> {
  final controller = PageController();
  int _currentPage = 0;

  late Timer _timer;

  PageController _pageController = PageController(
    initialPage: 0,
  );

  RxList treading = [].obs;
  final activeDot = 0.obs;

  FetchTrading() async {
    const url =
        'https://api.themoviedb.org/3/trending/movie/day?api_key=5bd1835f1281fdaab84dced9cfe4860e';
    final responce = await http.get(Uri.parse(url));
    final data = jsonDecode(responce.body);
    List result = data['results'];
    treading.value = result.sublist(0, 4);
  }

  @override
  void initState() {
    FetchTrading();
    controller.addListener(() {
      activeDot.value = controller.page!.toInt();
    });
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.bounceInOut,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }



  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          SizedBox(
            height: 160,
            child: PageView.builder(
              controller: _pageController,
              itemCount: treading.value.length,
              itemBuilder: (ctx, index) {
                Map movie = treading.value[index];
                String imageUrl =
                    'https://image.tmdb.org/t/p/w500/${movie['backdrop_path']}';
                return GestureDetector(
                  onTap:()=> Get.to(TrendingDetail(imageurl: imageUrl,movie: movie,)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black87],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            movie['title'],
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < treading.length; i++)
                  Container(
                    width: 12,
                    height: 12,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: i == activeDot.value ? Colors.red : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            );
          })
        ],
      );
    });
  }
}
