import 'package:augmented_reality_plugin/augmented_reality_plugin.dart';
import 'package:flutter/material.dart';

class AugmentedRealityScreen extends StatefulWidget {
  final String imageLink;
  const AugmentedRealityScreen({required this.imageLink});

  @override
  State<AugmentedRealityScreen> createState() => _AugmentedRealityScreenState();
}

class _AugmentedRealityScreenState extends State<AugmentedRealityScreen> {
  @override
  Widget build(BuildContext context) {
    return AugmentedRealityPlugin(widget.imageLink);
  }
}
