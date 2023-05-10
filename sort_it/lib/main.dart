import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = -1;
  bool _showAnimation = false;

  final List<String> _imageUrls = [    "https://picsum.photos/id/1/300/300",    "https://picsum.photos/id/2/300/300",    "https://picsum.photos/id/3/300/300",    "https://picsum.photos/id/4/300/300",    "https://picsum.photos/id/5/300/300",    "https://picsum.photos/id/6/300/300",    "https://picsum.photos/id/7/300/300",    "https://picsum.photos/id/8/300/300",    "https://picsum.photos/id/9/300/300",    "https://picsum.photos/id/10/300/300",    "https://picsum.photos/id/11/300/300",    "https://picsum.photos/id/12/300/300",    "https://picsum.photos/id/13/300/300",    "https://picsum.photos/id/14/300/300",    "https://picsum.photos/id/15/300/300",    "https://picsum.photos/id/16/300/300",  ];

  void _onImageSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAnimationButtonPressed() {
    setState(() {
      _showAnimation = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Selection Animation Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Selection Animation Demo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _onImageSelected(index),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(_imageUrls[index]),
                          fit: BoxFit.cover,
                        ),
                        border: _selectedIndex == index
                            ? Border.all(color: Colors.blue, width: 4)
                            : null,
                      ),
                    ),
                  );
                },
                itemCount: _imageUrls.length,
              ),
            ),
            ElevatedButton(
              onPressed: _selectedIndex != -1 ? _onAnimationButtonPressed : null,
              child: Text('Animate Image'),
            ),
            SizedBox(height: 20),
            _showAnimation
                ? Expanded(
                    child: Center(
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(_imageUrls[_selectedIndex]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
