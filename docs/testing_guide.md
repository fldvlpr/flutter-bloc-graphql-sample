# Flutter Testing Guide

This document serves as a reference for writing tests in this Flutter project using `flutter_test`, `mocktail`, and `bloc_test`.

## 1. The AAA Pattern (Arrange, Act, Assert)
Every good unit test follows this structure to remain readable and predictable:

- **Arrange:** Set up the initial state and prepare your mocks (e.g., "When the provider is called, force it to return this specific fake data").
- **Act:** Execute the actual method you want to test.
- **Assert:** Verify that the result matches what you expected.

## 2. Mocking with `mocktail`

### What is a Mock and Why Do We Need It?
Imagine you are filming a movie. Your lead actor is the `PostRepository`. But the script requires the actor to jump out of a burning building. You wouldn't risk hurting your real actor—you use a **stunt double**.

In testing, a mock (like `MockPostProvider`) is the stunt double for the real class. It looks exactly like the real provider, but all of its methods do absolutely nothing by default.

We must use mocks for three reasons:
1. **Isolation:** A "Unit Test" tests **one** unit of code in isolation. If we tested the repository with the real provider, we wouldn't know which class caused a bug if the test failed.
2. **Speed & Reliability:** Real providers talk to the internet. Tests must run in milliseconds and be 100% reliable, even without Wi-Fi.
3. **Controlling Scenarios:** With a mock, we can easily force an error (like a 500 Server Error) to see how our code handles the "sad path". You can't easily force a real server to crash on demand.

### Mocks vs Stubs vs Fakes (What's the difference?)
You will often hear developers use the words "Mock", "Stub", and "Fake". They are related but serve entirely different purposes in testing:

1. **A Mock (Verifying Interaction)**
   - **What it is:** The fake *object* (The stunt double itself). It looks exactly like the real class, but does absolutely nothing by default. 
   - **When to use it:** You use a Mock when you care about *Behavioral Testing*. You want to verify that a specific function was called, how many times it was called, and what arguments were passed to it. 
   - **Example:** You want to verify that `deletePost('1')` was actually executed when the user clicked the delete button.
   ```dart
   class MockPostProvider extends Mock implements PostProvider {}
   
   // Verifying the mock was interacted with
   verify(() => mockProvider.deletePost('1')).called(1);
   ```

2. **A Stub (Controlling State)**
   - **What it is:** The fake *behavior* (or script) you give to a Mock. 
   - **When to use it:** You use a Stub when you care about *State Testing*. You need to force a dependency to return a specific piece of data (or throw an error) so you can test how your code handles that specific scenario.
   - **Example:** You want to test how your UI handles a network failure. You "stub" the provider to throw an exception, then check if the UI draws an error banner.
   ```dart
   // Stubbing the behavior (giving the stunt double a script)
   when(() => mockProvider.getPosts(page: 1, limit: 10)).thenThrow(Exception('Server Crash'));
   ```

3. **A Fake (General Testing vs Mocktail)**
   
   **In General Software Testing:**
   A Fake is a fully working implementation of a class, but it takes "shortcuts" making it unsuitable for production. 
   - *Example:* Instead of using a real `SqlDatabase` that saves to a hard drive, you create a `FakeDatabase` that just saves data into a simple Dart `List` in memory. It actually works (you can save and read data), but it deletes everything when the app closes. You use Fakes when the real implementation is too slow, too expensive, or requires a complex setup.

   **In Mocktail (The Null-Safety Problem):**
   While the above is true generally, in the context of Mocktail, Fakes are often used as "Dummy Props" to solve Dart Null Safety errors.
   
   **The `any()` Problem in Mocktail:**
   Sometimes you want to verify that a mock was called, but you don't care *what* exact data was passed to it. You just want to say "Verify it was called with *any* event."
   ```dart
   // We want to ensure no events were added to the BLoC during a validation failure
   verifyNever(() => mockBloc.add(any())); 
   ```
   Because Dart is **Null Safe**, the `any()` function cannot simply return `null` under the hood when simulating a non-nullable parameter (like a required `PostFormEvent`). If `any()` returned null, Dart would instantly crash your test with a `TypeError`.

   **The Fake Solution:**
   To prevent this crash, Mocktail requires you to register a "Fallback Value". This is a completely empty, useless dummy object (a `Fake`) whose only purpose in life is to be temporarily passed around by `any()` to keep Dart's null-safety compiler happy. It is never actually executed or interacted with.

   **Step-by-Step Example of using a Fake:**
   ```dart
   // 1. Create the empty dummy Fake class
   class FakePostFormEvent extends Fake implements PostFormEvent {}

   void main() {
     // 2. Register the Fake as a fallback value BEFORE any tests run
     setUpAll(() {
       registerFallbackValue(FakePostFormEvent());
     });

     testWidgets('validation fails', (tester) async {
       // ... trigger a form validation failure on the screen ...

       // 3. Now you can safely use any()! Under the hood, Mocktail temporarily 
       // passes your FakePostFormEvent into the add() function to avoid null errors.
       verifyNever(() => mockBloc.add(any()));
     });
   }
   ```

### When and What Classes to Mock (The Dependency Rule)
It can be confusing to know *what* to mock. The golden rule is simple: **You mock whatever the class you are testing depends on (via Dependency Injection).**

If a **Car** depends on an **Engine**, you mock the **Engine** when testing the **Car**.

Here is how that rule applies to our entire Flutter architecture:
- **Testing the Repository:** The Repository depends on the Provider. Therefore, **mock the Provider**.
- **Testing the BLoC:** The BLoC depends on the Repository. Therefore, **mock the Repository**.
- **Testing the UI (Widget Test):** The UI depends on the BLoC. Therefore, **mock the BLoC**.

**How to decide what to mock vs what to use directly:**
1. **ALWAYS Mock:** Anything that touches the outside world or has complex logic. This includes API clients, GraphQL providers, local databases (Hive/SharedPreferences), and other architecture layers (like Repositories when testing BLoCs).
2. **NEVER Mock:** Pure data models (like `Post`, `String`, `int`). Just create real instances of these (`final post = Post(title: 'Real');`) because they have no behavior and don't talk to the internet, making them perfectly safe to use in tests.

By following this rule, you ensure you are only ever testing one layer of your app at a time!

### Mocktail Syntax Cheat Sheet

**Creating a Mock Class:**
```dart
// You simply extend Mock and implement the class you want to fake. No code generation needed!
class MockPostProvider extends Mock implements PostProvider {}
```

**Arranging a Mock (The `when` keyword):**
You act as the director and tell the stunt double what to do when a specific method is called.
```dart
// Syntax: when(() => mockObject.methodName()).thenAnswer((_) async => fakeResult);

// Example (Future/Async):
when(() => mockProvider.getPosts(page: 1, limit: 10))
    .thenAnswer((_) async => fakeSuccessResponse);

// Example (Throwing an error):
when(() => mockProvider.getPosts(page: 1, limit: 10))
    .thenThrow(Exception('Server Crash'));
```

**Verifying a Mock (The `verify` keyword):**
At the end of your test (in the Assert phase), you check to make sure the repository actually talked to the provider.
```dart
// Syntax: verify(() => mockObject.methodName()).called(numberOfTimes);

// Example: Ensure getPosts was called exactly 1 time
verify(() => mockProvider.getPosts(page: 1, limit: 10)).called(1);

// Example: Ensure a method was NEVER called
verifyNever(() => mockProvider.deletePost('1'));
```

## 3. Test Lifecycle Methods
- `setUp()`: A function that runs *before every single test*. Used to initialize fresh instances of your classes and mocks so tests don't share state and interfere with each other.
- `group()`: Used to organize multiple related tests together logically.

---
*(Divider: Everything above is for Unit Tests, everything below is for Widget Tests)*
---

## 4. Widget Testing the UI

Widget tests are a step above unit tests. Instead of testing pure logic, they test what actually gets drawn on the screen by rendering the UI in an invisible, headless environment.

### Important Concepts for Widget Testing
1. **`pumpWidget()`**: Because there is no real phone screen, `tester.pumpWidget()` is a special function that builds the UI in the testing environment. You always wrap the widget you are testing in a `MaterialApp` so that it has access to themes and navigation.
2. **`pumpAndSettle()`**: If your UI has animations, loading spinners, or `ListViews` that take time to render, `tester.pumpAndSettle()` waits for all those animations to finish before moving on.
3. **`find`**: Once the UI is built, you use "finders" to search the screen. 
   - `find.text('Posts')` searches for specific text.
   - `find.byType(CircularProgressIndicator)` searches for specific widgets.

### What to Stub in Widget Tests (The BLoC Rule)
In modern Flutter architecture, the UI almost always depends on a BLoC or a Provider. Because of the **Dependency Rule**, if you are testing a Screen, you **must mock its BLoC**.

When mocking a BLoC for a widget test, there are **two things you must always stub**:

1. **Stub the `stream` (Required by flutter_bloc):**
   Under the hood, a BLoC is essentially just a continuous `Stream` of states. When you use a `BlocBuilder` in your UI, it immediately subscribes to the BLoC's `stream` so it knows exactly when to redraw the screen.
   
   Because our `mockBloc` is a fake stunt double, its internal stream is entirely broken/null by default. If we don't stub it, `BlocBuilder` will try to listen to a null stream and crash the entire test! By writing the code below, we are just handing `BlocBuilder` a safe, empty stream so it doesn't complain.

   In simple words, you can understand as below as well.
   Under the hood, a BLoC is just a continuous `Stream` of states. When you use `BlocBuilder` in your UI, it immediately subscribes to the BLoC's `stream`. Since our mocked stunt double doesn't have a real stream, we must hand `BlocBuilder` a safe, empty stream so it doesn't crash the test.
   ```dart
   when(() => mockBloc.stream).thenAnswer((_) => const Stream.empty());
   ```

2. **Stub the `state` (To control the UI):**
   This is how we control what the UI renders! We tell the mock BLoC to pretend it is in a specific state (like loading or success), and then we verify that the UI draws the correct widgets.
   ```dart
   // Example: Force the UI to draw the loading spinner
   when(() => mockBloc.state).thenReturn(const PostListState.loading());
   ```

### Important Matchers and Assertions (Across all tests)
When writing your `expect()` statements, you often need to check more than just simple equality. Flutter test provides powerful matchers:
- **`isA<Type>()`**: Checks if an object is of a specific class. Used heavily in the Data Layer to verify that JSON parsing returns the correct model. (e.g., `expect(result, isA<Post>());`)
- **`throwsA(isA<Exception>())`**: Used for testing the **sad path** (failure cases). It verifies that calling a specific function throws an error, rather than crashing the test itself. 
  ```dart
  expect(() => repository.getPostById('1'), throwsA(isA<Exception>()));
  ```
  *(Note: You must wrap the function call in an anonymous closure `() =>` for `throwsA` to be able to catch the error safely!)*

---
*(Divider: Everything below is specifically for BLoC Testing)*
---

## 5. Testing the BLoC Layer (`bloc_test`)

The `bloc_test` package provides a highly readable, specialized syntax for testing streams and state management.

### The `blocTest` Anatomy
Instead of manually adding events and listening to the stream, `blocTest` manages the entire lifecycle for you:

1. **`build`**: This is where you prepare your BLoC and any mocked dependencies. It must return the instance of the BLoC you are testing.
2. **`act`**: This is where you trigger the action. You add an Event to the BLoC here.
3. **`expect`**: This is the most powerful part. You define an exact list (array) of states that you expect the BLoC to emit, **in perfect chronological order**. 
4. **`verify`**: (Optional) Just like regular tests, you can verify that the underlying repository was called correctly.

```dart
blocTest<PostDetailBloc, PostDetailState>(
  'description of the test',
  build: () {
    // 1. Arrange mocks
    return PostDetailBloc(repository: mockRepo); // Return the BLoC
  },
  act: (bloc) => bloc.add(const PostDetailEvent.fetch('1')), // 2. Add event
  expect: () => [
    const PostDetailState.loading(), // 3. Expect Loading first
    const PostDetailState.loaded(mockPost), // Then Loaded
  ],
);
```

## 6. Simulating User Interaction in Widget Tests

While testing UI rendering is great, the true power of widget testing comes from interacting with the screen just like a real user.

### Entering Text and Tapping Buttons
You can use the `tester` object to physically type into forms and click buttons:

1. **`tester.enterText(finder, text)`**: Simulates a user typing on their keyboard. You must find the specific `TextFormField` first.
2. **`tester.tap(finder)`**: Simulates a physical finger tap on the screen.
3. **`tester.pump()`**: **CRITICAL STEP!** After you tap a button or type text, the screen state changes. However, the test environment does not automatically redraw the screen! You must call `await tester.pump()` (or `pumpAndSettle()`) to force Flutter to render the new frame before you can `expect` to see any visual changes.

**Example: Testing Form Validation**
```dart
testWidgets('shows validation error when form is submitted empty', (tester) async {
  await tester.pumpWidget(createWidgetUnderTest());

  // 1. Find the submit button
  final submitButton = find.text('Create');

  // 2. Tap it WITHOUT entering any text
  await tester.tap(submitButton);

  // 3. Force the screen to redraw so the error messages appear
  await tester.pump(); 

  // 4. Verify the form validation messages appeared on screen
  expect(find.text('Title is required'), findsOneWidget);
  expect(find.text('Body is required'), findsOneWidget);
});
```

## 7. What to Test (and What to Skip)

As a beginner, a common trap is trying to write a unit test for absolutely every single file in your project. This is a waste of time. You should base your decisions on the **Value vs. Effort Rule**.

### Why didn't we test the `PostProvider`?
The `PostProvider` has one job: taking a string (a GraphQL query) and firing it into the internet. 
To unit test it, we would have to create a massive, complex mock of the `GraphQLClient` and the internet itself. 

If we mock the internet, we aren't really testing anything useful. If the backend team completely changes the GraphQL schema tomorrow, our `PostProvider` unit test would **still pass** (giving us a false sense of security) because we mocked the old response! 

### The Restaurant Analogy
Think of your Flutter app as a restaurant:

1. **The BLoC (The Waiter):** Takes orders from the user, handles complaints, and brings the food to the table. **Must Test.** It holds the core logic and state of your app.
2. **The Repository (The Chef):** Takes raw ingredients and turns them into a finished Meal (a Dart Model). **Must Test.** It ensures bad ingredients (errors) are thrown away and good ingredients are parsed correctly.
3. **The Provider (The Delivery Truck):** Blindly drives raw boxes from the farm (the internet) to the kitchen. **Skip Unit Testing.** The only true way to test if the truck works is to actually talk to the farm. Mocking the farm provides no value.
4. **The UI (The Dining Room):** Where the user sits. **Highly Recommended to Test.** You want to ensure the chairs aren't broken and the menu is readable.

### The Golden Rule of Thumb
- **Core Logic (BLoCs / ViewModels):** 100% MUST test.
- **Data Parsing & Coordination (Repositories):** MUST test. This proves your data mapping works.
- **UI (Widget Tests):** HIGHLY recommended for main user flows (like form validation).
- **Network Clients (Providers / API Classes):** SKIP unit testing. If you want to test these, write an "Integration Test" that talks to a real staging server. Mocking network clients takes massive effort for very little reward.
- **Data Models (like `Post`):** If they only have a `fromJson` factory, your Repository test already tests them. If they have complex custom logic (e.g., `post.isExpired()`), you should write a small test for them.
