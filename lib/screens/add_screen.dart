import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/pixel_container.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String _currentAmount = "0";
  bool _isExpense = true;
  String _selectedCategory = 'Rations';

  void _appendNumber(String num) {
    setState(() {
      if (_currentAmount == "0" && num != "00") {
        _currentAmount = num;
      } else if (_currentAmount == "0" && num == "00") {
        return;
      } else {
        if (_currentAmount.length < 9) {
          _currentAmount += num;
        }
      }
    });
  }

  void _clearAmount() {
    setState(() {
      if (_currentAmount.length > 1) {
        _currentAmount = _currentAmount.substring(0, _currentAmount.length - 1);
      } else {
        _currentAmount = "0";
      }
    });
  }

  String _getFormattedAmount() {
    final value = int.tryParse(_currentAmount) ?? 0;
    // Simple thousands separator
    String result = value.toString();
    result = result.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCl3z4OnxspLywvGnQfFy5g16sv1ZsUk-OxnBJeCKFpkSdqt0XAyc-yyJGdqasbCW3JiT-oYL4XnD2UX2iSFnNpP0lUQwQ6B7-zlM9IzKYQ60yBnSaoNx9HW_RPjqw-dB3aKZahMbr0Vq2lTf1AlkGnWpcf4KmmnkrAl7X6zIntAMIxPBq2CHapVLDe7q3usl2Tjd1XiyGL1JtqW8FkWtJP8XDZk2_gCA8B1SLWIgSIEzhyfJnbNuMWSNlyV8h4mvDM2KrEi816qLyM',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(color: AppColors.surface.withValues(alpha: 0.7)),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: _buildModal(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModal() {
    return PixelContainer(
      backgroundColor: AppColors.surfaceContainerHigh,
      border: Border.all(color: AppColors.outline, width: 4),
      padding: const EdgeInsets.all(16),
      boxShadow: const [
        BoxShadow(color: AppColors.surfaceContainerLowest, offset: Offset(4, 4)),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildToggle(),
          const SizedBox(height: 16),
          _buildAmountDisplay(),
          const SizedBox(height: 16),
          _buildCategorySelector(),
          const SizedBox(height: 24),
          _buildKeypad(),
          const SizedBox(height: 24),
          _buildCommitButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(Icons.close, color: AppColors.onSurfaceVariant),
          ],
        ),
        const Text(
          'RECORD ACTION',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.tertiary,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'LOG YOUR QUEST PROGRESS',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildToggle() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        border: Border.all(color: AppColors.outline, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToggleButton(
            label: 'SPEND (HP)',
            isActive: _isExpense,
            activeColor: AppColors.error,
            activeBg: AppColors.errorContainer.withValues(alpha: 0.2),
            onTap: () => setState(() => _isExpense = true),
          ),
          _buildToggleButton(
            label: 'EARN (MP)',
            isActive: !_isExpense,
            activeColor: AppColors.primary,
            activeBg: AppColors.primaryContainer.withValues(alpha: 0.4),
            onTap: () => setState(() => _isExpense = false),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton({
    required String label,
    required bool isActive,
    required Color activeColor,
    required Color activeBg,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? activeBg : Colors.transparent,
          border: Border.all(
            color: isActive ? activeColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isActive ? activeColor : AppColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  Widget _buildAmountDisplay() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        border: Border(
          top: BorderSide(color: AppColors.surfaceContainerLowest, width: 4),
          bottom: BorderSide(color: AppColors.outlineVariant, width: 2),
        ),
      ),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          const Text(
            'G',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.tertiary,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            _getFormattedAmount(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.tertiaryFixed,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCategoryItem('Rations', Icons.restaurant, AppColors.primary),
        _buildCategoryItem('Hobbies', Icons.security, AppColors.tertiary),
        _buildCategoryItem('Bills', Icons.shield, AppColors.secondary),
        _buildCategoryItem('Travel', Icons.directions_bus, AppColors.inversePrimary),
      ],
    );
  }

  Widget _buildCategoryItem(String label, IconData icon, Color color) {
    final isSelected = _selectedCategory == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = label),
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryContainer : AppColors.surfaceContainer,
          border: Border.all(
            color: isSelected ? AppColors.tertiary : AppColors.outline,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.tertiary : color,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: isSelected ? AppColors.tertiary : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeypad() {
    return Column(
      children: [
        Row(
          children: [
            _buildKeypadButton('1'),
            const SizedBox(width: 8),
            _buildKeypadButton('2'),
            const SizedBox(width: 8),
            _buildKeypadButton('3'),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildKeypadButton('4'),
            const SizedBox(width: 8),
            _buildKeypadButton('5'),
            const SizedBox(width: 8),
            _buildKeypadButton('6'),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildKeypadButton('7'),
            const SizedBox(width: 8),
            _buildKeypadButton('8'),
            const SizedBox(width: 8),
            _buildKeypadButton('9'),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildKeypadButton('DEL',
                icon: Icons.backspace,
                textColor: AppColors.error,
                onTap: _clearAmount),
            const SizedBox(width: 8),
            _buildKeypadButton('0'),
            const SizedBox(width: 8),
            _buildKeypadButton('00', textColor: AppColors.tertiary),
          ],
        ),
      ],
    );
  }

  Widget _buildKeypadButton(String label,
      {IconData? icon, Color? textColor, VoidCallback? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap ?? () => _appendNumber(label),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            border: Border.all(color: AppColors.outline, width: 2),
          ),
          alignment: Alignment.center,
          child: icon != null
              ? Icon(icon, color: textColor)
              : Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor ?? AppColors.onSurface,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildCommitButton() {
    return GestureDetector(
      onTap: () {}, // Do nothing
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.secondaryContainer,
          border: Border.all(color: AppColors.tertiary, width: 2),
          boxShadow: const [
            BoxShadow(
              color: AppColors.outline,
              offset: Offset(-4, 0),
            ),
            BoxShadow(
              color: AppColors.outlineVariant,
              offset: Offset(4, 0),
            ),
            BoxShadow(
              color: AppColors.surfaceContainerLowest,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.check_circle, color: AppColors.tertiaryFixed),
            SizedBox(width: 8),
            Text(
              'COMMIT ACTION',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.tertiaryFixed,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
