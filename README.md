# Sine-Wave

This app draws Sine waves. It keeps a list of sine waves to draw, and allows the amplitude and frequency to be set for each. 

The app makes use of Core Graphics to draw sine waves. The SineWaveView class extends UIView. It draws each sine wave into a
single UIBezierPath, and then strokes the path. 

SineWaves are stored in a singlton: SineStore. A tableview with a custom cell displays an interface for each sine wave. 
WaveManager acts Data Source for this tableview. 

The controls for each sine wave consist of sliders for amplitude and frequency. There is also a slider for phase, which at the moment is not active...
