import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../components/novel_text.dart';
import '../models/wall_model.dart';
import '../pages/wall_detail_screen.dart';

class WallCard extends StatelessWidget {
  final WallModel currentWall;
  final int index;

  const WallCard({Key? key, required this.currentWall, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? catName = currentWall.category;
    if (currentWall.category == null) {
      catName = "unavailable";
    }
    String? wallName = currentWall.name;
    if (currentWall.name == null) {
      wallName = "unavailable";
    }
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WallDetailScreen(
                        currentWall: currentWall,
                      )));
        },
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, progress) => Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                value: progress.progress,
                color: Theme.of(context).textTheme.labelLarge!.color,
              ),
            ),
          ),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
          fit: BoxFit.cover,
          imageUrl: currentWall.thumb ?? currentWall.url!,
          imageBuilder: (context, imageProvider) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.45,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    color: Colors.white.withOpacity(0.25)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.26,
                            child: CustomText(
                              textName: wallName!.toUpperCase(),
                              softWrap: true,
                              textOverflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              letterSpacing: 2,
                              textColor: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.24,
                            child: CustomText(
                              textName: catName!.toUpperCase(),
                              softWrap: true,
                              textOverflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              textColor: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
