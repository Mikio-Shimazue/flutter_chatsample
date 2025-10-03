import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:chatsample/provider.dart';
import 'package:chatsample/fax/repository/center/center_response_model.dart';

class FaxReceiveListPage extends StatelessWidget {
  const FaxReceiveListPage({Key? key}) : super(key: key);

  static final _searchController = TextEditingController();

  static final timeFormatter = DateFormat("HH:mm");
  static final dateFormatter = DateFormat("HH/dd");
  static final dateTimeFormatter = DateFormat("MM/dd HH:mm");

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
          if (!ref.watch(faxReceiveListIsLoadedProvider)) {
            Future.delayed(const Duration(seconds: 0)).then((_) async {
              //  ここで初期値読み込み処理
              _searchController.text = "";
              ref
                  .read(faxReceiveListIsControllProvider.notifier)
                  .receiveListSearch = _searchController.text;
              ref
                  .read(faxReceiveListIsLoadedProvider.notifier)
                  .state = true;
            });
          }

          return Scaffold(
              appBar: AppBar(
                //  automaticallyImplyLeading: flase
                centerTitle: true,
                backgroundColor: const Color(0xFFC0F1F2),
                title: SizedBox(
                    child: TextField(
                        controller: _searchController,
                        onChanged: (text) {
                          ref
                              .read(faxReceiveListIsControllProvider.notifier)
                              .receiveListSearch = text;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white38,
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Fax受信一覧を検索',
                            suffixIcon: IconButton(
                              onPressed: () {
                                _searchController.text = "";
                                ref
                                    .read(faxReceiveListIsControllProvider
                                    .notifier)
                                    .receiveListSearch = _searchController.text;
                              },
                              icon: const Icon(Icons.clear),)
                        )
                    )
                ),
              ),
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                  top: true,
                  child: !ref.watch(faxReceiveListIsLoadedProvider)
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      : Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: SizedBox(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  child: ListView.builder(
                                    itemCount: ref
                                        .watch(faxReceiveListIsControllProvider)
                                        .receiveList
                                        .length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () {
                                          FaxReceiveItem faxReceiveItem = ref
                                              .read(
                                              faxReceiveListIsControllProvider)
                                              .receiveList[index];

                                          //  リストタップ時処理
                                          /*
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder(BuildContext context) =>
                                              FaReceiveDatailInfoPage(
                                              faxReceiveItem: faxReceiveItem,),
                                          ),);

                                           */
                                        },
                                        leading: createIcon(context, ref),
                                        title: Text(
                                            dateTimeFormatter
                                                .format(ref
                                                .read(
                                                faxReceiveListIsControllProvider)
                                                .receiveList[index]
                                                .receiveDate),
                                            textAlign: TextAlign.left),
                                        subtitle: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Text(ref
                                                  .read(
                                                  faxReceiveListIsControllProvider)
                                                  .receiveList[index]
                                                  .dstTel,
                                                textAlign: TextAlign.left,),
                                            ),

                                            Expanded(
                                              child: Text(ref
                                                  .read(
                                                  faxReceiveListIsControllProvider)
                                                  .receiveList[index]
                                                  .srcTel,
                                                textAlign: TextAlign.right,),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ))
                          ]
                      )
                  )
              )
          );
        }
    );
  }

  static Widget createIcon(BuildContext context, WidgetRef ref) {
    return const Icon(Icons.picture_as_pdf, color: Color(0xFFC0F1F2),);
  }
}