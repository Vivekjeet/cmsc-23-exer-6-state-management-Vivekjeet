# CMSC 23 Exercise 06: *State Management*

### *Name*: <br> Vivekjeet Singh Chambal
### *Student Number*: <br> 2021 - 11782
### *Degree Program*: <br> BS Computer Science
### *Section*: <br> CMSC 23 UV1L
#
### *Application Description*:
This is an basic online shopping app that implements typical features, namely add to cart, checkout, and payment.
##
### *Code Concept Breakdown*:
- Flutter's Provider package was used to dynamically update the necessary values and UI based on the interaction of the user with the app, namely choosing the items to buy and adding them to the cart, via the ChangeNotifier class. Context.watch() was used for data that gets updated, which also uses Consumers which allows for rebuilding only the parts of the application that change due to the changes picked up by context.watch() whenever there is a call to notifylisteners(). Context.read() was also used to access the currently available state values or methods. This whole setup allowed for better state management as all the pages retrieve the necessary state data directly from provider instead of passing it on one by one throughout the widget tree.
##
### *Challenges while Developing the Application*:
- State management using Flutter's Provider package was intuitive to implement, but quite abstract to grasp conceptually at first. I had some questions that neede clarification, and after finding some helpful materials and visualizations from the internet, I was able to understand how state management with Provider works in Flutter.