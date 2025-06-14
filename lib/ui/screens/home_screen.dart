import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/ui/logic/ad/ad_cubit.dart';
import 'package:tu_bolitero/ui/logic/apk_info/apk_info_cubit.dart';
import 'package:tu_bolitero/ui/widgets/ad_modal.dart';
import 'package:tu_bolitero/ui/widgets/apk_info_modal.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return MultiBlocListener(
      listeners: [
        BlocListener<AdCubit, AdState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (ad) {
                showDialog(
                  context: context,
                  builder: (context) => AdModal(screenSize: screenSize, ad: ad),
                );
              },
            );
          },
        ),
        BlocListener<ApkInfoCubit, ApkInfoState>(
          listener: (context, state) {
            state.maybeWhen(
                orElse: () {},
                newVersion: (apkInfo) {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        ApkInfoModal(screenSize: screenSize, apkInfo: apkInfo),
                  );
                });
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        bottomNavigationBar: const BottomBar(index: 0),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                onChanged: (value) {},
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Buscar',
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            FocusScope.of(context).unfocus();
                          },
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
