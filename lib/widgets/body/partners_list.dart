import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/data.dart';

class PartnersList extends StatefulWidget {
  const PartnersList({Key? key}) : super(key: key);

  @override
  State<PartnersList> createState() => _PartnersListState();
}

class _PartnersListState extends State<PartnersList> {
  Map<String, bool> hovered = {}; // Track hover state for each image
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    // Initialize map with false for all sponsor URLs (not hovered by default)
    for (var url in sponsorsList) {
      hovered[url] = false;
    }
  }

  void _setHovered(String url, bool isHovered) {
    setState(() {
      hovered[url] = isHovered;
    });
  }
  updateVisibility(){
    setState(() {
      isVisible = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("partnersVisibility"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.3 && !isVisible) {
          updateVisibility();
        }
      },
      child: SlideInUp(
        animate: isVisible,
        child: Wrap(
          spacing: 50,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: sponsorsList.map((url) {
            return MouseRegion(
              onEnter: (_) => _setHovered(url, true),
              onExit: (_) => _setHovered(url, false),
              child: GestureDetector(
                onLongPress: () => _setHovered(url, true),
                onLongPressEnd: (_) => _setHovered(url, false),
                child: SizedBox(
                  width: 150,
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: ColorFiltered(
                      colorFilter: hovered[url]== true ? const ColorFilter.mode(
                        Colors.transparent,
                        BlendMode.multiply,
                      ) : const ColorFilter.matrix(
                          [
                            0.2126,0.7152,0.0722,0,0,
                            0.2126,0.7152,0.0722,0,0,
                            0.2126,0.7152,0.0722,0,0,
                            0,0,0,1,0,
                          ]
                      ),
                      child: Image.network(
                        url,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
