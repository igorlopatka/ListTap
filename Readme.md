# DaftMobile Internship

## iOS: List Tap!

#### Main Goal

Create a simple (single screen) iOS Swift list app. The app screen is presented below:

![Screenshot](https://daftmobile-static.s3.eu-central-1.amazonaws.com/recruitment/s1.png)

> You can see all the functionality in [this video](https://daftmobile-static.s3.eu-central-1.amazonaws.com/recruitment/recruitment-internship.mp4).

---

#### Features

- START button at the bottom
- All collection elements have two properties: color and number
- Each **red** element's displayed value is multiplied by 3
- Each **blue** element has it's exact value displayed
- There are line separators between elements
- There is no separator below the last element
- Tapping an element adds the model value of the element before it in the collection (modulo number of elements in the collection)
- Pressing **START** starts a timer which ticks once every second and changes the button to a **STOP** button
- Each timer tick runs the following logic:

```
if numberOfElements < 5 then
  appendRandomElement
else
  50% chance -> increment random element
  30% chance -> reset random element counter
  10% chance -> delete random element
  10% chance -> add the model value of the element before it in the collection (modulo number of elements in the collection)
endif
```

#### Hints

- Code functionality is as important as its architecture
- Use `SwiftUI` or `UIKit` with `UICollectionView`
- Use Storyboards or write your views from code – it doesn't matter
- Use any external libraries that you want
- Do not copy code without mentioning the author

#### Delivery

Deliver your solution via this repository. Push your commits to the `main` branch.

#### The following elements will be reviewed:

- Implementing all listed funcionalities
- Applying the given design
- Coding style
- Code clarity
- Code architecture
- Code extensibility
- Code testability
- Tests
- System API usage
- Used libraries and frameworks
- Attention to detail
- Unit tests would be a plus (if applicable)

---

# Good luck! 👩‍💻💪