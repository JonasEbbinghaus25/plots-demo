using Plots;
using CSV;
using DataFrames;
using StatsPlots;
gr();
# plotlyjs();

# Benötigt
# Pkg.add("CSV")
# Pkg.add("DataFrames")
# Pkg.add("StatsPlots") 

# Projektpfade definieren
project_root = normpath(joinpath(@__DIR__, "..", "..")) # Zwei Ebenen hoch gehen (zur Wurzel des Projekts)
data_dir = joinpath(project_root, "data")              # `data`-Ordner im Projekt
filename = joinpath(data_dir, "salary.csv")       # Vollständiger Pfad zur CSV-Datei

# Überprüfen, ob die Datei existiert
if !isfile(filename)
    error("Datei nicht gefunden: $filename")
end

# CSV-Datei in einen DataFrame laden
df = CSV.read(filename, DataFrame)

# Ausgabe des DataFrames (optional)
println(df)

# Visualisierungen
@df df histogram(:Salary, bins=10, title="Distribution of Salaries", xlabel="Salary", ylabel="Frequency")
@df df boxplot(:Department, :Salary, title="Salary by Department", xlabel="Department", ylabel="Salary")

# Subplots 
p1 = @df df scatter(:YearsInCompany, :Salary, xlabel="Years In Company", ylabel="Salary", title="Years In Company")
p2 = @df df scatter(:Department, :Salary, xlabel="Department", ylabel="Salary", title="Department")
p3 = @df df scatter(:Performance, :Salary, xlabel="Performance", ylabel="Salary", title="Performance")
p4 = @df df scatter(:MonthsInCompany, :Salary, xlabel="Months In Company", ylabel="Salary", title="Months In Company")
p = plot(p1, p2, p3, p4, layout=(2,2), legend=false)
display(p)
savefig(p, "Subplots.png")

# 3d Scatter
@df df scatter3d(:YearsInCompany, :Performance, :Salary, xlabel="Years in Company", ylabel="Performance", zlabel="Salary", title="3D Scatterplot: Salary vs Years in Company and Performance", color=:blue, alpha=0.5)

# 3d Scatter animiert
# Erstelle eine Animation
anim = Animation()

# Definiere x, y, und z für den 3D-Plot
x = df.YearsInCompany
y = df.Performance
z = df.Salary

# Erstelle eine animierte Darstellung
# Starte die Schleife, die über alle Datenpunkte iteriert
# Für jeden Schritt wird ein neuer Frame für die Animation erstellt
for t in 1:length(x)
    # Die ersten 't' Datenpunkte aus x, y und z
    scatter3d(x[1:t], y[1:t], z[1:t], xlabel="Years in Company", ylabel="Performance", zlabel="Salary", title="3D Salary Animation", color=:blue)

    # Füge den aktuellen Plot als Frame zur Animation hinzu
    frame(anim)
end

# Speichern der Animation als GIF
gif(anim, "3d_salary_animation.gif", fps=15)



