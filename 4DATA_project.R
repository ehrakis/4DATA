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

#Step 4
get_transation_item_list <- function(course_list_reference_indexes, item_list){
  transactions_item_list <- list()
  for (index in 2:length(course_list_reference_indexes)) {
    transactions_item_list[[index-1]] <- item_list[(course_list_reference_indexes[index-1]+1):course_list_reference_indexes[index]]
  }
  return(transactions_item_list)
}
course_lists_parsed <- get_transation_item_list(Groceries@data@p, course_lists)
#Step 4:
course_lists_parsed[4:8]

#Step 5:
#Return the proportion of transaction containing at least on item of the vector place in parameter.
get_prportions_for_items <- function(course_lists_parsed, vector_of_items){
  counter <- 0
  for (transaction in course_lists) {
    for (item in vector_of_items) {
      if(any(transaction ==item)){
        counter <- counter+1
        break
      }
    }
  }
  return(counter/length(course_lists_parsed))
}
  
#TODO: rewrite from here
get_prportions_for_items(course_lists_parsed,1)

#Step 6:
get_prportions_for_items(course_lists_parsed,c(3:7))

#Step 7:
proportions <- table(course_lists)/length(Groceries@data@p)
at_least_15_percent <- list()
list_index <- 1
for (index in 1:length(proportions)) {
  if(proportions[index] >= 0.15){
    at_least_15_percent[[list_index]] <- c(index, proportions[index])
    list_index <- list_index + 1
  }else{
  }
}

products_to_check <- c()
for (index in 1:length(at_least_15_percent)) {
  products_to_check <- append(products_to_check, at_least_15_percent[[index]][[1]])
}

get_prportions_for_items(course_lists_parsed,products_to_check)

#Step 8:
sort(table(course_lists), decreasing = TRUE)[1:10]/length(Groceries@data@p)

