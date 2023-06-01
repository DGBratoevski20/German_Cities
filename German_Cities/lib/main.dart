import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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
  bool _showMap = false;

  final List<String> _imageUrls = [
    "https://media.cntraveler.com/photos/5b914e80d5806340ca438db1/1:1/w_2250,h_2250,c_limit/BrandenburgGate_2018_GettyImages-549093677.jpg7",
    "https://a.cdn-hotels.com/gdcs/production19/d1430/c53e41bd-1e9b-4c80-b15b-01e81b1c4679.jpg?impolicy=fcrop&w=800&h=533&q=medium",
    "https://cdn.britannica.com/06/152206-050-72BD5CAC/twin-towers-Church-of-Our-Lady-Munich.jpg",
    "https://lp-cms-production.imgix.net/2023-03/cologne-GettyImages-1144623412-rfc.jpeg",
    "https://media.cnn.com/api/v1/images/stellar/prod/190418141741-01-what-to-see-frankfurt-germany-photos.jpg?q=w_4191,h_2357,x_0,y_0,c_fill/w_1280",
    "https://en.stuttgart.de/medien/welcomeImages/GettyImages-c-nullplus-478297438-bearbeitet.jpg.scaled/1062a1f14774857c3ccac80e8f83f2f7.jpg",
    "https://a.cdn-hotels.com/gdcs/production61/d1121/6dfd3cfe-d31b-4514-b3af-aee8536223d1.jpg",
    "https://content.r9cdn.net/rimg/dimg/38/61/4f479618-city-32256-172608b0525.jpg?width=1200&height=630&xhint=1813&yhint=1557&crop=true",
    "https://media.essen.de/media/emg_1/essen_tourismus/bilder_neu_1/tourismus_4/erleben_2/DasistEssen_Skyline_peter_prengel_1920_1zu2.jpg",
    "https://images.prismic.io/indiecampers-demo/f8302bef-06d7-4063-8d8f-be4359674750_final+leipzig.jpg?auto=compress,format&rect=0,0,1996,1331&w=2000&h=1334",
    "https://www.bremen-convention.de/_Resources/Persistent/e75135ad3b5970303bb1743f2040bd4d561f8c23/RS53013_200423_026-943x628.jpg",
    "https://www.dresden.de/media/tourismus/sehenswuerdigkeiten/493x330_panorama_dresden_altstadt.jpg.scaled/944272df651acea2572d1e35d36caaf3.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Hannover_Blick_Neues_Rathaus_01.jpg/1200px-Hannover_Blick_Neues_Rathaus_01.jpg",
    "https://www.germany.travel/media/redaktion/content/staedte/nuernberg/Nuernberg_Blick_auf_den_Tiergaertnertorplatz.jpg",
    "https://image.jimcdn.com/app/cms/image/transf/dimension=4096x4096:format=jpg/path/sa6549607c78f5c11/image/idf6d09279ea1b3ad/version/1471191639/image.jpg",
    "https://content.r9cdn.net/rimg/dimg/08/8c/98d64b51-city-9410-1693517046b.jpg?width=1366&height=768&xhint=3561&yhint=2751&crop=true",
  ];

  final List<String> _imageNames = [
    "Berlin",
    "Hamburg",
    "Munich",
    "Cologne",
    "Frankfurt",
    "Stuttgart",
    "Düsseldorf",
    "Dortmund",
    "Essen",
    "Leipzig",
    "Bremen",
    "Dresden",
    "Hanover",
    "Nuremberg",
    "Duisburg",
    "Bochum",
  ];

  final List<String> _cityInfo = [
    "Info for Berlin",
    "Info for Hamburg",
    "Info for Munich",
    "Info for Cologne",
    "Info for Frankfurt",
    "Info for Stuttgart",
    "Info for Düsseldorf",
    "Info for Dortmund",
    "Info for Essen",
    "Info for Leipzig",
    "Info for Bremen",
    "Info for Dresden",
    "Info for Hanover",
    "Info for Nuremberg",
    "Info for Duisburg",
    "Info for Bochum",
  ];

  void _onImageSelected(int index) {
    setState(() {
      if (_showAnimation) {
        // If the button says "Unselect," do not allow selecting other cities
        return;
      }

      if (_selectedIndex == -1) {
        _selectedIndex = index; // Select the city
        _showMap = true; // Show the map when a city is selected
      } else if (_selectedIndex == index) {
        _selectedIndex = -1; // Unselect the city
        _showMap = false; // Hide the map when the city is unselected
      } else {
        _selectedIndex = index; // Select a different city
        _showMap = true; // Show the map for the newly selected city
      }
    });
  }

  void _onAnimationButtonPressed() {
    setState(() {
      _showAnimation = !_showAnimation; // Toggle the animation state
      if (!_showAnimation) {
        _showMap = false; // Reset the map visibility when animation is toggled off
      }
    });
  }

  Container _buildMapContainer() {
    return Container(
      height: 300, // Adjust the height as needed
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(51.1657, 10.4515), // Specify the initial map center coordinates
          zoom: 6.0, // Specify the initial zoom level
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'German cities',
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: Scaffold(
        appBar: AppBar(
          title: Text('German cities'),
          centerTitle: true,
        ),
        body: Column(
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
                      child: Stack(
                        children: [
                          _selectedIndex != index
                              ? Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        _imageNames[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          _selectedIndex == index
                              ? Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.black54.withOpacity(0.6),
                                    child: Text(
                                      _imageNames[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _imageUrls.length,
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: ElevatedButton(
                onPressed: _selectedIndex == -1 ? null : _onAnimationButtonPressed,
                child: Text(
                  _showAnimation ? 'Unselect' : 'Select',
                ),
              ),
            ),
            SizedBox(height: 10),
            _showAnimation && _selectedIndex != -1 && _showMap
                ? _buildMapContainer()
                : SizedBox(),
            _showAnimation && _selectedIndex != -1 && !_showMap
                ? Expanded(
                    child: Container(
                      color: Colors.red, // Set the background color to red
                      alignment: Alignment.center,
                      child: Text(
                        _cityInfo[_selectedIndex],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
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