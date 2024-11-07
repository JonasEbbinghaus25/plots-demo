using Plots

# Eigene meshgrid-Funktion definieren

# Erstelle eine Animation
anim = Animation()

# Definiere die Wellenfunktion
x = 0:0.1:10
for t in 1:100
    y = sin.(x .+ 0.1t)
    plot(x, y, ylim=(-1, 1), title="Wellenfunktion", legend=false)
    frame(anim)
end

# Speichere die Animation als GIF
gif(anim, "wellenfunktion.gif", fps=15)

# Erklärung
# using Plots: Lädt das Plots-Paket.
# Animation(): Erstellt ein Animationsobjekt.
# x = 0:0.1:10: Definiert den Bereich der x-Werte.
# for t in 1:100: Erstellt eine Schleife für 100 Frames.
# y = sin.(x .+ 0.1t): Berechnet die y-Werte der Wellenfunktion.
# plot(x, y, ylim=(-1, 1), title="Wellenfunktion", legend=false): Plottet die Wellenfunktion.
# frame(anim): Fügt den aktuellen Plot als Frame zur Animation hinzu.
# gif(anim, "wellenfunktion.gif", fps=15): Speichert die Animation als GIF mit 15 Bildern pro Sekunde.