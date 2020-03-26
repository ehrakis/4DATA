rm(list = ls())
library(arules)
data(Groceries)

# Correct the course list so the first index is 1
course_lists <- Groceries@data@i + 1

summary(Groceries)
#1.3.a: 169 items
#1.3.b: 9835 transactions
#1.3.c: 0.02609146
density(Groceries@data@i)

str(Groceries)

#Groceries@data@i[Groceries@data@p[1]:Groceries@data@p[2]]
#Groceries@data@i[(Groceries@data@p[2]+1):Groceries@data@p[3]]
#Groceries@data@i[(Groceries@data@p[3]+1):Groceries@data@p[4]]
#Groceries@data@i[(Groceries@data@p[4]+1):Groceries@data@p[5]]

#1.3.e rolls/buns, whole milk, other vegetables
a <- table(course_lists)
sort(a, decreasing = TRUE)
Groceries@itemInfo[25,][1]
Groceries@itemInfo[23,][1]
Groceries@itemInfo[56,][1]

#1.3.f 14% of transactions contain yogurt
yogurt_index <- which(Groceries@itemInfo$labels == 'yogurt')
a[yogurt_index]
a[yogurt_index]/9835

#1.3.g 
get_transaction_lengths <- function(course_lists_indexes) {
  transaction_length <- c()
  for (index in 2:length(course_lists_indexes) ) {
    transaction_length <- append(transaction_length, course_lists_indexes[index]-course_lists_indexes[index-1])
  }
  return(transaction_length)
}

transaction_length <- get_transaction_lengths(Groceries@data@p)
summary(transaction_length)

#1.3.g 545
table(transaction_length)[7]

#1.3.h 1643
table(transaction_length)[2]

#1.3.i The average number of items per transaction is 4
mean(transaction_length)

