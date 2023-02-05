import 'package:flutter/material.dart';

class PageLearn extends StatefulWidget {
  const PageLearn({Key? key}) : super(key: key);

  @override
  State<PageLearn> createState() => _PageLearnState();
}

class _PageLearnState extends State<PageLearn> {
  final _pageController = PageController(viewportFraction: 1);

  int _currentPageIndex = 0;
  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(_currentPageIndex.toString()),
            ),
            const Spacer(),
            FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(duration: _DurationUtility.durationNormal, curve: Curves.easeIn);
              },
              child: const Icon(Icons.chevron_left),
            ),
            FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(duration: _DurationUtility.durationNormal, curve: Curves.easeOut);
              },
              child: const Icon(Icons.chevron_right),
            ),
          ],
        ),
        body: PageView(
          padEnds: false,
          controller: _pageController,
          onPageChanged: _updatePageIndex,
          children: [
            Container(color: Colors.red),
            Container(color: Colors.blue),
            Container(color: Colors.green),
            Container(color: Colors.grey),
            Container(color: Colors.amber)
          ],
        ));
  }
}

class _DurationUtility {
  // static const durationLow = Duration(seconds: 1);
  static const durationNormal = Duration(milliseconds: 500);
  // static const durationHigh = Duration(milliseconds: 250);
}

/**
 * Androiddeki "viewpager" mantalitesi üzerinde çalışıyor.
 * Bir component veya başka bir page 
 * bu componentin çocukları olabilecek şekilde tasarlanmış.
 * "controller" özelliği sayesinde pagerın % kaçlık alana
 * sahip olması ayarlanıyor. 
 */
