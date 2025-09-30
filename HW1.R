#Question 1 
#Q1.A
# Read file
su <- read.delim("C:/Users/hybaa/Desktop/CSC487/Su_raw_matrix.txt")


# Check the structure
str(su)

#Q1.B
# Calculate mean and standard deviation , na.rm is here just if there is any missing values 
mean_values <- mean(su$Liver_2.CEL, na.rm = TRUE)
sd_values   <- sd(su$Liver_2.CEL, na.rm = TRUE)

# Print results
mean_values
sd_values

#Q1.C

# Column means
col_means <- colMeans(su, na.rm = TRUE)

# Column sums
col_sums  <- colSums(su, na.rm = TRUE)

# Print results
col_means
col_sums



#Q2.A&B
# Case (a) mean = 0, sigma = 0.2
set.seed(123)   # for reproducibility
data_a <- rnorm(10000, mean = 0, sd = 0.2)

# Case (b) mean = 0, sigma = 0.5
set.seed(123)
data_b <- rnorm(10000, mean = 0, sd = 0.5)

# Histogram for (a)
hist(data_a, breaks = 50, col = "lightblue", main = "Normal(0, 0.2)",
     xlab = "Value", xlim = c(-5, 5))

# Histogram for (b)
hist(data_b, breaks = 50, col = "lightgreen", main = "Normal(0, 0.5)",
     xlab = "Value", xlim = c(-5, 5))


#Q3.A
library(ggplot2)

set.seed(1)
dat <- data.frame(
  cond   = factor(rep(c("A","B"), each = 200)),
  rating = c(rnorm(200), rnorm(200, mean = .8))
)
str(dat)

#Q3.B
# Overlaid histograms
ggplot(dat, aes(x=rating, fill=cond)) +
  geom_histogram(binwidth=.5, alpha=.5, position="identity")


#Q3.C
ggplot(dat, aes(x=rating, fill=cond)) + geom_histogram(binwidth=.5, position="dodge")

#Q3.D
ggplot(dat, aes(x=rating, colour=cond)) + geom_density()

#Q3.E
ggplot(dat, aes(x=rating, fill=cond)) + geom_density(alpha=.3)

#Q3.F
library(ggplot2)
diabetes <- read.csv("C:/Users/hybaa/Desktop/CSC487/diabetes_train.csv")

#overlaid histogram
ggplot(diabetes, aes(x=mass, fill=class)) +
  geom_histogram(binwidth=.5, alpha=.5, position="identity")

# Density plots with semitransparent fill
ggplot(diabetes, aes(x=mass, fill=class)) + geom_density(alpha=.3)

#Q4
# install.packages("tidyverse")   # run once if not already installed
library(tidyverse)

# Read the Titanic dataset
passengers <- read.csv("C:/Users/hybaa/Desktop/CSC487/titanic.csv")
#Q4.A
passengers %>% drop_na() %>% summary()
#Q4.B
passengers %>% filter(Sex == "male")
#Q4.C
passengers %>% arrange(desc(Fare))
#Q4.D
passengers %>% mutate(FamSize = Parch + SibSp)
#Q4.E
passengers %>% group_by(Sex) %>% summarise(meanFare = mean(Fare), numSurv = sum(Survived))



#Q5
# Read 
diabetes <- read.csv("C:/Users/hybaa/Desktop/CSC487/diabetes_train.csv")

# Calculate selected percentiles for 'skin'
quantile(diabetes$skin, probs = c(0.10, 0.30, 0.50, 0.60), na.rm = TRUE)

