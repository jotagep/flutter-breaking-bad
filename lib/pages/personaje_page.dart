import 'package:flutter/material.dart';
import 'package:flutter_breaking_bad/models/Personaje.dart';

class PersonajePage extends StatelessWidget {
  final Personaje personaje;

  const PersonajePage(this.personaje);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            backgroundColor: Colors.black,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              title: Text(personaje.name),
              centerTitle: true,
              background: Hero(
                tag: 'id-${personaje.id}',
                child: Image.network(
                  personaje.img,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              
            ),
          )
        ],
      ),
    );
  }
}
