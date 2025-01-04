# Distorted Sound Filtering

This project focuses on reconstructing distorted audio signals transmitted through noisy communication channels. The project achieves high-quality audio reconstruction with near-perfect clarity by utilizing advanced digital signal processing techniques, including inverse and notch filters.

## Overview
- **Input**: Distorted audio signal sampled at **48 kHz**.
- **Techniques**:
  - **Inverse Filtering**: Removes distortion caused by the communication channel.
  - **Notch Filtering**: Suppresses unwanted tones at a normalized frequency of **π/4**.
- **Output**: High-fidelity audio signal with minimal noise and distortion.

## Key Features
- Accurate signal reconstruction with **<0.5 dB signal loss**.
- Comprehensive signal analysis through FFT and spectrogram visualizations.
- Export of the reconstructed audio signal as a `.wav` file.

## How It Works
1. **Input Analysis**:
   - Visualize the distorted signal in time and frequency domains.
2. **Filtering**:
   - Apply an inverse filter to remove distortion.
   - Design and implement a notch filter to eliminate noise at **π/4**.
3. **Validation**:
   - Validate the reconstructed signal using spectrograms, phase plots, and magnitude plots.
4. **Output**:
   - Export the reconstructed audio as `output_signal.wav`.

## Hardware and Software
- **Software**:
  - MATLAB
  - Signal Processing Toolbox

## Applications
- Communication systems requiring noise suppression and distortion correction.
- Audio signal processing for enhanced sound quality.

## Results
- Successfully reconstructed distorted audio signals with near-perfect clarity.
- Achieved significant noise suppression at targeted frequencies.

## License
This project is licensed under the MIT License. See the `LICENSE` file for more details.
