import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text(
              'Clear all',
              style: TextStyle(color: primaryColor, fontSize: 14),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) => _buildNotiItem(
            title: notifications[index].title,
            subTitle: notifications[index].subTitle,
            isRead: notifications[index].isRead,
            onPressed: (context) {
              deleteNoti(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: greyContent),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.delete,
                            size: 20,
                            color: greyContent,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Notification Deleted',
                            style: TextStyle(fontSize: 17, color: greyContent),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNotiItem({title, subTitle, isRead, onPressed}) {
    return Column(
      children: [
        Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: onPressed,
                icon: Icons.delete,
                backgroundColor: Colors.red,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: !isRead ? primaryColor : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            subTitle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 16,
                              color: greyContent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '12:54 PM',
                      style: TextStyle(fontSize: 14, color: greyContent),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: greyColor,
          margin: const EdgeInsets.only(bottom: 16.0),
        )
      ],
    );
  }

  void deleteNoti(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }
}
