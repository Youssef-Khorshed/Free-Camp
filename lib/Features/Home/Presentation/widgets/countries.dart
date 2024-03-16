import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Core/util/constant.dart';
import 'package:flutter_application_camp/Features/Home/Presentation/Logic/providerCountry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, reef) {
    final cubit = reef.watch(countr_cubit);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Country Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.28),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: cubit.searchController,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: cubit.filteredCountries.isEmpty
                ? Image.network(
                    'https://img.freepik.com/free-vector/ecological-strategy-development-natural-resources-access-ecologists-cartoon-characters_335657-3249.jpg')
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 100),
                    physics: BouncingScrollPhysics(),
                    itemCount: cubit.filteredCountries.length > 10
                        ? 10
                        : cubit.filteredCountries.length,
                    itemBuilder: (context, index) {
                      final country = cubit.filteredCountries[index];
                      return ListTile(
                        title: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            afiracn_countries[Random().nextInt(20)],
                            fit: BoxFit.cover,
                            width: width,
                            height: 200,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              country.name,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            Text('Capital: ${country.capital}'),
                            Text('Currency: ${country.currency}'),
                            Text('Phone: ${country.phone}'),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
