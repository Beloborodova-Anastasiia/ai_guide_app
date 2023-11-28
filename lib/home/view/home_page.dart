import 'package:ai_guide/landmarks_list/bloc/landmarks_list_bloc.dart';
import 'package:ai_guide/landmarks_list/models/landmark.dart';
import 'package:ai_guide/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_api/google_maps_api.dart';
import 'package:location_service/location_service.dart';

import '../../attraction/bloc/attraction_bloc.dart';
import '../../attraction/view/attraction_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final attractionBloc = BlocProvider.of<AttractionBloc>(context);
    final landmarksBloc = BlocProvider.of<LandmarksListBloc>(context);
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('AI Audio Guide'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter attraction you want to find',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: FloatingActionButton(
                        heroTag: 'search',
                        child: const Icon(Icons.search),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (_) => AttractionScreen(),
                          //     ));
                          // attractionBloc
                          //     .add(GetAttractionEvent(textController.text));
                          landmarksBloc.add(LandmarksSearchEvent(
                              textQuery: textController.text));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: FloatingActionButton(
                  heroTag: 'location',
                  child: const Icon(Icons.location_on),
                  onPressed: () {
                    landmarksBloc.add(
                        LandmarksNearbyEvent(radius: 1000, maxResultCount: 10));
                  },
                ),
              ),
              LandmarksListWidget(),
            ],
          ),
        ),
      );
    });
  }
}

class LandmarksListWidget extends StatelessWidget {
  const LandmarksListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandmarksListBloc, LandmarksListState>(
        builder: (context, state) {
      final landmarksBloc = BlocProvider.of<LandmarksListBloc>(context);
      final landmarks =
          context.select((LandmarksListBloc bloc) => bloc.state.landmarks);
      final attractionBloc = BlocProvider.of<AttractionBloc>(context);
      return Column(
        children: [
          if (landmarksBloc.state.isLoading) LoadingWidget(),
          if (landmarksBloc.state.landmarks.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                landmarksBloc.state.title,
                style: const TextStyle(fontSize: 25),
              ),
            ),
          SingleChildScrollView(
            //   scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final landmark = landmarks[index];
                return ListTile(
                  title: Text(
                    landmark.name ?? '',
                    style: const TextStyle(fontSize: 20),
                  ),
                  // leading: Text(landmark.name ?? ''),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AttractionScreen()));
                    attractionBloc.add(GetAttractionEvent(
                        name: landmark.name, location: landmark.location));
                  },
                );
              },
              itemCount: landmarks.length,
            ),
          ),
          if (landmarksBloc.state.notFounded)
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Sorry, we could not find historical places near you',
                style: const TextStyle(fontSize: 25),
              ),
            ),
        ],
        // if (landmarksBloc.state.isLoading) LoadingWidget(),
      );
    });
  }
}
