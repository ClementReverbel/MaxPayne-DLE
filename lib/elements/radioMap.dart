import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum allMaps { ballation , canal, departure,favela, palace, subway, shoot }

class RadioMap extends StatefulWidget {
  final Function(allMaps?) OnChange;
  const RadioMap({super.key, required this.OnChange});

  @override
  State<RadioMap> createState() => _RadioMapState();
}

class _RadioMapState extends State<RadioMap> {
  allMaps? _location = allMaps.ballation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('55th Ballation HQ'),
          leading: Radio<allMaps>(
            value: allMaps.ballation,
            groupValue: _location,
            onChanged: (allMaps? value) {
              setState(() {
                _location = value;
                widget.OnChange(value);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Canal de Panama'),
          leading: Radio<allMaps>(
            value: allMaps.canal,
            groupValue: _location,
            onChanged: (allMaps? value) {
              setState(() {
                _location = value;
              });
              widget.OnChange(value);
            },
          ),
        ),
        ListTile(
          title: const Text('Departure Lounge'),
          leading: Radio<allMaps>(
            value: allMaps.departure,
            groupValue: _location,
            onChanged: (allMaps? value) {
              setState(() {
                _location = value;
                widget.OnChange(value);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Favela Heights'),
          leading: Radio<allMaps>(
            value: allMaps.favela,
            groupValue: _location,
            onChanged: (allMaps? value) {
              setState(() {
                _location = value;
              });
              widget.OnChange(value);
            },
          ),
        ),
        ListTile(
          title: const Text('Imperial palace'),
          leading: Radio<allMaps>(
            value: allMaps.palace,
            groupValue: _location,
            onChanged: (allMaps? value) {
              setState(() {
                _location = value;
              });
              widget.OnChange(value);
            },
          ),
        ),
        ListTile(
          title: const Text('Roscoe street subway'),
          leading: Radio<allMaps>(
            value: allMaps.subway,
            groupValue: _location,
            onChanged: (allMaps? value) {
              setState(() {
                _location = value;
              });
              widget.OnChange(value);
            },
          ),
        ),
        ListTile(
          title: const Text('Shoot first'),
          leading: Radio<allMaps>(
            value: allMaps.shoot,
            groupValue: _location,
            onChanged: (allMaps? value) {
              setState(() {
                _location = value;
              });
              widget.OnChange(value);
            },
          ),
        )
      ],
    );
  }
}