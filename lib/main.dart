import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

StoryBrain storyBrain = StoryBrain();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Destiny',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.fill,
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
              flex: 4,
              child: Container(
                color: const Color.fromARGB(18, 33, 149, 243),
                height: 100,
                width: 100,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Color.fromARGB(186, 244, 67, 54),
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextButton(
                  child: Text(
                    storyBrain.getChoice1(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                      print("choice1");
                    });
                  },
                ),
              ),
            ),
            Visibility(
              visible: storyBrain.buttonShouldBeVisible(),
              child: Expanded(
                child: Container(
                  color: const Color.fromARGB(123, 76, 175, 79),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextButton(
                    child: Text(
                      storyBrain.getChoice2(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                        print("choice2");
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
