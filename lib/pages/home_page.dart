import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:flutter_breaking_bad/enum/viewstate.dart';
import 'package:flutter_breaking_bad/models/Personaje.dart';
import 'package:flutter_breaking_bad/pages/personaje_page.dart';
import 'package:flutter_breaking_bad/viewmodel/home_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = context.watch<HomeModel>();

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: false,
            backgroundColor: Colors.black,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://2.bp.blogspot.com/-e61nixVJej4/UgBPmSxqweI/AAAAAAAAAsc/7wJkwU8qWbI/s1600/breaking-bad-hacer-nombre.jpg',
                fit: BoxFit.cover,
              ),
              title: Text('Personajes'),
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              stretchModes: [
                StretchMode.fadeTitle,
                StretchMode.zoomBackground,
              ],
            ),
            expandedHeight: 200,
          ),
          model.state != ViewState.Idle
              ? SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                    children: List.generate(model.personajes.length,
                        (index) => PersonajeItem(model.personajes[index])),
                  ),
                ),
        ],
      ),
    );
  }
}

class PersonajeItem extends StatelessWidget {
  final Personaje personaje;

  const PersonajeItem(this.personaje);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      Navigator.of(context).push(
          PageRouteBuilder<Null>(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget child) {
                return Opacity(
                  opacity: animation.value,
                  child: PersonajePage(personaje),
                );
              },
            );
          },
          transitionDuration: Duration(milliseconds: 500),
        ));
      },
      child: Hero(
        tag: 'id-${personaje.id}',
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          child: Material(
            elevation: 0,
            color: Colors.transparent,
            child: Text(
              personaje.name,
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(personaje.img),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter)),
        ),
      ),
    );
  }
}

class SliverPageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://2.bp.blogspot.com/-e61nixVJej4/UgBPmSxqweI/AAAAAAAAAsc/7wJkwU8qWbI/s1600/breaking-bad-hacer-nombre.jpg',
      fit: BoxFit.cover,
    );
  }
}

// class SliverHeader implements SliverPersistentHeaderDelegate {
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return SliverPageHeader();
//   }

//   @override
//   double get maxExtent => 250;

//   @override
//   double get minExtent => 150;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }

//   @override
//   FloatingHeaderSnapConfiguration get snapConfiguration => null;

//   @override
//   OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
// }
