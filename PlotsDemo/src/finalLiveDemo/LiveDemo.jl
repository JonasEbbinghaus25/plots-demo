using Plots;
using CSV;
using DataFrames;
using StatsPlots;
gr();
# plotlyjs();

project_root = normpath(joinpath(@__DIR__, "..", "..")) 
data_dir = joinpath(project_root, "data")            
filename = joinpath(data_dir, "salary.csv")      

df = CSV.read(filename, DataFrame)

println(df)