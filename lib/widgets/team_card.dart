import 'package:final_pro/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/team_model.dart';

class TeamMemberCard extends StatelessWidget {
  final TeamMember member;

  const TeamMemberCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      color: kLightBlue,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(member.imageUrl),
            ),
            const SizedBox(height: 10),
            Text(
              member.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xff0a1034)),
            ),
            Text(
              member.role,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              member.bio,
              style: const TextStyle(fontSize: 16,color: Color(0xff0a1034)),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.person,color: Color(0xff0a1034),),
                  onPressed: () async {
                    await _launchUrl(member.getLinkedin());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.facebook,color: Color(0xff0a1034),),
                  onPressed: () async {
                    await _launchUrl(member.getFacebook());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url,
        mode: LaunchMode.externalApplication)) {
      throw "can not open url";
    }
  }
}
