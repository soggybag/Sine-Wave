# Sine-Wave

This app draws Sine waves. It keeps a list of sine waves to draw, and allows the amplitude and frequency to be set for each. 

The app makes use of Core Graphics to draw sine waves. The SineWaveView class extends UIView. It draws each sine wave into a
single UIBezierPath, and then strokes the path. 

SineWaves are stored in a singlton: SineStore. A tableview with a custom cell displays an interface for each sine wave. 
WaveManager acts Data Source for this tableview. 
