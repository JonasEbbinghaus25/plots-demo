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




