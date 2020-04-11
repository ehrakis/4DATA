
rm(list = ls())
library(arules)
data(Groceries)


summary(Groceries)

itemFrequencyPlot(Groceries,topN=5,type="absolute")

itemFrequency(Groceries[, "yogurt"])

summary(Groceries[size(Groceries) == 7])

summary(Groceries[size(Groceries) == 2])

mean(size(Groceries))

inspect(Groceries[4:8])

itemFrequency(Groceries[, Groceries@itemInfo$labels[1]])

itemFrequency(Groceries[, Groceries@itemInfo$labels[3:7]])


itemFrequencyPlot(Groceries, support=0.15)

itemFrequencyPlot(Groceries,topN=10)

sort(itemFrequency(Groceries), decreasing = TRUE)[1:10]

image(Groceries)

image(Groceries[1:1000])

itemFrequency(Groceries[, c(Groceries@itemInfo$labels[23:25], Groceries@itemInfo$labels[30])])

itemFrequency(Groceries[, Groceries@itemInfo$labels[56]])

itemFrequency(Groceries[, Groceries@itemInfo$labels[103:104]])
