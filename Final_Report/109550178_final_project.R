data(EuStockMarkets)
#?EuStockMarkets
names(EuStockMarkets)
head(EuStockMarkets)
class(EuStockMarkets)
#covert class to data frame
data <- data.frame(EuStockMarkets)
class(data)

#original data
library(ggplot2)

x<-seq(1,1860,1)
dax <- data.frame(x=x, y=data$DAX, label=c("DAX"))
smi <- data.frame(x=x, y=data$SMI, label=c("SMI"))
cac <- data.frame(x=x, y=data$CAC, label=c("CAC"))
ftse <- data.frame(x=x, y=data$FTSE, label=c("FTSE"))
data.plot <- rbind.data.frame(dax,smi,cac,ftse)

ggplot(data = data.plot, aes(x,y))+
     geom_line(data = data.plot
               , aes(x,y, color = label)
               , size = 0.6)+
     labs(title = "Daily Closing Price of Stock Indices(1991-1998)",
          x = "Days",
          y = "Price")+
     scale_color_discrete(name = "Label")

#install.packages("tidyverse")
library(tidyverse)
library(caret)
library(gridExtra)
theme_set(theme_classic())


set.seed(123)
stock <- dax


for (i in 1:4) {
  if(i==2) stock<-smi
  if(i==3) stock<-cac
  if(i==4) stock<-ftse
  # Split the data into training and test set
  training.samples <- stock$y %>%
    createDataPartition(p = 0.8, list = FALSE)
  train.data  <- stock[training.samples, ]
  test.data <- stock[-training.samples, ]
  #Linear Regression
  # Build the model
  model <- lm(y ~ x, data = train.data)
  # Make predictions
  predictions <- model %>% predict(test.data)
  # Model performance
  f1<-data.frame(
    RMSE = RMSE(predictions, test.data$y),
    R2 = R2(predictions, test.data$y)
  )
  
  #ggplot(train.data, aes(x, y) ) +
    #geom_point() +
    #stat_smooth(method = lm, formula = y ~ x)
  
  
  
  #Polynomial Regression
  lm(y ~ x + I(x^2), data = train.data)
  lm(y ~ poly(x, 2, raw = TRUE), data = train.data)
  lm(y ~ poly(x, 6, raw = TRUE), data = train.data) %>%
    summary()
  
  # Build the model
  model <- lm(y ~ poly(x, 5, raw = TRUE), data = train.data)
  # Make predictions
  predictions <- model %>% predict(test.data)
  # Model performance
  f2<-data.frame(
    RMSE = RMSE(predictions, test.data$y),
    R2 = R2(predictions, test.data$y)
  )
  print(stock$label[1])
  print("Linear Regression")
  print(f1)
  print("Polynomial Regression")
  print(f2)
  print(summary(model))
  if(i==1){
    g1<-ggplot(train.data, aes(x, y, colours(distinct = TRUE)) ) +
      geom_point() +
      stat_smooth(method = lm, formula = y ~ poly(x, 5, raw = TRUE))+
      stat_smooth(method = lm, formula = y ~ x)+
      labs(title = as.character(stock$label),xlab("Number"),ylab("Price"))
  }
  if(i==2){
    g2<-ggplot(train.data, aes(x, y, colours(distinct = TRUE)) ) +
      geom_point() +
      stat_smooth(method = lm, formula = y ~ poly(x, 5, raw = TRUE))+
      stat_smooth(method = lm, formula = y ~ x)+
      labs(title = as.character(stock$label),xlab("Number"),ylab("Price"))
  }
  if(i==3){
    g3<-ggplot(train.data, aes(x, y) ) +
      geom_point() +
      stat_smooth(method = lm, formula = y ~ poly(x, 5, raw = TRUE))+
      stat_smooth(method = lm, formula = y ~ x)+
      labs(title = as.character(stock$label),xlab("Number"),ylab("Price"))+
      scale_colour_discrete(name = "Label")
  }
  if(i==4){
    g4<-ggplot(train.data, aes(x, y, colours(distinct = TRUE)) ) +
      geom_point() +
      stat_smooth(method = lm, formula = y ~ poly(x, 5, raw = TRUE))+
      stat_smooth(method = lm, formula = y ~ x)+
      labs(title = as.character(stock$label),xlab("Number"),ylab("Price"))
  }
}
grid.arrange(g1,g2,g3,g4,nrow=2)
  
  #update data
library(rio)
data.update <- import("EuStockMarkets_update.csv")


x.update<-seq(1,7736,1)
dax.update <- data.frame(x=x.update, y=data.update$DAX, label=c("DAX"))
smi.update <- data.frame(x=x.update, y=data.update$SMI, label=c("SMI"))
cac.update <- data.frame(x=x.update, y=data.update$CAC, label=c("CAC"))
ftse.update <- data.frame(x=x.update, y=data.update$FTSE, label=c("FTSE"))
data.update.plot <- rbind.data.frame(dax.update,smi.update,cac.update,ftse.update)


ggplot(data = data.update.plot, aes(x,y))+
  geom_line(data = data.update.plot
            , aes(x,y, color = label)
            , size = 0.6)+
  labs(title = "Daily Closing Price of Stock Indices",
       x = "Days",
       y = "Price")+
  scale_color_discrete(name = "Label")



stock<-dax.update
# Split the data into training and test set
training.samples <- stock$y %>%
  createDataPartition(p = 0.8, list = FALSE)
train.data  <- stock[training.samples, ]
test.data <- stock[-training.samples, ]
#Polynomial Regression
lm(y ~ x + I(x^2), data = train.data)
lm(y ~ poly(x, 2, raw = TRUE), data = train.data)
lm(y ~ poly(x, 6, raw = TRUE), data = train.data) %>%
  summary()

# Build the model
model <- lm(y ~ poly(x, 5, raw = TRUE), data = train.data)
# Make predictions
predictions <- model %>% predict(test.data)
# Model performance
data.frame(
  RMSE = RMSE(predictions, test.data$y),
  R2 = R2(predictions, test.data$y)
)


set.seed(123)
stock <- dax.update

for (i in 1:4) {
  if(i==2) stock<-smi.update
  if(i==3) stock<-cac.update
  if(i==4) stock<-ftse.update
  # Split the data into training and test set
  training.samples <- stock$y %>%
    createDataPartition(p = 0.8, list = FALSE)
  train.data  <- stock[training.samples, ]
  test.data <- stock[-training.samples, ]
  #Linear Regression
  # Build the model
  model <- lm(y ~ x, data = train.data)
  # Make predictions
  predictions <- model %>% predict(test.data)
  # Model performance
  f1<-data.frame(
    RMSE = RMSE(predictions, test.data$y),
    R2 = R2(predictions, test.data$y)
  )
  
  #ggplot(train.data, aes(x, y) ) +
  #geom_point() +
  #stat_smooth(method = lm, formula = y ~ x)
  
  
  
  #Polynomial Regression
  lm(y ~ x + I(x^2), data = train.data)
  lm(y ~ poly(x, 2, raw = TRUE), data = train.data)
  lm(y ~ poly(x, 6, raw = TRUE), data = train.data) %>%
    summary()
  
  # Build the model
  model <- lm(y ~ poly(x, 5, raw = TRUE), data = train.data)
  # Make predictions
  predictions <- model %>% predict(test.data)
  # Model performance
  f2<-data.frame(
    RMSE = RMSE(predictions, test.data$y),
    R2 = R2(predictions, test.data$y)
  )
  print(stock$label[1])
  print("Linear Regression")
  print(f1)
  print("Polynomial Regression")
  print(f2)
  print(summary(model))
  if(i==1){
    g1<-ggplot(train.data, aes(x, y, colours(distinct = TRUE)) ) +
      geom_point() +
      stat_smooth(method = lm, formula = y ~ poly(x, 5, raw = TRUE))+
      stat_smooth(method = lm, formula = y ~ x)+
      labs(title = as.character(stock$label),xlab("Number"),ylab("Price"))
  }
  if(i==2){
    g2<-ggplot(train.data, aes(x, y, colours(distinct = TRUE)) ) +
      geom_point() +
      stat_smooth(method = lm, formula = y ~ poly(x, 5, raw = TRUE))+
      stat_smooth(method = lm, formula = y ~ x)+
      labs(title = as.character(stock$label),xlab("Number"),ylab("Price"))
  }
  if(i==3){
    g3<-ggplot(train.data, aes(x, y) ) +
      geom_point() +
      stat_smooth(method = lm, formula = y ~ poly(x, 5, raw = TRUE))+
      stat_smooth(method = lm, formula = y ~ x)+
      labs(title = as.character(stock$label),xlab("Number"),ylab("Price"))+
      scale_colour_discrete(name = "Label")
  }
  if(i==4){
    g4<-ggplot(train.data, aes(x, y, colours(distinct = TRUE)) ) +
      geom_point() +
      stat_smooth(method = lm, formula = y ~ poly(x, 5, raw = TRUE))+
      stat_smooth(method = lm, formula = y ~ x)+
      labs(title = as.character(stock$label),xlab("Number"),ylab("Price"))
  }
}
grid.arrange(g1,g2,g3,g4,nrow=2)
