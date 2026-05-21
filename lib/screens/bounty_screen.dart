import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BountyScreen extends StatelessWidget {
  const BountyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E2723), // Wood texture base
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildBoardHeader(),
            const SizedBox(height: 32),
            _buildTabs(),
            const SizedBox(height: 32),
            _buildBountiesGrid(),
            const SizedBox(height: 48),
            _buildPostButton(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(64),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.surfaceContainerHigh,
          border: Border(
            bottom: BorderSide(color: AppColors.outlineVariant, width: 4),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceVariant,
                        border: Border.all(color: AppColors.outlineVariant, width: 2),
                        boxShadow: const [
                          BoxShadow(color: Colors.black, offset: Offset(2, 2)),
                        ],
                      ),
                      child: Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuAty-HfbsJH1wqxMmVr4ic-v5z0c3PqNZroZS0GWVvMUx9r5pxWaFcmZ95oURQ8EKZJcfr4S6nuyVsHhSBc4b7sCfTknkLXETF6OjPSQq0i6sJV5111ZuCJifk9l8PTKJQabBc858uZj3bOFFg8W7jVr6x_GZTb1A3tRp8jRzyT-jhiTtLohAkfo7MiJqxFHk0r4m_5YcdG25mdHWIH-8JfLpfuz5K_ebumOCw1GWc2N11heTBVy8NAd-ScSO718JKa5I77Sw31cs0E',
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.none,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'QUEST & COIN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.tertiary,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'LVL 12',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.tertiaryFixed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBoardHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        border: Border.all(color: AppColors.outlineVariant, width: 4),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        children: const [
          Text(
            'THE BOUNTY BOARD',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.tertiary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Track your debts and claims.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primaryContainer,
            border: Border.all(color: AppColors.tertiary, width: 4),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: const Text(
            'WANTED: ME',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.tertiary,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            border: Border.all(color: AppColors.outlineVariant, width: 4),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: const Text(
            'WANTED: OTHERS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBountiesGrid() {
    return Column(
      children: [
        Transform.rotate(
          angle: -0.02,
          child: _buildWantedPoster(
            title: 'For Unpaid Tavern Tab',
            target: 'The Barkeep',
            amount: '50 G',
            icon: Icons.person,
            status: 'ACTIVE',
            isCleared: false,
          ),
        ),
        const SizedBox(height: 32),
        Transform.rotate(
          angle: 0.03,
          child: _buildWantedPoster(
            title: 'Potion Supplies',
            target: 'Alchemist',
            amount: '120 G',
            icon: Icons.science,
            status: 'CLEARED',
            isCleared: true,
          ),
        ),
      ],
    );
  }

  Widget _buildWantedPoster({
    required String title,
    required String target,
    required String amount,
    required IconData icon,
    required String status,
    required bool isCleared,
  }) {
    return Opacity(
      opacity: isCleared ? 0.7 : 1.0,
      child: ColorFiltered(
        colorFilter: isCleared
            ? const ColorFilter.matrix([
                0.2126, 0.7152, 0.0722, 0, 0,
                0.2126, 0.7152, 0.0722, 0, 0,
                0.2126, 0.7152, 0.0722, 0, 0,
                0, 0, 0, 1, 0,
              ]) // Grayscale approximation
            : const ColorFilter.mode(Colors.transparent, BlendMode.multiply),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.tertiaryFixed, // Parchment color
            border: Border.all(
                color: isCleared ? AppColors.outline : AppColors.onTertiaryFixed,
                width: 4),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(8, 8),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: -24,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceVariant,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.onSurface, width: 2),
                  ),
                  child: Center(
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: AppColors.onSurface,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    'WANTED',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onTertiaryFixed,
                      decoration: isCleared ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: AppColors.onPrimaryFixedVariant, width: 2),
                      ),
                    ),
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      title.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.onPrimaryFixedVariant,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant,
                      border: Border.all(
                        color: isCleared
                            ? AppColors.outline
                            : AppColors.onTertiaryFixed,
                        width: 4,
                      ),
                    ),
                    child: Icon(icon, color: AppColors.onSurfaceVariant, size: 40),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'TARGET: $target',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onTertiaryFixed,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: isCleared
                            ? AppColors.onTertiaryFixed
                            : AppColors.errorContainer,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        amount,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isCleared
                              ? AppColors.onTertiaryFixed
                              : AppColors.errorContainer,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: isCleared
                          ? AppColors.secondaryContainer
                          : AppColors.errorContainer,
                      border: Border.all(
                        color: isCleared
                            ? AppColors.secondaryFixed
                            : AppColors.onError,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: isCleared
                            ? AppColors.onSecondaryContainer
                            : AppColors.onErrorContainer,
                      ),
                    ),
                  ),
                ],
              ),
              if (isCleared)
                Positioned.fill(
                  child: Center(
                    child: Transform.rotate(
                      angle: 0.2, // ~12 degrees
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: AppColors.surface.withValues(alpha: 0.8),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.error, width: 4),
                          ),
                          child: const Text(
                            'PAID',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.error,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.secondaryContainer,
        border: Border.all(color: AppColors.onSecondaryFixedVariant, width: 4),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.post_add, color: AppColors.secondaryFixed),
          SizedBox(width: 8),
          Text(
            'POST NEW BOUNTY',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryFixed,
            ),
          ),
        ],
      ),
    );
  }
}
