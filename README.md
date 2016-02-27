# Sine-Wave

This app draws Sine waves. It keeps a list of sine waves to draw, and allows the amplitude and frequency to be set for each. 

The app makes use of Core Graphics to draw sine waves. The SineWaveView class extends UIView. It draws each sine wave into a
single UIBezierPath, and then strokes the path. 

SineWaves are stored in a singlton: SineStore. A tableview with a custom cell displays an interface for each sine wave. 
WaveManager acts Data Source for this tableview. 

## Notes

The controls for each sine wave consist of sliders for amplitude and frequency. There is also a slider for phase, which at
the moment is not active...

Drawing is accomplished by drawing 100 straight line segments tracing the sine across the width of the screen. While this
looks acceptable at lower frequency values, it starts to look jagged at higher frequency values. The number 100 was an
arbitrary choice. This could be looked at to get better drawing results, with an eye at performance. Maybe a variable number
points based on the frequency value...
