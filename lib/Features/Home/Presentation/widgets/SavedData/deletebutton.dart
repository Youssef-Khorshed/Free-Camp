import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Core/util/AlertDialog.dart';
import 'package:flutter_application_camp/Features/Home/Data/Model/countryModel.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Entity/counteyEntity.dart';
import 'package:flutter_application_camp/Features/Home/Presentation/widgets/SavedData/saved.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Logic/providerCountry.dart';

class DeleteButton extends ConsumerWidget {
  final List<CountryEntity> posts;
  final List<bool> itemindex;
  DeleteButton({super.key, required this.posts, required this.itemindex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mycubit = ref.watch(countr_cubit);

    mycubit.getcashedata(query: 'key');
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: ElevatedButton(
          onPressed: () async {
            posts.isNotEmpty
                ? showDialog(
                    context: context,
                    builder: (_) => message(
                          message: 'Are you sure to delete selected items',
                          context: context,
                          cancel: true,
                          onPressed: () {
                            fun(mycubit: mycubit, context: context);
                          },
                        ))
                : null;
          },
          child: Text('Delete')),
    );
  }

  void fun(
      {required MyCountryProvider mycubit,
      required BuildContext context}) async {
    mycubit.clearCash();
    for (int i = 0; i < posts.length; i++) {
      if (!itemindex[i]) {
        await mycubit.cashdata(
            country: CounteryModel(
                name: posts[i].name,
                capital: posts[i].capital,
                currency: posts[i].currency,
                phone: posts[i].phone));
      }
    }
    await mycubit.getcashedata(query: 'key');
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => SavedData(
                posts: mycubit.getSaved,
              )),
    );
  }
}
