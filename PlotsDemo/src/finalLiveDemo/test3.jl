using Plots;
using CSV;
using DataFrames;
using StatsPlots;
gr();

# Benötigt
# Pkg.add("CSV")
# Pkg.add("DataFrames")
# Pkg.add("StatsPlots") 

# Projektpfade definieren
project_root = normpath(joinpath(@__DIR__, "..", "..")) # Zwei Ebenen hoch gehen (zur Wurzel des Projekts)
data_dir = joinpath(project_root, "data")              # `data`-Ordner im Projekt
filename = joinpath(data_dir, "advertising.csv")       # Vollständiger Pfad zur CSV-Datei

# Überprüfen, ob die Datei existiert
if !isfile(filename)
    error("Datei nicht gefunden: $filename")
end

# CSV-Datei in einen DataFrame laden
df = CSV.read(filename, DataFrame)

# Ausgabe des DataFrames (optional)
println(df)

# Scatterplot für TV vs. Sales mit @df Makro
p = @df df scatter(:TV, :Sales, xlabel="TV (Werbung)", ylabel="Sales", title="TV vs Sales")
display(p)

# Erstelle jeweils einen Plot für jedes Subplot
p1 = @df df scatter(:TV, :Sales, xlabel="TV", ylabel="Sales", title="TV Sales")
p2 = @df df scatter(:Radio, :Sales, xlabel="Radio", ylabel="Sales", title="Radio Sales")
p3 = @df df scatter(:Newspaper, :Sales, xlabel="Newspaper", ylabel="Sales", title="Newspaper Sales")

# Kombiniere die Plots zu einem großen Layout
p = plot(p1, p2, p3, layout=(2,2), legend=false)
display(p)

# @df Makro: Ermöglicht direkten Zugriff auf `DataFrame`-Spalten in Plotbefehlen.
# df (DataFrame): Enthält die Daten für den Plot.
# Doppelpunkte `:`: Greifen auf Spaltennamen im `DataFrame` zu (als Symbole).





