import 'package:flutter/material.dart';

class Destination {
  const Destination(this.index, this.title, this.icon);
  final int index;
  final String title;
  final IconData icon;
}

const List<Destination> allDestinations = <Destination>[
  Destination(0, 'Profile', Icons.movie),
  Destination(1, 'Tv Show', Icons.live_tv),
  Destination(2, 'Tv Show', Icons.live_tv),
  Destination(3, 'Tv Show', Icons.live_tv)
];