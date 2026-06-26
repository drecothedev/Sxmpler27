
# Sxmpler

Sxmpler is an iOS app that simplifies music sampling by analyzing uploaded audio files to detect their musical key and tempo (BPM). The app performs all analysis on-device using Apple's MusicUnderstanding framework, providing fast results while keeping users' audio private.

## Features

- Import audio files directly from the Files app
- Detect the musical key of a song
- Detect the tempo (BPM)
- On-device audio analysis
- Clean, minimal SwiftUI interface

## Screenshots
/Users/andrejones/Downloads/IMG_3392.jpg
/Users/andrejones/Downloads/IMG_3391.jpg
/Users/andrejones/Downloads/ScreenRecording_06-26-2026 01-28-33_1.mov
/Users/andrejones/Downloads/ScreenRecording_06-26-20262-ezgif.com-video-to-gif-converter.mov
## Technologies

- SwiftUI
- AVFoundation
- MusicUnderstanding
- Swift Concurrency (`async` / `await`)
- Observation

## Architecture

Sxmpler is centered around a `MusicUnderstandingSession`. After a user imports an audio file, the app loads the asset, performs analysis asynchronously, and presents the detected musical key and BPM. The UI reacts to changes in the session state throughout the analysis process.

## Future Improvements

- Interactive waveform playback
- Waveform visualization
- Detection confidence indicators
- Additional musical metadata (energy, sections, genre, etc.)
- Performance optimizations for large audio files

## Installation

1. Clone the repository.
2. Open `Sxmpler.xcodeproj` in Xcode.
3. Build and run on an iOS Simulator or physical device.

## License

This project is provided for educational purposes. Feel free to explore the code and learn from it.
```
