model_MTD = function(dframe, conf1, conf2, startDate, endDate, dfSellDays)
{
    freq <- 7
    fcWeeks <- 5
    numFC <- 1
    sizeFramePerFC <- freq*fcWeeks*numFC
    sum_DF <- aggregate(dframe[,2], by=list(DT=dframe[,1]), FUN=sum)
    sum_DF <- sum_DF[!is.na(sum_DF[,2]),]
#    fcStartDate placeholder to align with Daily model   
    holidayp <- calendar[!is.na(calendar$DT)
                         & (calendar$DT <= endDate)
                         & (calendar$DT >= startDate),2]
    
    holidayf <- calendar[!is.na(calendar$DT)
                         & (calendar$DT > endDate)
                         & (calendar$DT <= (endDate + sizeFramePerFC)),2]
    subDate <- as.data.frame(seq(as.Date(startDate), length = endDate - startDate+1, by = "days"))
    colnames(subDate)[1] <- "DT"
    plotDate <- as.data.frame(seq(as.Date(startDate), length = endDate - startDate+1 + sizeFramePerFC, by = "days"))
    colnames(plotDate)[1] <- "DT"

    sum_DF <- full_join(subDate, sum_DF) %>% group_by(DT) %>% mutate_all(funs(ifelse(is.na(.),0,.)))
    sum_DF[,2] <- cumsum(sum_DF[,2])
    startingVal <- sum_DF$x[!is.na(sum_DF$DT) & (sum_DF$DT == (endDate - as.numeric(format(endDate, "%d"))))]
    startingVal <- if(is_empty(startingVal)==TRUE){
                        startingVal <- 0 
                        } else {
                        startingVal
                        }
    sum_DF[,2] <- sum_DF[,2]-startingVal

    ts <- ts(sum_DF$x,
            frequency=freq)
#    ts_clean <- tsclean(ts)
#    ts_fit <- ets(ts_clean, model = "ANA")
#    ts_fc <- forecast(ts_fit, h=freq*fcWeeks, level = c(conf1, conf2))
    if (length(unique(as.integer(holidayp == 'H'))) == 1) {
      ts_fit <- auto.arima(ts)
      ts_fc <- forecast(ts_fit, h=freq*fcWeeks, level = c(conf1, conf2))
    } else {
      ts_fit <- auto.arima(ts, xreg = as.integer(holidayp == 'H'))
      ts_fc <- forecast(ts_fit, xreg = as.integer(holidayf == 'H'), h=freq*fcWeeks, level = c(conf1, conf2))
    }

    dframe <- full_join(plotDate, sum_DF) %>% group_by(DT) %>% mutate_all(funs(ifelse(is.na(.),0,.)))

    dframe2 <- cbind(DT = seq(as.Date(endDate)+1, length = sizeFramePerFC, by = "days"), 
                    forecast = data.frame(ts_fc$mean), 
                    upper1 = data.frame(ts_fc$upper[,1]), 
                    upper2 = data.frame(ts_fc$upper[,2]), 
                    lower1 = data.frame(ts_fc$lower[,1]),
                    lower2 = data.frame(ts_fc$lower[,2]))
    colnames(dframe2)[2] <- "forecast"
    colnames(dframe2)[3] <- "upper1"
    colnames(dframe2)[4] <- "upper2"
    colnames(dframe2)[5] <- "lower1"
    colnames(dframe2)[6] <- "lower2"

    dframe <- full_join(dframe, dframe2) %>% group_by(DT) %>% mutate_all(funs(ifelse(is.na(.),NA,.)))
    dframe$x[!is.na(dframe$x) & (dframe$DT>endDate)] <- NA

    dframe <- dframe[!is.na(dframe$DT) & 
                    (format(dframe$DT, "%Y/%m") == format(endDate+1, "%Y/%m")), ]
    dframe$forecast[!is.na(dframe$DT) & (dframe$DT == endDate)] <- 
      dframe$x[!is.na(dframe$DT) & (dframe$DT == endDate)]
    dframe$upper1[!is.na(dframe$DT) & (dframe$DT == endDate)] <- 
      dframe$x[!is.na(dframe$DT) & (dframe$DT == endDate)]
    dframe$upper2[!is.na(dframe$DT) & (dframe$DT == endDate)] <- 
      dframe$x[!is.na(dframe$DT) & (dframe$DT == endDate)]
    dframe$lower1[!is.na(dframe$DT) & (dframe$DT == endDate)] <- 
      dframe$x[!is.na(dframe$DT) & (dframe$DT == endDate)]
    dframe$lower2[!is.na(dframe$DT) & (dframe$DT == endDate)] <- 
      dframe$x[!is.na(dframe$DT) & (dframe$DT == endDate)]

    dframe
}