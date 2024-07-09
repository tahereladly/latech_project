import 'package:final_pro/components/constant.dart';
import 'package:final_pro/screens/about-app.dart';
import 'package:flutter/material.dart';
import '../models/team_model.dart';
import '../widgets/team_card.dart';

class TeamPage extends StatelessWidget {
  TeamPage({super.key});

  final List<TeamMember> teamMembers = [
    TeamMember(
      name: "SalahEldin Fikri",
      role: "Team Leader",
      bio: "Malware analyzer.",
      imageUrl: "assets/images/team/a.jpeg",
      linkedinUrl:
          "https://w...content-available-to-author-only...n.com/in/salah-eldin-fikri-1ab233218/",
      facebookUrl: "https://www.facebook.com/profile.php?id=100009340171748",
    ),
    TeamMember(
      name: "Rana Mohsen",
      role: "Member",
      bio: "Flutter developer.",
      imageUrl: "assets/images/team/b.jpeg",
      linkedinUrl: "https://www.linkedin.com/in/rana-mohsen-72937b18b/",
      facebookUrl: "https://www.facebook.com/profile.php?id=100002546439630",
    ),
    TeamMember(
      name: "Malak Ali",
      role: "Member",
      bio: "Flutter developer.",
      imageUrl: "assets/images/team/d.jpeg",
      linkedinUrl: "https://www.linkedin.com/in/malak-elngar-20555b210",
      facebookUrl:
          "https://www.facebook.com/profile.php?id=100009459053499&mibextid=D4KYlr",
    ),
    TeamMember(
      name: "Nada Adel",
      role: "Member",
      bio: "Flutter developer.",
      imageUrl: "assets/images/team/c.jpeg",
      linkedinUrl: "https://eg.linkedin.com/in/nada-adel-633899274",
      facebookUrl:
          "https://www.facebook.com/profile.php?id=100012372481567&mibextid=LQQJ4d",
    ),

    // Add more team members here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            color: kPrimaryTextColor,
            icon: Icon(Icons.info),
            iconSize: 28,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => AboutApp()));
            },
          ),
          SizedBox(
            width: 20,
          ),
        ],
        title: const Text(
          'Team Members',
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: kPrimaryTextColor),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: teamMembers.length,
        itemBuilder: (context, index) {
          return TeamMemberCard(member: teamMembers[index]);
        },
      ),
    );
  }
}
