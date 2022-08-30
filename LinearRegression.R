#Goal here is predicting the final scores using the rest of the data
#G1-G2-G3 are grades for periods
df <- read.csv('student-mat.csv',sep = ';')

print(summary(df))

#clear the df

any(is.na(df)) #which is luckily false

str(df) #we can use factor for some  

#lets make school,sex, address, famsize, Pstatus, Mjob, Fjob, reason, guardian
#schoolsup, famsup, paid, activities, nursery, higher, internet, romantic Factor

cols <- c('school', 'sex', 'address', 'famsize', 'Pstatus', 
          'Mjob', 'Fjob', 'reason', 'guardian', 'schoolsup', 
          'famsup', 'paid', 'activities', 'nursery', 'higher', 
          'internet', 'romantic')

df[cols] <- lapply(df[cols], factor) #factor all of that columns that mentioned 

str(df) #lets check again


#Exploratory Data Analysis

library(ggplot2)
library(ggthemes)
library(dplyr)

#take only numeric columns 
num.cols <- sapply(df, is.numeric)

#then filter to numeric columns for correlation
correlation.data <- cor(df[, num.cols])

print(correlation.data)

#lets use corrplot and corrgram for data viz of correlation
library(corrplot)
library(corrgram)

corrplot(correlation.data, method= 'color')

#We can see there are high correlation between G1,G2 and G3 which are grades for each period
#which means good students do well each period
#also high G1,G2 and G3 has negative correlation with failures (numbers of past class failures)
#Also Mother and Father education levels are correlated

#Let's use corrgram instead of typing all of these by hand

corrgram(df,order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt)

#We will try to predict G3. Let's see the hist of G3 scores.

ggplot(df, aes(x=G3)) + geom_histogram(bins = 20, alpha = 0.5, fill = 'blue') + theme_minimal()


#Train Test Split

library(caTools)

#Any column works i just chose G3 since we will predict G3
sample <- sample.split(df$G3, SplitRatio = 0.7) 

#Train Data
train = subset(df, sample == T)
#Test Data
test = subset(df, sample == F)

#Creating the model

model <- lm(G3 ~ ., train)

summary(model)

#Let's visualize residuals

res <- residuals(model)

res <- as.data.frame(res)

print(head(res))

ggplot(res, aes(res)) + geom_histogram(fill = 'blue', alpha = 0.5)

#we can use plot(model) to check the residuals better

plot(model)

#eventually our model predicted that some people will get negative test scores according to data
#lets make them zeros instead of negative values

remove_negs <- function(value){
  if (value<0) {
    return (0)
  } else{
    return (value)
  }
}

#Predictions

G3.preds <- predict(model, test)

results <- cbind(G3.preds, test$G3)
colnames(results) <- c('pred', 'real')
results <- as.data.frame(results)

results$pred <- sapply(results$pred, remove_negs)

#lets use mean squared error as evaluation
mse <- mean((results$real- results$pred)^2)
print(mse)

#root mean squared error
rmse <- mse^0.5
print(rmse)

#remember that none of the data was normalized
#and also i made this solely for learning