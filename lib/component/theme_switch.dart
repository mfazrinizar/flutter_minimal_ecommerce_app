import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/theme_provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    final isDark = provider.isDark;
    return GestureDetector(
      onTap: provider.toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 56,
        height: 28,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isDark ? Colors.grey[700] : Colors.orangeAccent,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: isDark ? 28 : 0,
              right: isDark ? 0 : 28,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, anim) =>
                    RotationTransition(turns: anim, child: child),
                child: isDark
                    ? const Icon(Icons.nightlight_round,
                        key: ValueKey('moon'), color: Colors.white, size: 20)
                    : const Icon(Icons.wb_sunny,
                        key: ValueKey('sun'), color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
