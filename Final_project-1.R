#Project R code file for the topic Data Engineering Semester 1 2024
#The template serves as a suggestion for structuring your submissions. You are not limited by this template and are encouraged to present in a way that best showcases your work on the project. You should remove this line from your submissions.
#Student name:	Thai Quang Le
#FAN ID: 	le0424
#Email address:	le0424@flinders.edu.au
#Class enrolled:	COMP8031
#Tutorial class: 	COMP8031
#Group name:	Naruto
#Names of other group members: 1) Thai Quang Le
#                              2) Minh Quan Do Bui
#                              3) Kimchheng Lim
#                              4) Kazuya Tsubone


#1)	Data Wrangling
#1a)	Loading the data
#Presenting your work on loading the data
install.packages("modelr")
library(dplyr)
library(tidyverse)
library(ggplot2)
library(modelr)
df <- read.csv("C:/Users/HP/OneDrive - Flinders/Desktop/Sem 1 2024/Data Engineering/anonymisedData (1)/studentAssessment.csv")
df <-data.frame(df)
df
df_studentinfo <- read.csv("C:/Users/HP/OneDrive - Flinders/Desktop/Sem 1 2024/Data Engineering/anonymisedData (1)/studentInfo.csv")
df_studentinfo <- data.frame(df_studentinfo)
df_studentinfo
#Merge two files to have more detail about the data
merged_df <- merge(df, df_studentinfo, by = "id_student", all.x = TRUE)
merged_df
#1b)	Handling missing data
#Presenting your work on finding missing data or incorrect data and your corresponding actions on the data in handling missing data
merged_df <- na.omit(merged_df) # Clean the missing data
merged_df
#1c)	Tidying the data
#Make the data for is_banked easier to read
merged_df$is_banked <- ifelse(merged_df$is_banked == 1, "Yes", "No")
merged_df
#Make the data for gender easier to read
merged_df$gender <- ifelse(merged_df$gender == "M", "Male", "Female")
merged_df
#Make the data for disability easier to read
merged_df$disability <- ifelse(merged_df$disability == "Y", "Yes", "No")
merged_df

#2)	Data Transformation
#2a)	Data Transformation techniques
#Presenting for your work on applying data transformation techniques to the data
merged_df <- subset(merged_df, date_submitted >= 0)
merged_df
#2b)	Creating new variables
#Presenting your work on creating any new variables if applicable. 
merged_df$grade <- ifelse(merged_df$score >= 40, "Pass", "Fail")
merged_df

#3)	Data Analysis
#a)	Statistical analysis or exploratory data analysis
#Presenting your work in statistical analysis or Exploratory data analysis to uncover patterns, trends or relationships within the data.
#find outliners and any pattern of the dataset, abnomalities
hist(merged_df$score, 
     main = "Histogram of Scores",  
     xlab = "Score",              
     ylab = "Frequency",            
     col = "skyblue",               
     border = "black",              
     breaks = 10,                   
     xlim = c(0, 100))    
#Right skew: mean < median
mean_score <- mean(merged_df$score)
mean_score
median_score <- median(merged_df$score)
median_score
#3b)	Data visualisation
#Presenting your work in applying data visualisation techniques
#Scatter plot
ggplot(data = merged_df)+geom_point(mapping = aes(x=date_submitted, y=score))
#Histogram of Score
ggplot(merged_df, aes(x = score)) + geom_histogram(binwidth = 5, fill = "blue", color = "black") + labs(title = "Distribution of Scores")
#Box-plot of Score
ggplot(merged_df, mapping = aes(x= disability, y = score)) +
  geom_boxplot(fill = "lightblue", color = "blue") +
  labs(title = "Boxplot of Scores")
#Facet 1 variable
ggplot(data = merged_df ) + geom_point(mapping=aes(x=date_submitted, y= score)) + facet_wrap(~gender, nrow = 2)
#Facet 2 variables
ggplot(data = merged_df ) + geom_point(mapping=aes(x=date_submitted, y= score)) + facet_grid(disability~gender)
#Bar-chart
ggplot(merged_df, aes(x = grade)) +
  geom_bar(fill = "green", color = "black") +
  labs(title = "Number of Students by Grade", x = "Grade", y = "Count")

#4)	Data Modelling
#4a)	Simple linear model
#Presenting your work in developing a simple linear model
mod_4a <- lm(score~date_submitted, data=merged_df)
coef(mod_4a)
#4b)	General linear model
#4bi)	Predictors are categorical
#Presenting your work in developing a general linear model where the predictors are categorical.
mod_4bi <- lm(score ~gender+disability, data = merged_df)
mod_4bi
#4bii)	Predictors are categorical and continuous
#Presenting your work in developing a general linear model where the predictors are categorical and continuous.
mod_4bii <- lm(score ~ date_submitted + gender, data = merged_df)
mod_4bii
#4biii)	Predictors are continuous
#Presenting your work in developing a general linear model where the predictors are continuous.
mod_4biii <- lm(score ~ studied_credits+ date_submitted, data = merged_df)
mod_4biii

#4c)	Model evaluation
#Presenting your work in evaluating the models in part 4a and part 4b 
#4a
pred_4a <- predict(mod_4a, newdata = merged_df)
rmse4a <- sqrt(mean((merged_df$score - pred_4a)^2))
rmse4a
#4b
#i
pred_4bi <- predict(mod_4bi, newdata = merged_df)
rmse_4bi <- sqrt(mean((merged_df$score - pred_4bi)^2))
rmse_4bi
#ii
merged_df$pred_mod_4bii <- predict(mod_4bii, newdata = merged_df)
rmse_4bii <- sqrt(mean((merged_df$score - merged_df$pred_mod_4bii)^2))
rmse_4bii
#iii
pred_4biii <- predict(mod_4biii, newdata = merged_df)
rmse_4biii <- sqrt(mean((merged_df$score - pred_4biii)^2))
rmse_4biii

#4d)	Model Interpretation
#Presenting your work in interpreting the models in part 4a and part 4b if applicable
mod_4a <- lm(score~date_submitted, data=merged_df)
coef(mod_4a)
#Intercept (76.67): This represents the estimated score when date_submitted is 0. In this context, it might not have a practical interpretation since date_submitted is unlikely to be zero or meaningful at that value.
#Coefficient for date_submitted (-0.01): For each unit increase in date_submitted, we expect the score to decrease by approximately 0.01, holding other variables constant. This suggests a slight negative relationship between date_submitted and score.

mod_4bi <- lm(score ~gender+disability, data = merged_df)
mod_4bi
#Intercept (75.92): This represents the estimated score for a reference group (presumably gender: Female, disability: No) when all other variables are 0.
#Coefficients for genderMale (-0.45) and disabilityY (-2.63): Compared to the reference group, being male (genderMale) is associated with a decrease in score of approximately 0.45, and having a disability (disabilityY) is associated with a decrease in score of approximately 2.63, holding other variables constant.

mod_4bii <- lm(score ~ date_submitted + gender, data = merged_df)
mod_4bii
#Intercept (76.88): Similar to mod_4a, this represents the estimated score when date_submitted and gender are both 0, which may not be practically meaningful.
#Coefficients for date_submitted (-0.01) and genderMale (-0.37): For each unit increase in date_submitted, we expect the score to decrease by approximately 0.01, holding gender constant. Being male (genderMale) is associated with a decrease in score of approximately 0.37, holding date_submitted constant.

mod_4biii <- lm(score ~ studied_credits+ date_submitted, data = merged_df)
mod_4biii
#Intercept (78.94): This represents the estimated score when studied_credits and date_submitted are both 0, which might not be practically meaningful.
#Coefficients for studied_credits (-0.03) and date_submitted (-0.01): For each additional studied_credit, we expect the score to decrease by approximately 0.03, holding date_submitted constant. For each unit increase in date_submitted, we expect the score to decrease by approximately 0.01, holding studied_credits constant.