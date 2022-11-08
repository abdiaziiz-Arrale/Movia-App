import 'package:flutter/material.dart';
class PopularDetail extends StatefulWidget {
  const PopularDetail({required this.movie, required this.Imageurl ,Key? key}) : super(key: key);

  final Map movie;
  final String Imageurl;
  @override
  State<PopularDetail> createState() => _PopularDetailState();
}

class _PopularDetailState extends State<PopularDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.network(widget.Imageurl),
              Positioned(
                bottom: -24,
                right: 24,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.grey,
                  child: Icon(Icons.favorite),
                ),
              )
            ],
          ),
          SizedBox(height: 38),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              widget.movie['title'],
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              widget.movie['overview'],
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(height: 38),


        ],
      ),
    );
  }

  buildCastItem(Map item) {
    String imageUrl = 'https://image.tmdb.org/t/p/w500/${item['profile_path']}';
    return Container(
      width: 90,
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),

          SizedBox(height: 8),

          Text(item['name'], textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
