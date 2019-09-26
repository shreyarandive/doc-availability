# doc-availability
## See which doctor is available today

This app takes raw json data with information about the doctors that are available today and displays the them in a tableview in appropriate categories.

* JSON contains:
```
Unique id
Name of the doctor
License information
Doctor since date (seconds from epoch)
Shift information (start time and duration in seconds from midnight format)
```

MVVM design pattern is used.

### How it works:
* Takes the json and parses it using json Decodables and DateFormatter, Date, and Calender extensions
* View models modifies the parsed data according to the views
* Enums are used to maintain app state


