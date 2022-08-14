# florence-test-submission

This repository contains the refactored todo app. Please see
the list of fixes/improvements below. Feedback from reviewing the code would be much appreciated.

# Bug fixes and best practices implemented:
- Removed all unused packages
- Null safety implemented
- All code refactored into folders for easy access
- Named routes used for easy access for navigation
- FutureBuilder used to fetch the todo list, CircularProgress indicator shows when data is being fetched
- Used BloC state management package to manage state and separate business logic
- All widgets are now stateless to improve performance
- Repository provider used for the network client, makes it obvious where all the http requests are made and makes it possible to call from each cubit
- Try/Catch blocks used on Futures to catch network/request errors
- Snackbar separated into a cubit - makes it possible to show a snackbar update from anywhere in the UI if needed
- Todo list made into a cubit so access is available anywhere in the code if needed
- Data is now passed through each cubit and not to each widget through the Navigator.push... makes the logic scalable
- Null error solved when Navigating back from the edit screen

# Future Improvements:
- Toast messages to users to show if an edit has been made successfully or not
- A stream could be used to fetch updates automatically when changes to the database have been made
- Tick box next to each todo to check if it has been done or not
- Offline caching of todos to access list offline
