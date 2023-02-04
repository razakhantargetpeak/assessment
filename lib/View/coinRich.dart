import 'package:crassesment/DataProvider/coinRichDataProvider.dart';
import 'package:crassesment/Model/coinRichModel.dart';
import 'package:crassesment/Utils/colors.dart';
import 'package:crassesment/Utils/sbHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CoinRich extends StatefulWidget {
  const CoinRich({super.key});

  @override
  State<CoinRich> createState() => _CoinRichState();
}

class _CoinRichState extends State<CoinRich> {
  @override
  void initState() {
    super.initState();
    final coinRichMd =
        Provider.of<CoinRichDataProvider>(context, listen: false);
    coinRichMd.getCoinData(context);
  }

  List<Datum?> modelData = [];

  @override
  Widget build(BuildContext context) {
    final coinRichMd = Provider.of<CoinRichDataProvider>(context);
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: colorBlack,
        elevation: 0,
        title: Text("CoinRich",
            style:
                GoogleFonts.nunito(fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: coinRichMd.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header("Show Cart", coinRichMd.coinRichModel!.data.length),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: ListView.builder(
                        itemCount: coinRichMd.coinRichModel!.data.length,
                        itemBuilder: (context, index) {
                          coinRichMd.coinRichModel!.data.keys.any(
                            (element) {
                              if (element == "BTC" ||
                                  element == "ETH" ||
                                  element == "LTC") {
                                modelData
                                    .add(coinRichMd.coinRichModel!.data["BTC"]);
                                modelData
                                    .add(coinRichMd.coinRichModel!.data["ETH"]);
                                modelData
                                    .add(coinRichMd.coinRichModel!.data["LTC"]);
                                return true;
                              } else {
                                return false;
                              }
                            },
                          );
                          

                          return diplayList(context, index, modelData);
                        }),
                  )
                ],
              ),
            ),
    );
  }

  Widget diplayList(
    BuildContext context,
    int index,
    List<Datum?> data,
  ) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: colorBlack, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data[index]!.name,
                style: GoogleFonts.nunito(
                    color: colorYellow,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  data[index]!
                              .quote
                              .usd
                              .percentChange24H
                              .toStringAsFixed(2)
                              .startsWith('-', 0) ==
                          false
                      ? const Icon(
                          Icons.arrow_upward_outlined,
                          color: colorGreen,
                        )
                      : const Icon(
                          Icons.arrow_downward_outlined,
                          color: colorRed,
                        ),
                  Text(
                    "${data[index]!.quote.usd.percentChange24H.toStringAsFixed(2)} %",
                    style: GoogleFonts.nunito(color: Colors.white),
                  )
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                decoration: BoxDecoration(
                    color: colorBackground,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  data[index]!.symbol.toString(),
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Sb.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price  \$ ${data[index]!.quote.usd.price.toStringAsFixed(2)}",
                style: GoogleFonts.nunito(
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Rank  ${data[index]!.cmcRank.toString()}",
                    style: GoogleFonts.nunito(color: Colors.white),
                  )
                ],
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: colorYellow,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.arrow_forward))
            ],
          ),
        ],
      ),
    );
  }

  Widget header(String title, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.pie_chart,
                    color: colorYellow,
                  ),
                  style: const ButtonStyle(),
                  label: Text("$title",
                      style: GoogleFonts.nunito(color: colorYellow)))
            ],
          ),
          Text(
            "Count : $count",
            style: GoogleFonts.nunito(color: Colors.white),
          )
        ],
      ),
    );
  }
}
