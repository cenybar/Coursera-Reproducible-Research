install.packages("kernlab")
library(kernlab)
data(spam)
str(spam[,1:5])

# An example 
        # Start with a general question: 
                # Can I automatically detect emails that are SPAM or not?
        # Make it concrete
                # Can I use quantitative characteristics of the emails to classify them as SPAM/HAM?

# We are going to split the data into a test set and training set

set.seed(3435)
trainIndicator = rbinom(4601, size = 1, prob = 0.5)
table(trainIndicator)

trainSpam = spam[trainIndicator == 1,]
testSpam = spam[trainIndicator == 0,]

# Exploratory data analysis
        # Look at summaries of the data
        # Check for missing data
        # Create exploratory plots
        # Perform exploratory analyses (e.g. clustering)

names(trainSpam)
head(trainSpam)
# summary
table(trainSpam$type)
# plots (capitalAve measures the average capital letters used in each email)
plot(trainSpam$capitalAve ~ trainSpam$type) # skewed data makes difficult to see patterns
plot(log10(trainSpam$capitalAve + 1) ~ (trainSpam$type)) # taking the log solves the previous
# as the last picture show, spam email tend to have, in average, more capital letters
# than regular emails. That's an intuitive result, confirmed by data

# relationships bewteen predictors
plot(log10(trainSpam[,1:4] + 1))

#clustering
hCluster = hclust(dist(t(trainSpam[1, 1:57])))
plot(hCluster)
# new clustering
hClusterUpdated = hclust(dist(t(log10(trainSpam[, 1:55] + 1))))
plot(hClusterUpdated)

# the teacher then builds a model predicting spam (will not cover code as I haven't
# covered that statistical topic yet)

# Important while conducting analysis:
# Challenge your results (as someone might do it in the future, get ahead)
        # Challenge all steps
                # Question, data source, processing, analysis, conclusions
        # Challenge measures of uncertainty
        # Challenge choices of terms to include in models
        # Think of potential alternative analysis

#Synthesize/write-up results
        # Lead with the question
        # Summarize analysis into the story
        # Don't include every analysis, include it if:
                # needed for the story
                # needed to address a challenge
        # Order analysis according to story, not chronological

