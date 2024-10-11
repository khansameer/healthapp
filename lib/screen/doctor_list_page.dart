import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';

import 'package:junohealthapp/provider/auth_provider.dart';
import 'package:junohealthapp/screen/user_card.dart';
import 'package:provider/provider.dart';

class DoctorListPage extends StatelessWidget {
  const DoctorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProviders>(builder: (context, provider, child) {
        return CommonsScreenContainer(
          child: FutureBuilder(
            future: provider.getUserList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: showLoaderList(),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('"": ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data found'));
              }
              List<DocumentSnapshot> documents = snapshot.data!;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data =
                      documents[index].data() as Map<String, dynamic>;
                  return UserCard(data: data);

                },
              );
            },
          ),
        );
      }),
    );
  }
}
