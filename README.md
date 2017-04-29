# Firebase Pagination for iOS

Resource code for Hedgehog Labs Pagination iOS [tutorial](http://example.com/).
A sample of different pagination methods using Firebase Queries.

<br>
## File Structure

In this repository you can find two Xcode projects:

+ _begin_ - this folder contains the Xcode project to follow along the tutorial.
+ _end_ - this folder contains the Xcode project with the final result of the tutorial.

<br>
## Initial Setup

1. Download this Repository by clicking "Clone", "Download" or use Git
2. Open in the terminal the folder containing the Xcode project you want to use (begin or end) and install the project pod libraries by typing: ``$ pod install```
3. Open the ```fb pagination.xcworkspace```
4. Create a new Firebase project in the Firebase console
5. To add the Injustice themed app to a firebase project, use the bundleID from the Xcode project
6. Download the generated ```GoogleService-Info.plist``` file, and copy it to the root directory of the app.

<br>
### Database Configuration

1. Download the databse sample json [here](here)
2. Import the json to your firebase database
here is the end result
3. Grant the required permissions and indexes to the app  by changing the database rules in the firebase console

```json
{
    "rules": {
        ".read": "true",
        ".write": "auth != null",
        "players":{
            ".indexOn":"ranking"
        }
    }
}
```

<br>
### Community

If you need some help you can find us via [Discord](here) and you can find more turorials in our [Youtube Channel](here).
