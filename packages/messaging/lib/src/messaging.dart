part of messaging;

class Messaging extends StatelessWidget {
  const Messaging({
    Key? key,
    required this.child,
    this.animationBuilder,
  }) : super(key: key);

  final Widget child;
  final Widget Function(BuildContext, Widget, AnimationController, double)? animationBuilder;

  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.top,
      handleTouch: true,
      animationBuilder: animationBuilder ?? _animationBuilder,
      child: child,
    );
  }

  Widget _animationBuilder(BuildContext context, Widget child, AnimationController controller, double percent) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      )),
      child: child,
    );
  }
}
