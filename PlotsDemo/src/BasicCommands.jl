using Plots

# Simple Plot
x = 1:10
y = rand(30)
# plot(x, y)

# Add legend
# plot(x, y, title="Mein erster Plot", xlabel="x-Achse", ylabel="y-Achse")


#y2 = rand(10)
#plot(x, y, label="Daten 1", legend=:topright)
#plot!(x, y2, label="Daten 2")  # Das Ausrufezeichen fügt zum bestehenden Plot hinzu

scatter(x, y, label="Datenpunkte", legend=:topright, color="orange")

#bar(x, y)

# histogram(randn(1000))