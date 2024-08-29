import numpy as np
from scipy.optimize import fsolve

A = 1.129241e-3
B = 2.341077e-4
C = 8.775468e-8

def temperature_to_kelvin(temp_celsius):
    return temp_celsius + 273.15

def equation(R, T):
    return A + B * np.log(R) + C * (np.log(R))**3 - 1/T

def find_resistance(T):
    R_guess = 10000  
    R_solution, = fsolve(equation, R_guess, args=(T,))
    return R_solution

T_celsius = 18.99
T_kelvin = temperature_to_kelvin(T_celsius)
R = find_resistance(T_kelvin)

print(f"Resistance at T = {T_celsius} °C (Kelvin: {T_kelvin}): {R} ohms")
