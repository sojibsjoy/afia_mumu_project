import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  int viewID = 0; // 0 means Description
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            setState(() {
              if (viewID == 0) {
                viewID = 1;
              } else if (viewID == 1) {
                viewID = 2;
              } else {
                viewID = 1;
              }
            });
          },
          child: Center(
            child: getBodyView(),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 50,
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => setState(() => viewID = 0),
              child: const Text(
                "Description",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () => setState(() => viewID = 1),
              child: const Text(
                "Gallery",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () => setState(() => viewID = 2),
              child: const Text(
                "Review",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBodyView() {
    switch (viewID) {
      case 0:
        return descriptionView();
      case 1:
        return galleryView();
      case 2:
        return Text("Review Design");
      default:
        return descriptionView();
    }
  }

  Widget descriptionView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Image.asset(
                'assets/recipe_img/applep/applep1.jpg',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Apple Pie",
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            const Text("Co and Co Workers"),
            const SizedBox(height: 10),
            // FutureBuilder(
            //   future: _getDescription(),
            //   builder: (context, snapshot) {
            //     if (!snapshot.hasData) {
            //       return const SizedBox(
            //         height: 180.0,
            //         child: Center(
            //           child: CircularProgressIndicator(),
            //         ),
            //       );
            //     } else {
            //       return Text(snapshot.data.toString());
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Widget galleryView() {
    return Expanded(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.grey,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(5),
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amberAccent,
              ),
              child: Center(child: Text("$index Rifat")),
            );
          },
          itemCount: 20,
        ),
      ),
    );
  }
}
