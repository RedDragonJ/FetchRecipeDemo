# FetchRecipe

### Steps to Run the App

#### 1. Clone the repository into your computer
```
git clone https://github.com/RedDragonJ/FetchRecipeDemo.git

or

git clone git@github.com:RedDragonJ/FetchRecipeDemo.git
```

#### 2. Navigate to the folder and open in Xcode
- Open FetchRecipe.xcodeproj in Xcode.
- Ensure you are using the latest version of Xcode compatible with iOS 16 or above.

#### 3. Install Dependencies
- This project uses Swift Package Manager for dependency management.
- Xcode should automatically resolve and download packages. If not, go to File > Packages > Resolve Package Dependencies.

#### 4. Build and Run
- Select the desired simulator or connected device.
- Press Cmd + R or click Run in Xcode to build and launch the app.

#### 5. Testing
- Run unit tests by selecting Product > Test in Xcode or pressing Cmd + U.

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
1. Caching for Images - Prioritized caching mechanisms to minimize network usage and improve performance, ensuring a smooth user experience by loading images efficiently without redundant downloads.

2. Error Handling and User Feedback - Focused on comprehensive error handling, providing clear feedback for network issues, decoding errors, and other exceptions. This approach improves usability and maintains user engagement, even when errors occur.

3. Test Coverage - Ensured extensive test coverage for all major functions, including network calls, sorting, and error handling. This focus maintains code reliability and prevents regressions in future updates.

4. Modularity and Reusability - Organized code into modular components for reusability, allowing easier updates and customization without redundant code, which also improves maintainability.

5. UI/UX Design - Designing a clean and modern interface, with attention to both light and dark mode support for a consistent user experience across themes.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
I spent approximately 1 hour on the initial app architecture and another hour designing the UI. Developing the core functionalities took around 2 hours. An additional 1+ hours were dedicated to finalizing all aspects, including rechecking my work, thoroughly testing functionalities, writing documentation, and making code improvements for readability and maintainability.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
One key trade-off I made was using an existing image caching library to prioritize development speed over implementing a custom caching solution. While a custom solution could offer more control, the existing library allowed me to meet caching requirements efficiently within the given timeframe.

### Weakest Part of the Project: What do you think is the weakest part of your project?
The weakest part of the project is the limited customization in error handling. While I implemented centralized error handling for simplicity, it lacks detailed user feedback for specific errors, which could impact user experience if issues arise. Additionally, relying on a third-party image caching library limits flexibility in cache management, which might not be optimal for specific use cases or performance fine-tuning.

### External Code and Dependencies: Did you use any external code, libraries, or dependencies?
I used SDWebImageSwiftUI for efficient image loading and caching, which helped streamline image management and improve performance by reducing redundant network requests. This library also provides disk caching by default, which aligns well with the project requirements to minimize network usage.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
One challenge was ensuring smooth, seamless image loading while maintaining memory efficiency, particularly with disk-only caching to meet the project requirements. Another consideration was managing view consistency between light and dark modes for optimal user experience. Balancing between responsiveness and performance was essential, especially in handling async data loading and cache management across different views.

The project emphasizes modularity, with reusable components and centralized error handling, making it adaptable for potential future features or expansions. If the app were to handle more complex features or support a larger user base, implementing a clean architecture could provide better scalability and improve testability, ensuring that the app remains maintainable as it grows.

Overall, the structure is designed to scale efficiently, while maintaining simplicity and ease of testing.