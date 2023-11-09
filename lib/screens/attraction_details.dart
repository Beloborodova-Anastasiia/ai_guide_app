import 'package:flutter/material.dart';
import 'package:ai_guide/models/attraction.dart';

class AttrDetails extends StatelessWidget{
  final Attraction attractionToFind;

  const AttrDetails({Key? key, required this.attractionToFind} ): super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text(
          'Attraction details'
          // attractionToFind
        ),

      ),
      body: Text(
        attractionToFind.objectName
        )
      );
  }
}