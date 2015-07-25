##library(UsingR)
##data(galton)
data(ToothGrowth)

data (mtcars)
mtcars$cyl <- factor(mtcars$cyl)
##mtcars$vs <- factor(mtcars$vs)
##mtcars$gear <- factor(mtcars$gear)
##mtcars$carb <- factor(mtcars$carb)
mtcars$am <- as.factor(mtcars$am)
levels(mtcars$am) <- c("Automatic", "Manual")

shinyServer(
    function(input, output) {
        
        frsq<-0
       
        output$newPlot <- renderPlot({
                features<-input$feature
                if (length(features) != 0) {
                        
                        i<-2
                        minwt<-input$minwt
                        cardata<-subset(mtcars, wt>minwt)
                        fml<-paste("mpg ~ ", features[1])
                        while(i <= length(features)){
                                fml<-paste(fml,"+",features[i])
                                i<-i+1
                        }
                       
                        finalfit <- lm(as.formula(fml), data = cardata)
                        coeff<-summary(finalfit)$coefficients[,1]
                        frsq<-round(100*summary(finalfit)$r.squared,2)
                        output$orsq <- renderPrint({frsq})
                        output$ocoeff <- renderPrint({coeff})
                        par(mfrow = c(2,2))
                        plot(finalfit)
                }
                else {
                        plot(0,0,main='Select at least one feature')
                        output$orsq <- renderPrint(NULL)
                        output$ocoeff <- renderPrint(NULL)
                }
                
        })
        
        output$oid1 <- renderPrint({frsq})
        
  
        
    }
)