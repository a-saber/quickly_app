import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quickly_app/features/register/presentation/views/widgets/packages/packages_view.dart';

class SlidingPackages extends StatelessWidget {
  const SlidingPackages({Key? key, required this.slidingAnimation}) : super(key: key);
  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context,_) {
          return SlideTransition(
              position: slidingAnimation,
              child: const PackagesView()
          );
        }
    );
  }
}


