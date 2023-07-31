import 'package:flutter/material.dart';

class ImagesContainer extends StatelessWidget {
  const ImagesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
      ),
      itemCount: 10,
      itemBuilder: (context, int index) {
        return Transform.translate(
          offset: Offset(0, index % 2 != 0 ? 20 : 0),
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
              image: DecorationImage(
                image: AssetImage("assets/images/evento1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
