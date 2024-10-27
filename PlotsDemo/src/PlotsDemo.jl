module PlotsDemo

import Plots: plot

# Data 
x = 1:10
y = rand(10)

# Diagramm
function create_plot()
    plot(x, y, label="Zufallsdaten", title="Ein einfaches Diagramm", xlabel="X-Achse", ylabel="Y-Achse")
end

end 
