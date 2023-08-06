# TODO Mobile App
This is a simple TODO mobile app built using Flutter. The app allows users to create, view, and update tasks. It utilizes Flutter's navigation and routing features to provide a seamless user experience.
![video_2023-08-06_23-08-05_AdobeExpress (1)](https://github.com/dawit-melka/2023-project-phase-mobile-tasks/assets/105089130/8fdac507-cb93-413d-b988-d28eea9a96cd)

## Screens and Functionality
### Home Screen
The home screen displays a list of all tasks. Users can select a task to view its details and make updates.

### Add Task Screen
The "Add Task" screen allows users to input a new task's title and description. Upon submission, the task is added to the list on the home screen.

### Task Detail Screen
The "Edit Task" screen displays the details of a selected task. Users can update the task's title and description and save their changes.

## Running the App
1. Clone the repository to your local machine using the following command:
```
git clone https://github.com/yourusername/todo-mobile-app.git
```
2. Navigate to the project directory:
```
cd todo-mobile-app
```
3. Ensure you have Flutter and Dart installed on your machine.

4. Run the app on an emulator or physical device:
`flutter run`
## Named Routes and Navigation
The app uses named routes for navigation between screens. This approach provides a cleaner and more organized way to handle routing within the app.

### Example of Using Named Routes:
`Navigator.pushNamed(context, '/add-task');`
### Passing Data Between Screens
When adding or editing a task, the user's input is passed between screens using the navigation arguments feature. This ensures that the task data is displayed accurately and consistently throughout the app.

## Navigation Animations
Smooth navigation animations and transitions have been implemented to enhance the user experience. Transitions between screens provide a visually appealing and intuitive flow.

## Handling Navigation Events
The app handles navigation events, such as pressing the back button, to ensure a consistent navigation flow. When the user presses the back button from the add/edit task screen, the app navigates back to the home screen.
