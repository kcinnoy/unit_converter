import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double _numberFrom = 0;
  String _startMeasure = 'meters';
  String _convertedMeasure = 'kilometers';

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  final Map<String, int> _measuresMap = {
    'meters': 0,
    'kilometers': 1,
    'grams': 2,
    'kilograms': 3,
    'feet': 4,
    'miles': 5,
    'pounds (lbs)': 6,
    'ounces': 7,
  };

  @override
  void initState() {
    _numberFrom = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle inputStyle = TextStyle(
      fontSize: 20,
      color: Colors.blue[900],
    );

    final TextStyle labelStyle = TextStyle(
      fontSize: 24,
      color: Colors.grey[700],
    );

    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Converter'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 20.0),
                Text(
                  'Value',
                  style: labelStyle,
                ),
                SizedBox(height: 20.0),
                TextField(
                  style: inputStyle,
                  decoration: InputDecoration(
                    hintText: 'Please insert the measure to be converted',
                  ),
                  onChanged: (text) {
                    var rv = double.tryParse(text);
                    if (rv != null) {
                      setState(() {
                        _numberFrom = rv;
                      });
                    }
                  },
                ),
                SizedBox(height: 20.0),
                Text(
                  'From',
                  style: labelStyle,
                ),
                SizedBox(height: 20.0),
                DropdownButton<String>(
                  value: _startMeasure,
                  isExpanded: true,
                  style: inputStyle,
                  onChanged: (String? value) {
                    setState(() {
                      _startMeasure = value!;
                      print(_startMeasure);
                    });
                  },
                  items:
                      _measures.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20.0),
                Text(
                  'To',
                  style: labelStyle,
                ),
                SizedBox(height: 20.0),
                DropdownButton<String>(
                  value: _convertedMeasure,
                  isExpanded: true,
                  style: inputStyle,
                  onChanged: (String? value) {
                    setState(() {
                      _convertedMeasure = value!;
                    });
                  },
                  items:
                      _measures.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: inputStyle,
                      ),
                    );
                  }).toList(),
                ),
                // TextField(
                //   onChanged: (text) {
                //     var rv = double.tryParse(text);
                //     if (rv != null) {
                //       setState(() {
                //         _numberFrom = rv;
                //       });
                //     }
                //   },
                // ),
                // Text((_numberFrom == null) ? '' : _numberFrom.toString())
                SizedBox(height: 40.0),
                ElevatedButton(
                  child: Text(
                    'Convert',
                    style: inputStyle,
                  ),
                  onPressed: () => true,
                ),
                SizedBox(height: 40.0),
                Text((_numberFrom == null) ? '' : _numberFrom.toString(),
                    style: labelStyle),
                SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
