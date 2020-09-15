
import 'package:flutter/widgets.dart';

enum MagicIndicatorSize {
  tiny,
  normal,
  full,
  round,
}

class MagicIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;
  final MagicIndicatorSize indicatorSize;
  final double radius;
  const MagicIndicator(
      {@required this.indicatorHeight,
      @required this.indicatorColor,
      @required this.indicatorSize
        , this.radius=0});

  @override
  _MagicPainter createBoxPainter([VoidCallback onChanged]) {
    return new _MagicPainter(this, onChanged);
  }
}

class _MagicPainter extends BoxPainter {
  final MagicIndicator decoration;

  _MagicPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    Rect rect;
    if (decoration.indicatorSize == MagicIndicatorSize.full) {
      rect = Offset(offset.dx,
              (configuration.size.height - decoration.indicatorHeight ?? 3)) &
          Size(configuration.size.width, decoration.indicatorHeight ?? 3);
    } else if (decoration.indicatorSize == MagicIndicatorSize.normal) {
      rect = Offset(offset.dx + 6,
              (configuration.size.height - decoration.indicatorHeight ?? 3)) &
          Size(configuration.size.width - 12, decoration.indicatorHeight ?? 3);
    } else if (decoration.indicatorSize == MagicIndicatorSize.tiny) {
      rect = Offset(offset.dx + configuration.size.width / 2 - 8,
              (configuration.size.height - decoration.indicatorHeight ?? 3)) &
          Size(16, decoration.indicatorHeight ?? 3);
    }else if(decoration.indicatorSize == MagicIndicatorSize.round){
      rect = Offset(offset.dx,
          (configuration.size.height - decoration.indicatorHeight ?? 3)) &
      Size(configuration.size.width, decoration.indicatorHeight ?? 3);
    }

    final Paint paint = Paint();
    paint.color = decoration.indicatorColor ?? Color(0xff1967d2);
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndCorners(rect,
            topRight: Radius.circular(decoration.radius), topLeft: Radius.circular
              (decoration.radius),bottomRight: Radius.circular(decoration
                .radius),bottomLeft: Radius.circular(decoration.radius)),
        paint);
  }
}
