import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class GermanCitiesApp extends StatefulWidget {
  @override
  _GermanCitiesAppState createState() => _GermanCitiesAppState();
}

class _GermanCitiesAppState extends State<GermanCitiesApp> {
  int _selectedIndex = -1;
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
    "Dresden",
    "Hanover",
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

  final List<LatLng> _cityCoordinates = [
    LatLng(52.520008, 13.404954),
    LatLng(53.551086, 9.993682),
    LatLng(48.135125, 11.581981),
    LatLng(50.937531, 6.960279),
    LatLng(50.110924, 8.682127),
    LatLng(48.775418, 9.181758),
    LatLng(51.227741, 6.773456),
    LatLng(51.513587, 7.465298),
    LatLng(51.458223, 7.015817),
    LatLng(51.340632, 12.374732),
    LatLng(53.079296, 8.801694),
    LatLng(51.050407, 13.737262),
    LatLng(52.375891, 9.732010),
    LatLng(49.452103, 11.076665),
    LatLng(52.375891, 9.732010),
    LatLng(49.452103, 11.076665),
  ];

   void _onImageSelected(int index) {
    setState(() {
      _selectedIndex = index;
      _showMap = !_showMap;
    });
  }

  Widget _buildMapContainer() {
    return FlutterMap(
      options: MapOptions(
        center: _cityCoordinates[_selectedIndex],
        zoom: 13.0,
        interactiveFlags: InteractiveFlag.all,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: _cityCoordinates[_selectedIndex],
              builder: (ctx) => Container(
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCityInfo() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(_imageUrls[_selectedIndex]),
          ),
          SizedBox(height: 16.0),
          Text(
            _imageNames[_selectedIndex],
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            "Some information about ${_imageNames[_selectedIndex]} goes here.",
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCityGrid() {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.all(16.0),
      childAspectRatio: 1.0,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      children: List.generate(_imageUrls.length, (index) {
        return GestureDetector(
          onTap: () => _onImageSelected(index),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(_imageUrls[index]),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("German Cities"),
        ),
        body: _showMap
            ? _buildMapContainer()
            : _selectedIndex != -1
                ? _buildCityInfo()
                : _buildCityGrid(),
      ),
    );
  }
}

void main() {
  runApp(GermanCitiesApp());
}