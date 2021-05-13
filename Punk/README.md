### Bonus

[*] As a bonus this app will work on MacOS as well.
[*] Swiftlint will link code if it's installed
[*] Error state support. To check change this line of code to `page: 0` in `API.swift` file -- API pagination
    starts from 1 and throw and error otherwise.

    ```
    init(offset: Int = 1, limit: Int = 20) {
    ```
[*] SwiftUI preview for light and dark modes



### ToDos

In a reason it's a simple app some things made without future scalability in mind. But I will mention it here:

- Good to add some kind of Dependency Injection to do not pass AppState model to all depending objects.

- Full support of url encode in PathGenerator. Right now it's support only one case when requesting bunch of beers by
    it's id with `.joined(separator: "%7C")`. More complex API calls need full support of data encoding.

- Unit / UI testing :/
