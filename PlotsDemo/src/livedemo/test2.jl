using Plots

# Erstelle eine Animation
anim = Animation()

# Definiere die Wellenfunktion
x = 0:0.1:10
y = 0:0.1:10
for t in 1:100
    z = [sin(sqrt(xi^2 + yi^2) - 0.1t) for xi in x, yi in y]
    surface(x, y, z, zlim=(-1, 1), title="3D Wellenfunktion", legend=false)
    frame(anim)
end

# Speichere die Animation als GIF
gif(anim, "3d_wellenfunktion.gif", fps=15)


# Erklärung
# using Plots: Lädt das Plots-Paket.
# Animation(): Erstellt ein Animationsobjekt.
# x = 0:0.1:10 und y = 0:0.1:10: Definieren den Bereich der x- und y-Werte.
# for t in 1:100: Erstellt eine Schleife für 100 Frames.
# z = [sin(sqrt(xi^2 + yi^2) - 0.1t) for xi in x, yi in y]: Berechnet die z-Werte der 3D-Wellenfunktion.
# surface(x, y, z, zlim=(-1, 1), title="3D Wellenfunktion", legend=false): Plottet die 3D-Wellenfunktion.
# frame(anim): Fügt den aktuellen Plot als Frame zur Animation hinzu.
# gif(anim, "3d_wellenfunktion.gif", fps=15): Speichert die Animation als GIF mit 15 Bildern pro Sekunde.