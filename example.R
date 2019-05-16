
## Code and structure directly copied from https://www.knowru.com/blog/how-create-restful-api-for-machine-learning-credit-model-in-r/

# install.packages("rpart.plot")
library(rpart.plot)

url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/statlog/german/german.data"
col.names <- c('Status of existing checking account', 'Duration in month', 'Credit history', 
               'Purpose', 'Credit amount', 'Savings account/bonds', 
               'Employment years', 'Installment rate in percentage of disposable income', 
               'Personal status and sex', 'Other debtors / guarantors', 'Present residence since', 
               'Property', 'Age in years', 'Other installment plans', 'Housing', 'Number of existing credits at this bank', 
               'Job', 'Number of people being liable to provide maintenance for', 'Telephone', 'Foreign worker', 'Status')

# Get the data
data <- read.csv(url, header = FALSE, sep = ' ', col.names = col.names)

library(rpart)
# Build a tree
decision.tree <- rpart(Status ~ Status.of.existing.checking.account + Duration.in.month + Credit.history + Savings.account.bonds, 
                       method = "class", 
                       data = data)

# Visualize the tree
# 1 is good, 2 is bad
prp(decision.tree, extra = 1, varlen = 0, faclen = 0, 
    main = "Decision Tree for German Credit Data")

new.data <- list( Status.of.existing.checking.account = 'A11', 
                  Duration.in.month = 20, 
                  Credit.history = 'A32', 
                  Savings.account.bonds = 'A65')
predict(decision.tree, new.data)
save(decision.tree, file = 'decision_Tree_for_german_credit_data.RData')
