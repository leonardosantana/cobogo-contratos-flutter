import 'package:fcobogo_contratos/blocs/contract_bloc.dart';
import 'package:fcobogo_contratos/model/contract.dart';
import 'package:fcobogo_contratos/ui/common/contract_summary.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {

  @override
  void initState() {
    
    super.initState();
    contract_bloc.getContracts();
    
  }

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder<List>(
      
      stream: contract_bloc.subject.stream,
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          
          if (snapshot.data == null){
            return _buildErrorWidget("Erro ao inicializar dados");
          }
          return _buildContractsWidget(snapshot.data);

        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Loading data from API..."), CircularProgressIndicator()],
        ));
    
  }

  Widget _buildErrorWidget(String error) {
    
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error occured: $error"),
          ],
        ));
    
  }

  Widget _buildContractsWidget(List contracts){

    return Expanded(
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
