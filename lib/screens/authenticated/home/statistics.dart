import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Covid_Norge/services/API.dart';
import 'package:Covid_Norge/shared/app_localization.dart';

class _StatisticsState extends State<Statistics> with WidgetsBindingObserver {
  var areas = [];
  bool result;
  bool sort;
  int totalAreas = 0;
  int totalInfected = 0;
  int totalDead = 0;
  int totalRecovered = 0;

  int showSelectedBox = 0;
  bool selectedSortBool;
  int selectedSortIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    sort = false;
    selectedSortIndex = 0;
    fetchSavedData();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.resumed:
        fetchSavedData();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (result != null) {
      return DataTable(
          columnSpacing: 25,
          sortColumnIndex: selectedSortIndex,
          sortAscending: sort,
          columns: [
            DataColumn(
                label: Text(AppLocalizations.of(context).translate("county_")),
                numeric: false,
                onSort: (columnIndex, ascending) {
                  if (selectedSortIndex != 0) {
                    setState(() {
                      selectedSortIndex = 0;
                      sort = !sort;
                    });
                  } else {
                    setState(() {
                      sort = !sort;
                    });

                    onSortCoulumCount(columnIndex, ascending);
                  }
                }),
            DataColumn(
                label:
                    Text(AppLocalizations.of(context).translate("infected_")),
                numeric: true,
                onSort: (columnIndex, ascending) {
                  if (selectedSortIndex != 1) {
                    setState(() {
                      selectedSortIndex = 1;
                      sort = !sort;
                    });
                  } else {
                    setState(() {
                      sort = !sort;
                    });
                    onSortColumnNumbers(columnIndex, ascending, "infected");
                  }
                }),
            DataColumn(
                label: Text(AppLocalizations.of(context).translate("dead_")),
                numeric: true,
                onSort: (columnIndex, ascending) {
                  if (selectedSortIndex != 2) {
                    setState(() {
                      selectedSortIndex = 2;
                      sort = !sort;
                    });
                  } else {
                    setState(() {
                      sort = !sort;
                    });
                    onSortColumnNumbers(columnIndex, ascending, "dead");
                  }
                }),
            DataColumn(
                label:
                    Text(AppLocalizations.of(context).translate("recovered_")),
                numeric: true,
                onSort: (columnIndex, ascending) {
                  if (selectedSortIndex != 3) {
                    setState(() {
                      selectedSortIndex = 3;
                      sort = !sort;
                    });
                  } else {
                    setState(() {
                      sort = !sort;
                    });
                    onSortColumnNumbers(columnIndex, ascending, "recovered");
                  }
                }),
          ],
          rows: [
            for (var area in areas)
              DataRow(cells: [
                DataCell(Text(area['county'])),
                DataCell(Text(area["infected"].toString())),
                DataCell(Text(area["dead"].toString())),
                DataCell(Text(area["recovered"].toString())),
              ]),
            DataRow(cells: [
              DataCell(Text(
                totalAreas.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              DataCell(Text(
                totalInfected.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              DataCell(Text(
                totalDead.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              DataCell(Text(
                totalRecovered.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ])
          ]);
    } else {
      return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ));
    }
  }

  onSortCoulumCount(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        areas.sort((a, b) =>
            a["county"].toLowerCase().compareTo(b["county"].toLowerCase()));
      } else {
        areas.sort((a, b) =>
            b["county"].toLowerCase().compareTo(a["county"].toLowerCase()));
      }
    }
  }

  onSortColumnNumbers(int columnIndex, bool ascending, String listParameter) {
    if (ascending) {
      areas.sort((a, b) => a[listParameter].compareTo(b[listParameter]));
    } else {
      areas.sort((b, a) => a[listParameter].compareTo(b[listParameter]));
    }
  }

  void fetchSavedData() async {
    var areaList = await getAreaData();
    if(areaList != -1){
      for (var area in areaList) {
        if (area["infected"] != 0) {
          areas.add(area);
          totalAreas++;
          totalInfected += area["infected"];
          totalDead += area["dead"];
          totalRecovered += area["recovered"];
        }
      }
      areas.sort((a, b) =>
          b["county"].toLowerCase().compareTo(a["county"].toLowerCase()));
      setState(() {
        result = true;
      });
    }else{
      fetchSavedData();
    }
    
  }
}

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => new _StatisticsState();
}
