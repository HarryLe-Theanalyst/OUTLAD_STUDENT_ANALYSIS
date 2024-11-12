# OUTLAD_Student_Analysis
# Student Score Prediction Project

## Overview
This project utilizes R and RStudio to build linear regression models for predicting student scores based on various factors such as submission date, gender, disability status, and studied credits.

## Objectives
* Develop accurate predictive models for student scores.
* Understand the relationships between input factors and scores.
* Provide a tool to support the assessment of student performance.

## Data
* **Data Source:** OUTLAD dataset
* **Variables:**
  * score: Final score achieved by the student
  * date_submitted: The date on which the assignment was submitted
  * Gender: Gender of the student (Male/Female)
  * disability: Whether the student has a disability (Yes/No)
  * studied_credits: Number of credits the student has studied

## Methodology
1. **Data Cleaning and Preparation:**
   * Handle missing values and outliers.
   * Encode categorical variables.
2. **Exploratory Data Analysis (EDA):**
   * Visualize the distribution of variables.
   * Identify potential correlations between variables.
3. **Model Building:**
   * Build linear regression models:
     * Model 4a: Score ~ Date Submitted
     * Model 4bi: Score ~ Gender + Disability
     * Model 4bii: Score ~ Date Submitted + Gender
     * Model 4biii: Score ~ Studied Credits + Date Submitted
4. **Model Evaluation:**
   * Evaluate model performance using Root Mean Squared Error (RMSE).
5. **Model Interpretation:**
   * Interpret model coefficients to understand the impact of different factors on predicted scores.

## Results
* **Summary of Results:**
  | Model | RMSE |
  |---|---|
  | Model 4a | 19.08101 |
  | Model 4bi | 19.08056 |
  | Model 4bii | 19.08013 |
  | Model 4biii | 19.05115 |
* **Detailed Analysis:**
  * Which model performed best?
  * Which factors had the greatest impact on scores?
  * Limitations of the model.

## Code
* **Language:** R
* **Libraries:** RStudio
* **Directory Structure:**
  * data: Contains data
  * src: Contains R source code
  * results: Contains results


## Installation
* **Requirements:** R and required libraries (e.g., dplyr, ggplot2, caret)

## Author
* **Name:** Thai Quang Le
* **Contact:** harry.le2420@gmail.com

## **Additional Tips**
* **Clarity and Conciseness:** Use clear and concise language to explain the code and results.
* **Code Comments:** Add comments to your code to explain the logic and purpose of different sections.
* **Version Control:** Use Git to track changes to your code and collaborate with others.
* **Code Formatting:** Use consistent formatting and indentation to improve readability.
* **Error Handling:** Implement error handling to make your code more robust.
* **Visualization:** Use visualizations to communicate your findings effectively.

**By following these guidelines, you can create a well-structured and informative README.md for your GitHub repository.**

**Would you like me to help you customize this template further based on your specific project?**

**Please feel free to provide more details about your project, such as:**
* **Specific goals** you want to achieve with the project
* **The **datasets** you are using
* **The **models** you have implemented
* **The **challenges** you encountered
* **The **outcomes** you achieved

**The more information you provide, the better I can tailor the README.md to your needs.**

**Additionally, here are some other sections you might consider adding to your README.md:**

* **Getting Started:** A quick guide on how to get started with the project.
* **Contributing:** Guidelines for contributing to the project.
* **Future Work:** Ideas for future improvements or extensions.

I'm ready to assist you further!
