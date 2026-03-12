import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/auth_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().currentUser;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileSection(context, user),
            SizedBox(height: 16),
            _buildSettingsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context, user) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.primary,
            child: Text(
              user?.name[0].toUpperCase() ?? 'U',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            user?.name ?? 'User',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            user?.email ?? '',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.info.withAlpha(25),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              user?.designation ?? '',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.info,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildSettingItem(
            context,
            'Edit Profile',
            Icons.person_outline,
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Edit profile coming soon')),
              );
            },
          ),
          Divider(height: 1),
          _buildSettingItem(
            context,
            'Change Password',
            Icons.lock_outline,
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Change password coming soon')),
              );
            },
          ),
          Divider(height: 1),
          _buildSettingItem(
            context,
            'Notifications',
            Icons.notifications_outlined,
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Notification settings coming soon')),
              );
            },
          ),
          Divider(height: 1),
          _buildSettingItem(
            context,
            'App Settings',
            Icons.settings_outlined,
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('App settings coming soon')),
              );
            },
          ),
          Divider(height: 1),
          _buildSettingItem(
            context,
            'Help & Support',
            Icons.help_outline,
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Help & support coming soon')),
              );
            },
          ),
          Divider(height: 1),
          _buildSettingItem(
            context,
            'About',
            Icons.info_outline,
            () {
              showAboutDialog(
                context: context,
                applicationName: 'ELONA SFA',
                applicationVersion: '1.0.0',
                children: [
                  Text('A comprehensive Sales Force Automation solution'),
                ],
              );
            },
          ),
          Divider(height: 1),
          _buildSettingItem(
            context,
            'Logout',
            Icons.logout,
            () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Confirm Logout'),
                  content: Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.error,
                      ),
                      child: Text('Logout'),
                    ),
                  ],
                ),
              );

              if (confirm == true && context.mounted) {
                await context.read<AuthProvider>().logout();
                Navigator.of(context).pushReplacementNamed('/login');
              }
            },
            textColor: AppColors.error,
            iconColor: AppColors.error,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap, {
    Color? textColor,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? AppColors.primary),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: textColor,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: AppColors.textSecondary),
      onTap: onTap,
    );
  }
}
