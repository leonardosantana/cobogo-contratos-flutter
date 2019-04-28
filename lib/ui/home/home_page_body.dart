import 'package:fcobogo_contratos/model/contract.dart';
import 'package:fcobogo_contratos/ui/common/contract_summary.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        color: new Color(0xFF736AB7),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverFixedExtentList(
                itemExtent: 152.0,
                delegate: new SliverChildBuilderDelegate(
                      (context, index) => new ContractSummary(contracts[index]),
                  childCount: contracts.length,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}