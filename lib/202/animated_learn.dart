import 'package:flutter/material.dart';

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({Key? key}) : super(key: key);

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn> with TickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: _Durations.low,
      reverseDuration: _Durations.low,
      animationBehavior: AnimationBehavior.preserve,
    );
    super.initState();
  }

  bool _isVisible = false;
  bool _isOpacity = false;
  late AnimationController _animationController;

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void toggleOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _animatedCrossFadeText(context),
          ListTile(
            title: _animatedOpacityText(),
            trailing: IconButton(
              onPressed: toggleOpacity,
              icon: const Icon(Icons.precision_manufacturing_rounded),
            ),
          ),
          _animatedTextStyleThemeChanging(context),
          _animatedIcon(),
          _animatedContainer(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleVisibility();
          _animationController.animateTo(_isVisible ? 1 : 0);
        },
        child: const Icon(Icons.legend_toggle),
      ),
    );
  }

  AnimatedContainer _animatedContainer(BuildContext context) {
    return AnimatedContainer(
      duration: _Durations.low,
      height: _isVisible ? 0 : context.getSize.width * 0.2,
      width: context.getSize.height * 0.2,
      color: Colors.accents[3],
      margin: const EdgeInsets.all(20),
    );
  }

  InkWell _animatedIcon() {
    return InkWell(
      onTap: () {
        toggleVisibility();
        _animationController.animateTo(_isVisible ? 1 : 0);
      },
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_home,
        progress: _animationController,
      ),
    );
  }

  AnimatedDefaultTextStyle _animatedTextStyleThemeChanging(BuildContext context) {
    return AnimatedDefaultTextStyle(
      style: (_isVisible ? context.textTheme.headline1 : context.textTheme.subtitle1) ?? const TextStyle(),
      duration: _Durations.low,
      child: const Text('Test'),
    );
  }

  AnimatedOpacity _animatedOpacityText() =>
      AnimatedOpacity(opacity: _isOpacity ? 1 : 0.5, duration: _Durations.low, child: const Text('Hello'));

  AnimatedCrossFade _animatedCrossFadeText(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Container(height: 50, width: 200, color: Colors.red),
      secondChild: Container(height: 100, width: 200, color: Colors.yellow),
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _Durations.low,
      layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              key: bottomChildKey,
              top: 0,
              child: bottomChild,
            ),
            Positioned(
              key: topChildKey,
              child: topChild,
            ),
          ],
        );
      },
    );
  }
}

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
  Size get getSize => MediaQuery.of(this).size;
}

class _Durations {
  static const low = Duration(milliseconds: 500);
}
