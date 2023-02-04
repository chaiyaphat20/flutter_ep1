import 'package:first_app/src/services/web_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WebApiServices().feed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" HomePage"),
      ),
      body: Center(
          child: FutureBuilder(
        future: WebApiServices().feed(), //ให้ทำงานตรงนี้เสร็จ builder จะทำงาน
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return const Text("Loading");
          }
          final data = snapshot.data;
          // low performance => listView in android kotlin
          // return Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [...data!.map((e) => Text(e.title))],
          // );

          //Better performance
          return ListView.builder(
            itemBuilder: (context, index) {
              return TextButton(
                onPressed: () {
                  print(data[index].title);
                },
                child: Card(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Text(data[index].title),
                      Text(data[index].subtitle),
                      Image.network(data[index].youtubeImage)
                    ],
                  ),
                ),
              );
            },
            itemCount: data!.length,
          );
        },
      )),
    );
  }
}
