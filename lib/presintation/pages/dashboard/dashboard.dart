// import 'package:eriell/presintation/bloc/users_bloc.dart';
// import 'package:eriell/presintation/pages/login_registration/login_page.dart';
// import 'package:eriell/presintation/widgets/app_text.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../utils/app_colors.dart';
// import '../../bloc/users_event.dart';
// import '../../bloc/users_state.dart';
//
// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);
//
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<UsersBloc>().add(LoadEvent());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => UsersBloc()..add(LoadEvent()),
//         child: BlocBuilder<UsersBloc, UsersState>(
//         builder: (context, state) {
//       return OrientationBuilder(
//           builder: (context, orientation) {
//         return orientation == Orientation.portrait
//             ? Scaffold(
//           appBar: AppBar(
//             backgroundColor: AppColors.primaryColor,
//             leading: IconButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => LoginPage()));
//               },
//               icon: Icon(
//                 Icons.arrow_back_ios_new,
//                 color: Colors.white,
//               ),
//             ),
//             title: AppText(
//               'Dashboard',
//               size: 25,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//             ),
//             centerTitle: true,
//           ),
//           body: SingleChildScrollView(
//             child: Container(
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     child: AppText(
//                       'All users in Uzbekistan ',
//                       color: AppColors.primaryColor,
//                       size: 25,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Center(
//                     child: Container(
//                       height: 360,
//                       width: 360,
//                       child: PieChart(
//                           swapAnimationCurve: Curves.bounceIn,
//                           PieChartData(sections: [
//                             _pieDataWidget(
//                                 title: 'Humo arena',
//                                 color: Colors.orange,
//                                 value: 50,
//                                 count: 50),
//                             _pieDataWidget(
//                                 title: 'Neftegaz',
//                                 color: AppColors.borderColor,
//                                 value: 80,
//                                 count: 80),
//                             _pieDataWidget(
//                                 title: 'Inginiring',
//                                 color: Colors.green,
//                                 value: 60,
//                                 count: 60),
//                             _pieDataWidget(
//                                 title: 'Petroleum',
//                                 color: Colors.red,
//                                 value: 65,
//                                 count: 65),
//                             _pieDataWidget(
//                                 title: 'Daewoo',
//                                 color: Colors.yellow,
//                                 value: 40,
//                                 count: 40),
//                           ])),
//                     ),
//                   ),
//                   if (state is LoadingState)
//                     CircularProgressIndicator()
//                   else if (state is LoadUsersState)
//                     DataTable(
//                       columns: [
//                         DataColumn(label: AppText('ID')),
//                         DataColumn(label: AppText('Name')),
//                         DataColumn(label: AppText('Nick')),
//                         DataColumn(label: AppText('Email'))
//                       ],
//                       rows: state.users.map((user) {
//                         return DataRow(cells: [
//                           DataCell(Text(user.id.toString())),
//                           DataCell(Text(user.name)),
//                           DataCell(Text(user.username)),
//                           DataCell(Text(user.email)),
//                         ]);
//                       }).toList(),
//                     )
//                   else if (state is ErrorState)
//                       AppText('Error: ${state.message}')
//                 ],
//               ),
//             ),
//           ),
//         )
//             : Scaffold(
//           appBar: AppBar(
//             backgroundColor: AppColors.primaryColor,
//             leading: IconButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => LoginPage()));
//               },
//               icon: Icon(
//                 Icons.arrow_back_ios_new,
//                 color: Colors.white,
//               ),
//             ),
//             title: AppText(
//               'Dashboard',
//               size: 25,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//             ),
//             centerTitle: true,
//           ),
//           body: SingleChildScrollView(
//             child: Container(
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     child: AppText(
//                       'All users in Uzbekistan ',
//                       color: AppColors.primaryColor,
//                       size: 25,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 10),
//                     width: double.infinity,
//                     height: 300,
//                     child: DataTable(columns: [
//                       DataColumn(label: AppText('Users')),
//                       DataColumn(label: AppText('Count')),
//                       DataColumn(label: AppText('Users')),
//                       DataColumn(label: AppText('Count'))
//                     ], rows: [
//                       DataRow(cells: [
//                         DataCell(AppText('Text')),
//                         DataCell(AppText('Text')),
//                         DataCell(AppText('Text')),
//                         DataCell(AppText('Text')),
//                       ]),
//                       DataRow(cells: [
//                         DataCell(AppText('Text')),
//                         DataCell(AppText('Text')),
//                         DataCell(AppText('Text')),
//                         DataCell(AppText('Text')),
//                       ]),
//                       DataRow(cells: [
//                         DataCell(AppText('Text')),
//                         DataCell(AppText('Text')),
//                         DataCell(AppText('Text')),
//                         DataCell(AppText('Text')),
//                       ])
//                     ]),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//           },
//       );
//         },
//         ),
//     );
//   }
//
//   PieChartSectionData _pieDataWidget(
//       {required String title,
//         required Color color,
//         required double value,
//         required int count}) {
//     return PieChartSectionData(
//       titlePositionPercentageOffset: 0.6,
//       radius: 180,
//       value: value,
//       title: '$title $value',
//       showTitle: true,
//       color: color,
//       titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//     );
//   }
// }

// import 'package:eriell/presintation/bloc/users_bloc.dart';

import 'package:eriell/presintation/pages/login_registration/login_page.dart';
import 'package:eriell/presintation/widgets/app_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/app_colors.dart';
import '../../bloc/users_bloc.dart';
import '../../bloc/users_event.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,

    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc()..add(LoadEvent()),
      child: BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
        final bloc = BlocProvider.of<UsersBloc>(context);

        return OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? Scaffold(
                    appBar: AppBar(
                      backgroundColor: AppColors.primaryColor,
                      leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      title: AppText(
                        'Dashboard',
                        size: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      centerTitle: true,
                    ),
                    body: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: AppText(
                                'All users in Uzbekistan ',
                                color: AppColors.primaryColor,
                                size: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 360,
                                width: 360,
                                child: PieChart(
                                    swapAnimationCurve: Curves.bounceIn,
                                    PieChartData(sections: [
                                      _pieDataWidget(
                                          title: 'Humo arena',
                                          color: Colors.orange,
                                          value: 50,
                                          count: 50),
                                      _pieDataWidget(
                                          title: 'Neftegaz',
                                          color: AppColors.borderColor,
                                          value: 80,
                                          count: 80),
                                      _pieDataWidget(
                                          title: 'Inginiring',
                                          color: Colors.green,
                                          value: 60,
                                          count: 60),
                                      _pieDataWidget(
                                          title: 'Petroleum',
                                          color: Colors.red,
                                          value: 65,
                                          count: 65),
                                      _pieDataWidget(
                                          title: 'Daewoo',
                                          color: Colors.yellow,
                                          value: 40,
                                          count: 40),
                                    ])),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: AppText(
                                'Users data ',
                                color: AppColors.primaryColor,
                                size: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            state is LoadUsersState ?    Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 4,
                                        offset: Offset(0, 2))
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: DataTable(
                                  horizontalMargin: 13,
                                  columnSpacing: 10,
                                  headingRowHeight: 25,
                                    columns: [
                                    DataColumn(
                                        label: AppText(
                                      'ID',
                                      size: 18,
                                      fontWeight: FontWeight.w600,
                                    )),
                                    DataColumn(label: AppText('Name')),
                                    DataColumn(label: AppText('Nick')),
                                    DataColumn(label: AppText('Email'))
                                  ],
                                  rows:
                                       state.users.map((user) {


                                          return DataRow(
                                              // color: MaterialStateProperty.all(
                                              //     Colors.blue.shade200),
                                              cells: [
                                                DataCell(Container(
                                                    width: 30,
                                                    child: AppText(
                                                      user.id.toString(),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      size: 18,
                                                    ))),
                                                DataCell(Container(
                                                    width: 90,
                                                    child: AppText(
                                                      user.name,
                                                      size: 12,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                    ))),
                                                DataCell(Container(
                                                    width: 90,
                                                    child: AppText(
                                                      user.username,
                                                      size: 12,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                    ))),
                                                DataCell(Container(
                                                    width: 100,
                                                    child: AppText(
                                                      user.email,
                                                      size: 12,
                                                      textOverflow:
                                                          TextOverflow.fade,
                                                    ))),
                                              ]);
                                        }).toList()


                                  ),
                            ): CircularProgressIndicator()
                          ],
                        ),
                      ),
                    ),
                  )
                : Scaffold(
                    // backgroundColor: Colors.grey,
                    appBar: AppBar(
                      backgroundColor: AppColors.primaryColor,
                      leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      title: AppText(
                        'Dashboard',
                        size: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      centerTitle: true,
                    ),
                    body: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: AppText(
                                'Users data',
                                color: AppColors.primaryColor,
                                size: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            state is LoadUsersState ?  Center(
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 4,
                                          offset: Offset(0, 2))
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: DataTable(
                                    horizontalMargin: 13,
                                    columnSpacing: 10,
                                    headingRowHeight: 25,
                                    // headingRowColor: MaterialStateProperty.all(
                                    //     Colors.greenAccent),
                                    columns: [
                                      DataColumn(
                                          label: AppText(
                                        'ID',
                                        size: 18,
                                        fontWeight: FontWeight.w600,
                                      )),
                                      DataColumn(label: AppText('Name',size: 18,
                                        fontWeight: FontWeight.w600,)),
                                      DataColumn(label: AppText('Nick',size: 18,
                                        fontWeight: FontWeight.w600,)),
                                      DataColumn(label: AppText('Email', size: 18,
                                        fontWeight: FontWeight.w600,))
                                    ],
                                    rows:  state.users.map((user) {

                                            return DataRow(
                                                // color: MaterialStateProperty.all(
                                                //     Colors.blue.shade200),
                                                cells: [
                                                  DataCell(Container(
                                                      width: 30,
                                                      child: AppText(
                                                        user.id.toString(),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        size: 18,
                                                      ))),
                                                  DataCell(Container(
                                                      width: 250,
                                                      child: AppText(
                                                        user.name,
                                                        size: 18,
                                                        textOverflow:
                                                            TextOverflow.ellipsis,
                                                      ))),
                                                  DataCell(Container(
                                                      width: 200,
                                                      child: AppText(
                                                        user.username,
                                                        size: 18,
                                                        textOverflow:
                                                            TextOverflow.ellipsis,
                                                      ))),
                                                  DataCell(Container(
                                                      width: 250,
                                                      child: AppText(
                                                        user.email,
                                                        size: 18,
                                                        textOverflow:
                                                            TextOverflow.fade,
                                                      ))),
                                                ]);
                                          }).toList()

                                    ),
                              ),
                            ): CircularProgressIndicator()
                          ],
                        ),
                      ),
                    ),
                  );
          },
        );
      }),
    );
  }

  PieChartSectionData _pieDataWidget(
      {required String title,
      required Color color,
      required double value,
      required int count}) {
    return PieChartSectionData(
        titlePositionPercentageOffset: 0.6,
        radius: 180,
        value: value,
        title: '$title $value',
        showTitle: true,
        color: color,
        titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600));
  }
}
