# Lade notwendige Pakete
using Plots
using LaTeXStrings
plotly()  # Verwende das plotly-Backend für interaktive Plots

# Erstelle eine 3D-Oberfläche
x = LinRange(-5, 5, 100)
y = LinRange(-5, 5, 100)
z = [sin(sqrt(xi^2 + yi^2)) for xi in x, yi in y]

# Erstelle den Plot
surface(x, y, z, title="3d Plot", xlabel="x", ylabel="y", zlabel="z", legend=:topleft, label="sin(sqrt(xi^2 + yi^2))")

# Speichern oder Anzeigen des Plots
# surface = Draw a 3D surface plot.