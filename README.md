# miata-2d-trajectory-matlab
``` 2D kinematic bicycle model simulation of a Mazda MX-5 Miata performing a single lane change maneuver. Built in MATLAB using Euler's integration method. ```
# Mazda MX-5 Miata — 2D Kinematic Trajectory Simulation

A 2D kinematic bicycle model simulation of a Mazda MX-5 Miata 
performing a single lane change maneuver, built in MATLAB using 
Euler's integration method.

## Model Overview

This simulation uses the kinematic bicycle model — a simplified 
vehicle dynamics model that treats the vehicle as a two-wheeled 
system. It assumes constant speed and ignores tire slip and 
lateral forces, making it suitable for low-speed kinematic 
trajectory prediction.

**Equations of Motion:**

x(i+1) = x(i) + v·cos(θ)·dt

y(i+1) = y(i) + v·sin(θ)·dt

θ(i+1) = θ(i) + (v/L)·tan(δ)·dt

## Parameters

| Parameter | Value |
|-----------|-------|
| Wheelbase (L) | 2.5 m |
| Constant Speed (v) | 20 m/s (72 km/h) |
| Time Step (dt) | 0.01 s |
| Simulation Steps (N) | 1500 |
| Max Steering Angle (δ) | 5° |

## Steering Profile

The lane change maneuver uses a sinusoidal steering profile:

- Phase 1: Steer left — smooth sinusoidal input over 2.5s
- Phase 2: Steer right — equal and opposite input over 2.5s
- Phase 3: Straighten — zero steering input for remainder

This produces a smooth, realistic lane change without abrupt 
steering transitions.

## Results

- Static trajectory plot of the full lane change maneuver
- Animated simulation showing real-time vehicle position tracking

## Tools

- MATLAB

## Notes

This model intentionally omits tire dynamics, lateral forces, 
and weight transfer — the next step would be incorporating a 
dynamic bicycle model to capture these effects at higher speeds 
or more aggressive maneuvers.
