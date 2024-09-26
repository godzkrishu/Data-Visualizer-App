
---

# Flutter Chart App with Riverpod State Management

## Overview

This project is a **Flutter application** that fetches and displays data from APIs in a chart format using the **Syncfusion Flutter Charts** package. The app also utilizes **Riverpod** for state management to handle data fetching and state updating efficiently.

### Key Features
- Fetches road data and job training data from government APIs.
- Uses **StateNotifier** and **Riverpod** for state management.
- Displays fetched data in interactive charts using **Syncfusion Charts**.
- Manages API requests, handles errors, and ensures efficient data updates.

---

## Table of Contents
1. [Technologies Used](#technologies-used)
2. [Installation](#installation)
3. [App Structure](#app-structure)
4. [How to Run](#how-to-run)
5. [API Information](#api-information)
6. [License](#license)

---

## Technologies Used

- **Flutter** (Dart SDK)
- **Riverpod** (for State Management)
- **Syncfusion Charts** (for Data Visualization)
- **HTTP** (to handle API requests)
- **JSON** (for parsing API responses)

---

## Installation

To get started with the project:

1. **Clone the repository:**

   ```bash
   https://github.com/godzkrishu/Data-Visualizer-App.git
   cd Data-Visualizer-App
   ```

2. **Install dependencies:**

   Run the following command in the project directory to install all the required packages.

   ```bash
   flutter pub get
   ```

3. **Setup API access:**

   The app uses two APIs for data fetching. Make sure you have access to these APIs or adjust the URLs in the `fetchdata.dart` file.

4. **Run the app:**

   You can run the app on a connected device or emulator by using:

   ```bash
   flutter run
   ```

---

## App Structure

The app follows a **simple, modular structure**:

```bash
lib/
├── controllers/
│   └── fetchdata.dart       # Contains the logic to fetch data from APIs
├── models/
│   ├── roaddata.dart        # Model for Road Data fetched from API
│   └── seekhoKamaouData.dart # Model for Job Training Data fetched from API
├── screens/
│   └── chartscreen.dart    # This Showdata of the Pm Gram Sadak yojna Data(Line Chart)
    |_ SikhoKamaoScreen.dart #Show data of Kamao Sikho Yojna(BAr Chart)
    |_HomeScreen()         #HomeScreem 
├── main.dart                # App entry point
```

### Key Files

- `fetchdata.dart`: Contains the logic for fetching the data using HTTP requests and managing state with Riverpod.
- `chart_screen.dart`: This Showdata of the Pm Gram Sadak yojna Data using line Chart
- `SikhokamaoScreen.dart`: This Show data of Kamao Sikho Yojna using  Bar Chart
- `homeScreen.dart`: This is main Screen
- 
- `roaddata.dart` & `seekhoKamaouData.dart`: These files define the models for parsing the API responses.

---

## How to Run

1. **Ensure Flutter is installed** on your machine. You can follow [Flutter installation instructions](https://flutter.dev/docs/get-started/install).
   
2. **Clone the repo** and navigate to the project directory.

   ```bash
    https://github.com/godzkrishu/Data-Visualizer-App.git
   cd Data-Visualizer-App
   ```

3. **Install the required dependencies** by running:

   ```bash
   flutter pub get
   ```

4. **Run the app** on a connected device or emulator:

   ```bash
   flutter run
   ```

---

## API Information

The app fetches data from two APIs:

1. **Road Data API**:
   - URL: `https://api.data.gov.in/resource/d4361151-6d41-43c7-98cd-9a6cd90b5ca4?api-key=YOUR_API_KEY&format=json&limit=50`
   - Model: `RoadData`
   
2. **Job Training Data API**:
   - URL: `https://api.data.gov.in/resource/71dafc8e-5b40-4797-aa94-84e456e3ff49?api-key=YOUR_API_KEY&format=json&limit=1000`
   - Model: `SikhoKamaoData`

Make sure to replace `YOUR_API_KEY` with your actual API key.


## Author

- **Krishna Chauhan** – *Developer*

You can reach out to me at:
- [GitHub](https://github.com/godzkrishu)
- [Email](mailto:sandhya756507@gmail.com)

---
