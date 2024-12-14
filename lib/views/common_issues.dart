import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mess_management/model/issue.dart';
import 'package:mess_management/services/theme_service.dart';
import 'package:mess_management/view_model/common_issues_view_model.dart';
import 'package:stacked/stacked.dart';

// class CommonIssues extends StatefulWidget {
//   const CommonIssues({super.key});
//
//   @override
//   State<CommonIssues> createState() => _CommonIssuesState();
// }
//
// class _CommonIssuesState extends State<CommonIssues> {
//   // Sample data to simulate trends
//   final List<Map<String, dynamic>> trends = [
//     {'rank': 1, 'title': '#FlutterDev', 'subtitle': '150K upvotes'},
//     {'rank': 2, 'title': '#OpenAI', 'subtitle': '90K upvotes'},
//     {'rank': 3, 'title': 'AI Revolution', 'subtitle': '75K upvotes'},
//     {'rank': 4, 'title': '#TechTrends', 'subtitle': '60K upvotes'},
//     {'rank': 5, 'title': 'Startup Growth', 'subtitle': '45K upvotes'},
//   ];
//
//
// }

class CommonIssues extends StackedView<CommonIssuesViewModel> {
  @override
  CommonIssuesViewModel viewModelBuilder(BuildContext context) =>
      CommonIssuesViewModel();

  @override
  Widget builder(
      BuildContext context, CommonIssuesViewModel viewModel, Widget? child) {
    return Scaffold(
        backgroundColor: ThemeService.primaryAccent,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 14),
                child: Container(
                  color: ThemeService.primaryColor,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 36, 16, 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: Icon(
                                  Icons.menu,
                                  color: ThemeService.secondaryColor,
                                )),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            const Text(
                              'Trending issues',
                              style: TextStyle(
                                color: ThemeService.secondaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 4,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Upvote ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                  children: [
                                    TextSpan(
                                        text: ' for Immediate resolution',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1,
                                            fontSize: 12)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            viewModel.isLoading
                ? SliverToBoxAdapter(
                    child: Center(
                      child: Container(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: ThemeService.primaryColor,
                          )),
                    ),
                  )
                : SliverList.builder(
                    itemCount: viewModel.issues.length,
                    itemBuilder: (context, index) {
                      final trend = viewModel.issues[index];
                      return IssueTile(
                        issueItem: trend,
                        viewModel: viewModel,
                      );
                    },
                  ),
          ],
        ));
  }
}

class IssueTile extends StatefulWidget {
  const IssueTile(
      {super.key, required this.issueItem, required this.viewModel});

  final CommonIssuesViewModel viewModel;
  final Issue issueItem;

  @override
  State<IssueTile> createState() => _IssueTileState();
}

class _IssueTileState extends State<IssueTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Raised by ${widget.issueItem.raisedBy}',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                width: 250,
                child: Text(
                  widget.issueItem.title,
                  // softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              // Row(
              //   children: [
              //     Text(
              //       '${widget.issueItem.upvotes} upvotes',
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 16,
              //           fontWeight: FontWeight.w400),
              //     ),
              //     Text(
              //       ' ${widget.issueItem.downvotes} downvotes',
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 16,
              //         fontWeight: FontWeight.w400,
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          if (widget.viewModel.upvotesSet
                              .contains(widget.issueItem.uid)) {
                            widget.viewModel.removeUpvote(widget.issueItem.uid);
                          } else {
                            widget.viewModel.addUpvote(widget.issueItem.uid);
                          }
                        },
                        icon: Icon(
                          widget.viewModel.upvotesSet
                                  .contains(widget.issueItem.uid)
                              ? Icons.thumb_up_alt
                              : Icons.thumb_up_alt_outlined,
                          color: ThemeService.primaryColor,
                          size: 25,
                        ),
                      ),
                      Text(
                        // '${widget.issueItem.upvotes}K',
                        formatNumber(widget.issueItem.upvotes),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  Column(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          if (widget.viewModel.downvotesSet
                              .contains(widget.issueItem.uid)) {
                            widget.viewModel
                                .removeDownvote(widget.issueItem.uid);
                          } else {
                            widget.viewModel.addDownvote(widget.issueItem.uid);
                          }
                        },
                        icon: Icon(
                          widget.viewModel.downvotesSet
                                  .contains(widget.issueItem.uid)
                              ? Icons.thumb_down_alt
                              : Icons.thumb_down_alt_outlined,
                          color: Colors.red,
                          size: 24,
                        ),
                      ),
                      Text(
                        formatNumber(widget.issueItem.downvotes),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                  // Icon(
                  //   Icons.thumb_up_off_alt,
                  //   color: ThemeService.primaryColor,
                  //   size: 25,
                  // ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  // Icon(
                  //   Icons.thumb_down_off_alt_rounded,
                  //   color: Colors.red,
                  //   size: 25,
                  // )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  String formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    } else {
      return '$number';
    }
  }
}
