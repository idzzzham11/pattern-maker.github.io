# Pattern Maker Studio - Flutter App

A comprehensive Flutter application for clothing pattern drafting, converted from the original HTML/JavaScript version. This app helps students and hobbyists create custom clothing patterns based on body measurements and style preferences.

## Features

- **Step 1: Measurements Input**
  - Enter body measurements (bust, waist, hip, shoulder width, etc.)
  - Support for both centimeters and inches
  - Save multiple profiles

- **Step 2: Style Selection**
  - Choose from multiple neckline styles (Round, V-Neck, Square, Sweetheart, Boat, Scoop)
  - Select collar types (No Collar, Shirt Collar, Peter Pan, Mandarin, Shawl)
  - Pick bodice styles (Basic Fitted, Dart Front, Princess Line, Wrap Style, Peplum)
  - Choose sleeve options (Sleeveless, Short, Long, Puff, Bell, Cap)
  - Select skirt types (Straight, A-Line, Flared, Pleated, Gathered, Pencil)

- **Step 3: Technical Drawing & Pattern Notes**
  - Generates a technical drawing of the garment based on measurements and selections
  - Provides step-by-step pattern drafting instructions in Malay
  - Includes professional sewing tips and reminders

## Project Structure

```
pattern_maker_app/
├── lib/
│   ├── main.dart                          # App entry point
│   ├── models/
│   │   └── pattern_models.dart            # Data models for measurements and styles
│   ├── screens/
│   │   └── pattern_maker_screen.dart      # Main screen with step management
│   ├── widgets/
│   │   ├── step_indicator.dart            # Step progress indicator
│   │   ├── measurement_form.dart          # Form for entering measurements
│   │   ├── style_selection.dart           # Style selection interface
│   │   └── preview_and_notes.dart         # Preview and instructions display
│   ├── painters/
│   │   ├── style_icon_painter.dart        # Custom painter for style icons
│   │   └── garment_preview_painter.dart   # Custom painter for garment preview
│   └── utils/
│       └── pattern_instructions.dart      # Pattern instruction generator
├── pubspec.yaml
└── README.md
```

## How to Run

1. **Install Flutter**
   - Follow the official Flutter installation guide: https://flutter.dev/docs/get-started/install

2. **Get Dependencies**
   ```bash
   cd pattern_maker_app
   flutter pub get
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

   For web:
   ```bash
   flutter run -d chrome
   ```

   For Android/iOS:
   ```bash
   flutter run -d <device_id>
   ```

## Key Differences from HTML Version

### Architecture
- **State Management**: Uses StatefulWidget with local state management
- **Rendering**: Custom painters replace HTML Canvas API
- **Navigation**: PageView with PageController for smooth transitions between steps
- **Styling**: Flutter widgets and themes instead of CSS/Tailwind

### Custom Painters
The app uses two main custom painters:

1. **StyleIconPainter**: Draws icons for each style option
   - Handles 30+ different style variations
   - Uses Flutter's Canvas API for drawing

2. **GarmentPreviewPainter**: Creates the technical garment drawing
   - Calculates proportions based on actual measurements
   - Draws complete garment with all selected styles
   - Includes measurement lines and labels

### Responsive Design
- Uses MediaQuery for responsive layouts
- Adapts to different screen sizes
- Scrollable content areas for smaller screens

## Technical Details

### Models
- **Measurements**: Stores all body measurements with validation
- **StyleSelections**: Tracks selected styles for each category
- **StyleOptions**: Static lists of available style options

### Widgets
- **StepIndicator**: Visual progress indicator with animated transitions
- **MeasurementForm**: Form with validation for body measurements
- **StyleSelection**: Grid of selectable style cards with hover effects
- **PreviewAndNotes**: Split view showing garment preview and instructions

### Painters
- **StyleIconPainter**: Renders 120x120 icons for each style option
- **GarmentPreviewPainter**: Renders full technical drawing with:
  - Proportional scaling based on measurements
  - Dynamic garment outline
  - Style-specific details (necklines, collars, sleeves, etc.)
  - Measurement annotations
  - Labels and titles

## Customization

### Colors
Main colors are defined in `main.dart`:
- Primary: `Color(0xFFa78bfa)` (purple)
- Secondary: `Color(0xFF8b5cf6)` (darker purple)
- Background: `Color(0xFFfef3c7)` (cream)

### Fonts
The app uses the default system font. To add Inter font:
1. Download Inter font files
2. Add to `fonts/` directory
3. Update `pubspec.yaml` fonts section
4. Use in theme: `fontFamily: 'Inter'`

### Adding New Styles
To add new style options:
1. Add to `StyleOptions` in `pattern_models.dart`
2. Add drawing logic in `StyleIconPainter`
3. Add drawing logic in `GarmentPreviewPainter`
4. Add instructions in `PatternInstructions`

## Future Enhancements

- [ ] Export pattern to PDF
- [ ] Save and load profiles
- [ ] More measurement options
- [ ] Imperial/metric conversion
- [ ] Print-ready pattern pieces
- [ ] Multi-language support
- [ ] Dark mode theme
- [ ] Pattern sharing

## License

This is a converted version of the original HTML Pattern Maker Studio.

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature requests.
