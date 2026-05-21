import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/pixel_container.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTreasuryBalance(),
            const SizedBox(height: 24),
            _buildStatusGauges(),
            const SizedBox(height: 24),
            _buildRecentQuests(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
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
                    PixelContainer(
                      width: 48,
                      height: 48,
                      pixelSize: 4,
                      border: Border.all(color: AppColors.outlineVariant, width: 2),
                      backgroundColor: AppColors.surfaceVariant,
                      child: Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDXPUsHeUIEt38G4-235mz0CKmIKdi4nuZMxhr41rc3itmuy71WAMpTU6fKLwJPjQ7tWHcUKX0VM80lXUNpTsqgYsz0r4BacojMWcMgG32PICMg0vjIx9C7e4esQDjKk_mTLk9seRgp7knYmHF9W_29bsNwWaqgP2_UO7jKZR6z6OjBbFxX-fDgaNPYlV1gfDiwCBtdzCkVju0Gdz2BJiHHlBqDk78xG__tIgYhwdCkHAkUKnE94e4XT_y7olMpinvHYFd8URCzseG6',
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.none, // For pixelated effect
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'QUEST & COIN',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.tertiary,
                            letterSpacing: -1,
                          ),
                        ),
                        Text(
                          'Sir Spendsalot',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                PixelContainer(
                  pixelSize: 4,
                  backgroundColor: AppColors.surfaceVariant,
                  border: Border.all(color: AppColors.outlineVariant, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  boxShadow: const [
                    BoxShadow(color: Colors.black, offset: Offset(2, 2)),
                  ],
                  child: const Text(
                    'LVL 12',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.tertiary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTreasuryBalance() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        border: Border(
          top: BorderSide(color: AppColors.outline, width: 4),
          left: BorderSide(color: AppColors.outline, width: 4),
          bottom: BorderSide(color: AppColors.outlineVariant, width: 4),
          right: BorderSide(color: AppColors.outlineVariant, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'TREASURY BALANCE',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Icon(Icons.monetization_on, color: AppColors.tertiary, size: 40),
                  SizedBox(width: 12),
                  Text(
                    '24,500',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: AppColors.tertiaryFixed,
                      height: 1,
                    ),
                  ),
                  SizedBox(width: 8),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'G',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusGauges() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        border: Border(
          top: BorderSide(color: AppColors.inversePrimary, width: 4),
          left: BorderSide(color: AppColors.inversePrimary, width: 4),
          bottom: BorderSide(color: AppColors.primaryContainer, width: 4),
          right: BorderSide(color: AppColors.primaryContainer, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildGauge(
            label: 'Damage Taken (Spend)',
            icon: Icons.favorite,
            color: AppColors.error,
            value: '4,200 / 5,000 G',
            percentage: 0.84,
          ),
          const SizedBox(height: 16),
          _buildGauge(
            label: 'Mana Gained (Income)',
            icon: Icons.water_drop,
            color: const Color(0xFF8CB6FF),
            value: '5,500 G',
            percentage: 1.0,
          ),
        ],
      ),
    );
  }

  Widget _buildGauge({
    required String label,
    required IconData icon,
    required Color color,
    required String value,
    required double percentage,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 16),
                const SizedBox(width: 4),
                Text(
                  label.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          height: 24,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Stack(
            children: [
              FractionallySizedBox(
                widthFactor: percentage,
                child: Container(
                  color: color,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 2,
                child: Container(
                  color: Colors.white.withValues(alpha: 0.2),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentQuests() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        border: Border(
          top: BorderSide(color: AppColors.outline, width: 4),
          left: BorderSide(color: AppColors.outline, width: 4),
          bottom: BorderSide(color: AppColors.outlineVariant, width: 4),
          right: BorderSide(color: AppColors.outlineVariant, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.outlineVariant, width: 2),
              ),
            ),
            child: const Text(
              'RECENT QUESTS (LOG)',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildTransactionItem(
            title: 'Tavern Feast',
            subtitle: 'Food & Drink',
            amount: '- 150 G',
            icon: Icons.restaurant,
            iconBgColor: AppColors.errorContainer,
            iconColor: AppColors.error,
            amountColor: AppColors.error,
          ),
          const SizedBox(height: 12),
          _buildTransactionItem(
            title: 'Armor Repair',
            subtitle: 'Maintenance',
            amount: '- 450 G',
            icon: Icons.shield,
            iconBgColor: AppColors.surfaceVariant,
            iconColor: const Color(0xFF8CB6FF),
            amountColor: AppColors.error,
          ),
          const SizedBox(height: 12),
          _buildTransactionItem(
            title: 'Bounty Reward',
            subtitle: 'Salary',
            amount: '+ 5,500 G',
            icon: Icons.work,
            iconBgColor: AppColors.secondaryContainer,
            iconColor: AppColors.secondary,
            amountColor: const Color(0xFF8CB6FF),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryContainer,
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary, width: 2),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              elevation: 0,
            ),
            child: const Text(
              'VIEW FULL CHRONICLE',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String subtitle,
    required String amount,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required Color amountColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        border: Border.all(color: AppColors.outlineVariant, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  border: Border.all(color: iconColor, width: 1),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.onSurface,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }
}
