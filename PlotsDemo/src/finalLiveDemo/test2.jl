using Plots

# Erstelle eine Animation
anim = Animation()

# Definiere die Wellenfunktion
x = LinRange(-5, 5, 100)  # x-Werte
y = LinRange(-5, 5, 100)  # y-Werte

# Erstelle die Animation der sich bewegenden Wellenfunktion
for t in 1:100
    z = [sin(sqrt(xi^2 + yi^2) - 0.1 * t) for xi in x, yi in y]  # Wellenfunktion über Zeit
    surface(x, y, z, zlim=(-1, 1), title="3D Wellenfunktion", legend=false)  # Plot der aktuellen Welle
    frame(anim)  # Speichern des aktuellen Plots als Frame der Animation
end

# Speichern der Animation als GIF
gif(anim, "3d_wellenfunktion.gif", fps=15)

# Hinweis: Das GIF wird als '3d_wellenfunktion.gif' gespeichert und kann angezeigt werden