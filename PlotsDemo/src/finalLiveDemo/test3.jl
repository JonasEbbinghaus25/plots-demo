using Plots;
using CSV;
using DataFrames;
using StatsPlots;
gr();

# Benötigt
# Pkg.add("CSV")
# Pkg.add("DataFrames")
# Pkg.add("StatsPlots") 

# Lese die CSV-Datei aus dem angegebenen Pfad in einen DataFrame
df = CSV.read("C:\\work\\development\\repositories\\PlotsDemo\\PlotsDemo\\data\\advertising.csv", DataFrame)

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

