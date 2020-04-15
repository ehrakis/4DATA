#Step 1
rm(list = ls())
library(arules)
data(Groceries)

#Step 2
help("apriori")

grules <- apriori(Groceries)
grules #set of 0 rules 

grules <- apriori(Groceries, parameter = list(support = 0.001, confidence = 0.9))
grules #set of 129 rules 

grules <- apriori(Groceries, parameter = list(support = 0.003, confidence = 0.5))
grules #set of 421 rules 

#step 3

#a
grules[size(grules) == 3] #281


#b
inspect(head(grules, 10))

#Step 4
inspect(head(sort(grules, by = "lift"), 10))

#Step 5
chocrules <- subset(grules, (lhs %pin% 'chocolate' | rhs %pin% 'chocolate'))

#Step 6
inspect(chocrules)


grules <- apriori(Groceries, parameter = list(support = 0.001, confidence = 0.1))
inspect(head(sort(grules, by = "support"), 1))
inspect(head(sort(grules, by = "confidence"), 1))
inspect(head(sort(grules, by = "lift"), 1))
inspect(tail(sort(grules, by = "lift"), 1))
