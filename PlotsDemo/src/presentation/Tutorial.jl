# inspiration: https://docs.juliaplots.org/stable/tutorial/
using Plots
using LaTeXStrings

# Basic Plot
x = range(0, 10, length=100)
y = sin.(x)
plot(x, y)

# Series 
x = range(0, 10, length=100)
y1 = sin.(x)
y2 = cos.(x)
plot(x, [y1 y2])

# Macros / !
y3 = @. sin(x)^2 - 1/2   # equivalent to y3 = sin.(x).^2 .- 1/2
plot!(x, y3)

# Attribute
x = range(0, 10, length=100)
y1 = sin.(x)
y2 = cos.(x)
plot(x, [y1 y2], title="Functions", label=["sin(x)" "cos(x)"], linewidth=3)
plot!(legend=:outerbottom, legendcolumns=2)


# More on Attributes
x = range(0, 10, length=100)
y1 = sin.(x)
y2 = cos.(x)
y3 = @. sin(x)^2 - 1/2

plot(x, [y1 y2], label=["sin(x)" "cos(x)"], lw=[2 1])
plot!(x, y3, label=L"\sin(x)^2 - \frac{1}{2}", lw=3, ls=:dot)
plot!(legend=:outerbottom, legendcolumns=3)
title!("Functions")
xlabel!(L"x")
ylabel!(L"y")

# Chaning Series Type
x = range(0, 10, length=100)
y = sin.(x)
y_scatter = @. cos(x)

plot(x, y, label=L"sin(x)")
scatter!(x, y_scatter, label=L"cos", mc=:green, ms=10)
title!(L"Customise\ Series\ Type")

# Subplots 
x = range(0, 10, length=100)
y1 = @. exp(-0.1x) * cos(4x)
y2 = @. exp(-0.3x) * cos(4x)
y3 = @. exp(-0.5x) * cos(4x)
plot(x, [y1 y2 y3], layout=(3, 1), legend=false)

# Function
A = 1
B = 1
a = 5
b = 4
delta = π / 2

# Zeitparameter
t = 0:0.01:2π

# Lissajous-Kurven
xL = @. A * sin(a * t + delta)
yL = @. B * sin(b * t)


# Advanced Subplots
x = range(0, 10, length=100)
y1 = @. sin(x) + cos(2x)
y2 = @. exp(-0.3x) * cos(4x)
y3 = @. exp(-0.1x)
y4 = @. exp(-0.3x)
y = [y1 y2 y3 y4]

p1 = plot(xL, yL, title=L"Lissajous-Kurve", mc=:red, ms=10)
xlabel!(p1, L"x")
ylabel!(p1, L"y")
p2 = plot(x, y2, title=L"Schwingung", lw=3, xlabel=L"x", ylabel=L"y")
p3 = scatter(x, y3, ms=2, ma=0.5, xlabel=L"x", ylabel=L"y", title=L"Scatter")
p4 = scatter(x, y, title=L"4\ Funktionen", ms=2, ma=0.2, xlabel=L"x", ylabel=L"y")
plot(p1, p2, p3, p4, layout=(2,2), legend=false)

using Plots
gr()  # GR-Backend aktivieren

# Daten erstellen
x = 1:10
y = rand(10)

# Plot mit extra_kwargs
plot(
    x, y, 
    label="Zufallsdaten", 
    title="Ein einfacher GR-Plot", 
    xlabel="X-Achse", 
    ylabel="Y-Achse", 
    legend=:topright, 
    # extra_kwargs = Dict(:series => Dict(:linecolor => :blue, :linestyle => :dash))
    linecolor=:blue,
    linestyle=:dash
)


