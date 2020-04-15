# Step 1 and 2
rm(list = ls())
library(arules)
data(Groceries)

# Step 3 a,b,c,d
summary(Groceries)

# Step 3.e
itemFrequencyPlot(Groceries,topN=5,type="absolute")

# Step 3.f
itemFrequency(Groceries[, "yogurt"])

# Step 3.g
summary(Groceries[size(Groceries) == 7])

# Step 3.h
summary(Groceries[size(Groceries) == 2])

# Step 3.i
mean(size(Groceries))

# Step 4
inspect(Groceries[4:8])

# Step 5
itemFrequency(Groceries[, Groceries@itemInfo$labels[1]])

# Step 6
itemFrequency(Groceries[, Groceries@itemInfo$labels[3:7]])

# Step 7
itemFrequencyPlot(Groceries, support=0.15)

# Step 8
itemFrequencyPlot(Groceries,topN=10)
sort(itemFrequency(Groceries), decreasing = TRUE)[1:10]

# Step 9
image(Groceries)

image(Groceries[1:1000])

itemFrequency(Groceries[, c(Groceries@itemInfo$labels[23:25], Groceries@itemInfo$labels[30])])

itemFrequency(Groceries[, Groceries@itemInfo$labels[56]])

itemFrequency(Groceries[, Groceries@itemInfo$labels[103:104]])

# Other commands used for part 1 analysis
hist(size(Groceries), 
     breaks=c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,32),
    xlim=c(1,32),
    ylim=c(0,0.25),
    main="Histogramme de la densité de la taille des transactions",
    xlab="Taille des transactions",
    ylab="Densité")
    
table(size(Groceries))

itemFrequencyPlot(Groceries[size(Groceries)==1],topN=5)