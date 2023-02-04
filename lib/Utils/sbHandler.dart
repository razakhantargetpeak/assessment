import 'package:flutter/cupertino.dart';

///[Sb] give you support for adding a fixed space or a custom space width and height, which can be added and used any where in rows, Column and etc.
// ignore: must_be_immutable
class Sb extends StatelessWidget {
  final bool _top;
  final bool _custom;

  ///[height] height should be passed in double or else it will be 0px
  double? height;

  ///[width] height should be passed in width or else it will be 0px
  double? width;

  ///[Sb.h2] give space of fixed height 2px
  static SizedBox h2 = const SizedBox(height: 2);

  ///[Sb.h3] give space of fixed height 3px
  static SizedBox h3 = const SizedBox(height: 3);

  ///[Sb.h5] give space of fixed height 5px
  static SizedBox h5 = const SizedBox(height: 5);

  ///[Sb.h10] give space of fixed height 10px
  static SizedBox h10 = const SizedBox(height: 10);

  ///[Sb.h15] give space of fixed height 15px
  static SizedBox h15 = const SizedBox(height: 15);

  ///[Sb.h20] give space of fixed height 20px
  static SizedBox h20 = const SizedBox(height: 20);

  ///[Sb.h40] give space of fixed height 40px
  static SizedBox h40 = const SizedBox(height: 40);

  ///[Sb.h80] give space of fixed height 80px
  static SizedBox h80 = const SizedBox(height: 80);

  ///[Sb.w5] give space of fixed width 5px
  static SizedBox w5 = const SizedBox(width: 5);

  ///[Sb.w10] give space of fixed width 10px
  static SizedBox w10 = const SizedBox(width: 10);

  ///[Sb.w15] give space of fixed width 15px
  static SizedBox w15 = const SizedBox(width: 15);

  ///[Sb.w20] give space of fixed width 20px
  static SizedBox w20 = const SizedBox(width: 20);

  ///[Sb.empty] give space of fixed height 0px & width 0px
  static SizedBox empty = const SizedBox();

  ///Sb._top() this Method gives you the space of [safeArea] from _top.
  Sb.top({Key? key})
      : _top = true,
        _custom = false,
        super(key: key);

  ///Sb.bottom() this Method gives you the space of [safeArea] from bottom.
  Sb.bottom({Key? key})
      : _top = false,
        _custom = false,
        super(key: key);

  ///Sb._custom() this Method gives you the ease to create _custom space.
  Sb.custom({Key? key, this.height, this.width})
      : _top = false,
        _custom = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _custom
        ? SizedBox(
            key: key,
            height: height,
            width: width,
          )
        : SizedBox(
            key: key,
            height: _top
                ? MediaQuery.of(context).padding.top
                : MediaQuery.of(context).padding.bottom,
          );
  }
}
