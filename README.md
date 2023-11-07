![README Cover](https://github.com/BaherTamer/DoMatrix/assets/99125691/2281be0e-345b-429b-bc48-ca9be7fb6c30)

<br>

### 🇵🇸 Don't forget to pray for Palestine and the Palestinians

<br>

# 💠 DoMatrix
Welcome to DoMatrix, your go-to to-do list app, designed to help you prioritize and manage your tasks effectively using the [Eisenhower Matrix](https://www.eisenhower.me/eisenhower-matrix/) method. Built with **SwiftData** & **SwiftUI**.

<br>

## 📝 Requirements
`iOS 17.0+` `Xcode 15+`

<br>

## 🚀 Releases
For a detailed list of all DoMatrix releases and their changelogs, check out the [GitHub Releases](https://github.com/BaherTamer/DoMatrix/releases) page. Here you can find information about each version, including new features, improvements, and bug fixes.

<br>

## ▶️ Demo
Check out the demo videos on [YouTube](https://youtube.com/playlist?list=PLPzupE6TLEvuEbMmFhoAemlhTEuaCPjd_&si=n4jwPYDueTPhzYEG) to see DoMatrix in action.

<br>

## 🌟 Features
- Add new tasks with title and urgency/importance toggles, allowing for automatic categorization.
- Mark tasks as completed or not completed, providing a clear overview of your progress.
- Delete tasks with swipe actions and a confirmation dialog, ensures you don't accidentally remove a task.
- Show/hide completed tasks to stay focused on what's important.
- Filter tasks by priority, helping you tackle what matters most based on urgency and importance.

<br>

## 🖼️ Screenshots
| **Tasks List** | **Add Task** | **Filter Tasks** |
| -------------- | ------------ | ---------------- |
| ![All Tasks](https://github.com/BaherTamer/DoMatrix/assets/99125691/0fff7685-4c3d-4c08-8407-33b53742f9cb) | ![Add Task](https://github.com/BaherTamer/DoMatrix/assets/99125691/0c9e1128-6b56-4c49-8486-75e8cbdfe51d) | ![Filter Menu](https://github.com/BaherTamer/DoMatrix/assets/99125691/570d92b3-6d3a-4450-a4e8-08073d5c81ac) |

<br>

## 🛠️ Tools
- Swift
- SwiftUI
- SwiftData
- OSLog

<br>

## 🏗️ Architecture
This app uses MVVM (Model - View - View Model) architectural pattern.

<br>

![MVVM Architectural Pattern](https://github.com/BaherTamer/DoMatrix/assets/99125691/200f90f9-0d2c-4bd9-a60c-bebd3bb835fe)

<br>

## 🗂️ Project Structure

```
    DoMatrix                         # Root Group
    .
    ├── Presentation                 # Organizing views and view-related components
    |   └── Scenes                   # All interface screens
    |       └── Scene                # A scene that represents single screen/feature
    |           ├── Components       # Related components for a scene
    |           ├── Views            # SwiftUI Views for a scene
    |           └── View Models      # View Models for a SwiftUI view
    ├── Models                       # Data models and entities
    ├── Extensions                   # Useful extensions for presentation
    ├── Globals                      # App constants
    └── Resources                    # Contains app assets and resources
```

<br>

## ⚖️ License
DoMatrix is available under the MIT license.

```
    MIT License
    
    Copyright (c) 2023 Baher Tamer
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
```








