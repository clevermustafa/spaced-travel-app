import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  final double dotSize = 13;
  final double spacing = 40;
  const DotIndicator({Key? key, required this.count, this.currentIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double lineWidth = (count - 1 * spacing) + (dotSize * count);
    return Stack(
      fit: StackFit.loose,
      children: [
        Positioned.fill(
          child: Center(
            child: Container(
              height: 3,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 3,
              width: currentIndex * spacing + (dotSize * currentIndex),
              color: Colors.white,
            ),
          ),
        ),
        _buildDots(context),
      ],
    );
  }

  _buildDot(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      width: dotSize,
      height: dotSize,
      margin: index != count - 1 ? EdgeInsets.only(right: spacing) : null,
    );
  }

  Widget _buildDots(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) => _buildDot(context, index)),
    );
  }
}
