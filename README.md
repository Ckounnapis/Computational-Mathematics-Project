# Robotic Arm Simulation – Computational Mathematics

## 📌 Overview

This project focuses on the **mathematical modeling and simulation of a robotic arm system** using differential equations.

The system is analyzed and solved using:

* Numerical methods (Euler Method)
* Analytical solutions of differential equations
* Control theory (PD controller)
* Octave/MATLAB implementation

---

## 🎯 Objectives

* Solve nonlinear differential equations of a robotic system
* Implement numerical simulation (Euler method)
* Analyze system behavior through graphs
* Design and evaluate a control system
* Compare numerical vs analytical solutions

---

## 🧠 System Description

The system models a robotic arm with:

* Angular motion: `θ₁`
* Linear displacement: `d₂`

The dynamics are described by **nonlinear differential equations** involving:

* Masses (`m1`, `m2`)
* Gravity (`g`)
* Inertia (`Izz1`, `Izz2`)
* External forces (`τ1`, `f2`)

👉 The equations are solved step-by-step using numerical methods 

---

## 🔢 Numerical Method – Euler

We use the Euler method:

```math
x(n+1) = x(n) + h * x'(n)
```

Applied to:

* Position and velocity of `θ₁`
* Position and velocity of `d₂`

### Key Idea

* Discretize time using step `h`
* Update system state iteratively

---

## 💻 Implementation (Octave)

The simulation is implemented in **Octave**, including:

* Initialization of parameters
* Time discretization
* Iterative Euler loop
* Plotting results

### Features

* Adjustable time step `h`
* Simulation time control
* Graphical output of:

  * θ₁(t)
  * θ₁′(t)
  * d₂(t)
  * d₂′(t)

📊 Example graphs are shown in the report (pages 4–5)

---

## 📈 Results & Observations

* System evolves smoothly over time for small `h`
* Larger step sizes reduce accuracy

👉 As shown in the graphs:

* `h = 0.001` → high accuracy
* `h = 0.1` → unstable / inaccurate results 

---

## ⚙️ Control System (PD Controller)

A **Proportional-Derivative (PD) controller** is introduced

### Purpose

* Stabilize system
* Drive position `d₂` to desired value `d₂_des`

---

## 📊 Step Size Comparison

Simulations performed for:

* `h = 0.001`
* `h = 0.01`
* `h = 0.1`

### Conclusion

* Smaller step → better approximation
* Larger step → numerical instability

(See graphs on pages 8–9 of the report)

---

## 🧮 Analytical Solution

The system is transformed into:

```math
x'' + p x' + q x = r
```

Where:

* `p = Kd2 / m2`
* `q = Kp2 / m2`

### Solution Types

Depending on discriminant:

* Overdamped
* Critically damped
* Underdamped

👉 In this case: **complex poles → oscillatory behavior**

---

## 🔁 Transfer Function

The system transfer function:

```math
G(s) = \frac{Kp2}{m2 s^2 + Kd2 s + Kp2}
```

---

## 📍 Poles

Calculated poles:

* `s₁ = -33.337 + 35.89i`
* `s₂ = -33.337 - 35.89i`

👉 Indicates:

* Stable system (negative real part)
* Oscillatory response

---

## 📊 Comparison (Numerical vs Analytical)

* Euler method approximates the analytical solution
* Accuracy depends heavily on step size
* Best match occurs for very small `h`

---

## 🛠️ Technologies

* Octave / MATLAB
* Numerical Analysis
* Differential Equations
* Control Systems

---

## 📚 Notes

This project demonstrates:

* Real-world application of numerical methods
* Connection between physics, math, and programming
* Importance of step size in simulations
* Basic control system design

---
