import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/pixel_container.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildFilters(),
            const SizedBox(height: 24),
            _buildDateDivider('YEAR 2023, MOON 10, DAY 24'),
            const SizedBox(height: 16),
            _buildTransactionItem(
              title: 'Buy Health Potion',
              subtitle: "Apothecary 'CVS'",
              amount: '- 15.50 G',
              time: '14:30',
              icon: Icons.local_pharmacy,
              iconBgColor: AppColors.surface,
              iconBorderColor: AppColors.errorContainer,
              iconColor: AppColors.error,
              amountColor: AppColors.error,
            ),
            const SizedBox(height: 16),
            _buildTransactionItem(
              title: 'Quest Reward',
              subtitle: "Guild Payout 'Salary'",
              amount: '+ 2,500.00 G',
              time: '09:00',
              icon: Icons.monetization_on,
              iconBgColor: AppColors.surface,
              iconBorderColor: AppColors.tertiaryContainer,
              iconColor: AppColors.tertiary,
              amountColor: AppColors.tertiary,
            ),
            const SizedBox(height: 24),
            _buildDateDivider('YEAR 2023, MOON 10, DAY 23'),
            const SizedBox(height: 16),
            _buildTransactionItem(
              title: 'Tavern Feast',
              subtitle: "Inn 'Burger King'",
              amount: '- 12.00 G',
              time: '19:45',
              icon: Icons.restaurant,
              iconBgColor: AppColors.surface,
              iconBorderColor: AppColors.secondaryContainer,
              iconColor: AppColors.secondary,
              amountColor: AppColors.error,
            ),
            const SizedBox(height: 16),
            _buildTransactionItem(
              title: 'New Armor Set',
              subtitle: "Merchant 'Uniqlo'",
              amount: '- 45.99 G',
              time: '15:20',
              icon: Icons.checkroom,
              iconBgColor: AppColors.surface,
              iconBorderColor: AppColors.primaryContainer,
              iconColor: AppColors.primary,
              amountColor: AppColors.error,
            ),
            const SizedBox(height: 32),
            _buildLoadMoreButton(),
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
                      width: 40,
                      height: 40,
                      pixelSize: 4,
                      border: Border.all(color: AppColors.tertiary, width: 2),
                      backgroundColor: AppColors.surfaceContainer,
                      boxShadow: const [
                        BoxShadow(color: Colors.black, offset: Offset(2, 2)),
                      ],
                      child: Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCt3zUNNHTM3yVDyI1wunFYGb4uSafX5GvlDNdENq4KIQaMy_j5RREkc7h-Vd_2y-ITbRDnaVdztNmtNKAtu56Upft5VIYLs7BdRcb2HfBjJkiAeDZdsb6_COXQAACTMSI9IJ5N04Vn6qu0BGEgDZNyh2MuhS09NlOSM2VklsG4Mcxl_80IRz75TzspcmSxa_susSRSuh8UJTJnoTTfrU6Kvwzpb_nDWwykLWzSU0w04WfDnKWOhywnMbYyiSqx-haKrEi-gXWQVxeY',
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.none,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'QUEST & COIN',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.tertiary,
                    letterSpacing: -0.5,
                  ),
                ),
                Container(
                  color: AppColors.primaryContainer,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    children: const [
                      Icon(Icons.stars, color: AppColors.primary, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'LVL 12',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.menu_book, color: AppColors.tertiary, size: 24),
            SizedBox(width: 8),
            Text(
              'THE QUEST LOG',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 2,
          color: AppColors.surfaceVariant,
        ),
        const SizedBox(height: 8),
        const Text(
          'A chronicle of deeds, spoils, and squandered loot.',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildFilters() {
    return PixelContainer(
      backgroundColor: AppColors.surfaceContainer,
      border: Border.all(color: AppColors.outlineVariant, width: 2),
      pixelSize: 4,
      boxShadow: const [BoxShadow(color: Colors.black, offset: Offset(4, 4))],
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: AppColors.secondaryContainer,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: const [
                Icon(Icons.filter_list, color: AppColors.secondary, size: 16),
                SizedBox(width: 4),
                Text(
                  'All Logs',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.surfaceVariant,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: const [
                Icon(Icons.sort, color: AppColors.onSurfaceVariant, size: 16),
                SizedBox(width: 4),
                Text(
                  'Sort: Date',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateDivider(String date) {
    return Row(
      children: [
        Expanded(child: Container(height: 4, color: AppColors.surfaceVariant)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            border: Border.all(color: AppColors.surfaceVariant, width: 1),
          ),
          child: Text(
            date,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.tertiaryFixedDim,
            ),
          ),
        ),
        Expanded(child: Container(height: 4, color: AppColors.surfaceVariant)),
      ],
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String subtitle,
    required String amount,
    required String time,
    required IconData icon,
    required Color iconBgColor,
    required Color iconBorderColor,
    required Color iconColor,
    required Color amountColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        border: Border(
          top: BorderSide(color: Color(0xFF9C8D8B), width: 2),
          left: BorderSide(color: Color(0xFF9C8D8B), width: 2),
          bottom: BorderSide(color: Color(0xFF504442), width: 2),
          right: BorderSide(color: Color(0xFF504442), width: 2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          PixelContainer(
            width: 48,
            height: 48,
            pixelSize: 4,
            backgroundColor: iconBgColor,
            border: Border.all(color: iconBorderColor, width: 2),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: amountColor,
                ),
              ),
              Text(
                time,
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
    );
  }

  Widget _buildLoadMoreButton() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.tertiaryFixedDim, width: 2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: const Text(
          'Read Further...',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.tertiary,
          ),
        ),
      ),
    );
  }
}
