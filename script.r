source('./r_files/flatten_HTML.r')
source('./r_files/model_MTD.r')
source('./r_files/model_Daily.r')
# source('https://mckessoncorp.sharepoint.com/:u:/s/GRPmmsfinance89/ETUa56-d-RpImK-TqHKhhBABjVJicW1VUxFIECDoE0s9xA?e=pXoHq9')
# source('https://mckessoncorp.sharepoint.com/:u:/s/GRPmmsfinance89/EXWV76YNcmlCoWJX_MbiMt8BSYasmZ_I4vu0usNfkxAikQ?e=5yXqHN')
#`calendar` = read.csv('./assets/V_DIM_PERIOD.csv', check.names = FALSE, encoding = "UTF-8", blank.lines.skip = FALSE);
calendar <- as.data.frame(as.Date(seq(as.Date('2018-01-01'), as.Date('2019-12-31'),by = 1)))
colnames(calendar)[1] <- "DT"
calendar$SELL_DAY_FLG <- c('H','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N',
                            'Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N',
                            'Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','H','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N',
                            'Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','H','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N',
                            'Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','H','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N',
                            'Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','H','H','N','N','Y','Y','Y','Y','Y','N','N',
                            'Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','H','Y','Y','Y','N','N','Y','H','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N',
                            'Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N',
                            'Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N',
                            'Y','Y','Y','Y','Y','N','N','H','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','H','Y','N','N','Y','Y','Y','Y','Y','N','N',
                            'Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','H','Y','Y','Y','Y','N','N',
                            'Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N',
                            'Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','H','H','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y','N','N','Y','Y','H','Y','Y','N','N',
                            'Y','Y')

#source('https://mckessoncorp.sharepoint.com/:u:/r/sites/GRPmmsfinance89/Shared%20Documents/Daily%20Sales%20Scripts/DailySalesForecast.r?csf=1&e=CJy0Zy')
#fname <- tempfile()
#download.file("https://mckessoncorp.sharepoint.com/:u:/r/sites/GRPmmsfinance89/Shared%20Documents/Daily%20Sales%20Scripts/DailySalesForecast.r?csf=1&e=CJy0Zy", fname, method="wget")
#source(fname)
#unlink(fname)


############### Library Declarations ###############
#libraryRequireInstall("ggplot2");
#libraryRequireInstall("plotly");
listPackages <- c("curl","Rcpp","zoo","xts","colorspace","TTR","scales","munsell","lazyeval","plyr","tibble","rlang","tseries","forecast","data.table", "dplyr", "bindrcpp", "glue","purrr","ggplot2","htmltools","plotly","XML")

for (i in 1:length(listPackages)) {
  if(require(listPackages[i], character.only = TRUE)){
    print(paste(listPackages[i],"is loaded correctly", sep = " ", collapse = NULL))
  } else {
    print(paste("Trying to install",listPackages[i], sep = " ", collapse = NULL))
    install.packages(listPackages[i], repos='http://cran.us.r-project.org')
    if(require(listPackages[i], character.only = TRUE)){
      print(paste(listPackages[i], "installed and loaded", sep = " ", collapse = NULL))
    } else {
#      stop(paste("could not install",listPackages[i], sep = " ", collapse = NULL))
      warning(paste("could not install",listPackages[i], sep = " ", collapse = NULL))
    }
  }
}

####################################################
############ User Parameters #########

##PBI_PARAM Forecasting model
#Type:string, Default:"blue", Range:NA, PossibleValues:"daily", "mtd"
forecastmodel = "mtd"
if(exists("settings_model_params_forecastmodel")){
  forecastmodel = settings_model_params_forecastmodel
}

##PBI_PARAM Color of actual
#Type:string, Default:"blue", Range:NA, PossibleValues:"orange","blue","green","black",hex
lineColorActual = "#000000"
if(exists("settings_tseries_params_lineColorActual")){
  lineColorActual = settings_tseries_params_lineColorActual
}

##PBI_PARAM Size of actual line
#Type:numeric, Default: 1, Range:NA, PossibleValues:NA, Remarks: NA
lineWeightActual = 1
if(exists("settings_tseries_params_lineWeightActual")){
  lineWeightActual = settings_tseries_params_lineWeightActual/10
}

##PBI_PARAM Color of timeseries forecast
#Type:string, Default:"#005A8C", Range:NA, PossibleValues:"orange","blue","green","black",hex
lineColorModel = "#005A8C"
if(exists("settings_tseries_params_lineColorModel")){
  lineColorModel = settings_tseries_params_lineColorModel
}

##PBI_PARAM Size of timeseries forecast line
#Type:string, Default: 1, Range:NA, PossibleValues:NA, Remarks: NA
lineWeightModel = 1
if(exists("settings_tseries_params_lineWeightModel")){
  lineWeightModel = settings_tseries_params_lineWeightModel/10
}

##PBI_PARAM Color of month-end plan
#Type:string, Default:"blue", Range:NA, PossibleValues:"orange","blue","green","black", hex
lineColorPlan = "#000000"
if(exists("settings_plan_params_lineColor")){
  lineColor = settings_plan_params_lineColor
}

##PBI_PARAM Size of month-end plan line
#Type:string, Default: 1, Range:NA, PossibleValues:NA, Remarks: NA
lineWeightPlan = 1
if(exists("settings_plan_params_weight")){
  lineWeightPlan = settings_plan_params_weight/10
}

##PBI_PARAM Color of month-end forecast
#Type:string, Default:"blue", Range:NA, PossibleValues:"orange","blue","green","black", hex
lineColorForecast = "#EF8200"
if(exists("settings_forecast_params_lineColor")){
  lineColor = settings_forecast_params_lineColor
}

##PBI_PARAM Size of month-end forecast line
#Type:string, Default: 1, Range:NA, PossibleValues:NA, Remarks: NA
lineWeightForecast = 1
if(exists("settings_forecast_params_weight")){
  lineWeightForecast = settings_forecast_params_weight/10
}

# Set of parameters from GUI
#PBI_PARAM Confidence level line
#Type:numeric, Default: 0.8 , Range:[0,1], PossibleValues:NA, Remarks: GUI input is predefined set of values
conf1 = 0.8
if(exists("settings_tseries_params_conf1")){
  conf1 = as.numeric(settings_tseries_params_conf1)
}

#PBI_PARAM Confidence level line #2
#Type:numeric, Default: 0.95 , Range:[0,1], PossibleValues:NA, Remarks: NA
conf2 = 0.95
if(exists("settings_tseries_params_conf2")){
  conf2 = as.numeric(settings_tseries_params_conf2)
}

#PBI_PARAM Size of labels on axes
sizeLabel = 12
if(exists("settings_axes_params_textSize")){
  sizeLabel = settings_axes_params_textSize
}

###############Internal parameters definitions#################
# Set of parameters, which are not exported to GUI

###############Internal functions definitions#################

# return FALSE if canvas is too small
# goodPlotDimension = function(minWidthInch = 3,minHeightInch = 2.2)
# {
#   re = (par()$din[1] > minWidthInch) & (par()$din[2] > minHeightInch)
#   return(re)
# }


############# Input validation & initializations ############# 
colnames(calendar)[1] <- "DT"
calendar$DT <- as.Date(calendar$DT, format = "%m/%d/%Y")

if(conf2 < conf1)# swap
{   temp = conf1; conf1 = conf2; conf2 = temp}

validToPlot = TRUE

pbiWarning = ""

# gpd = goodPlotDimension()


################### Actual code ####################

#dataset <- Values

#if(exists("SpecialDays")){
#  dataset <- cbind(DateValues,VolumeValues,SpecialDays)
#}else{
  dataset <- cbind(DateValues,VolumeValues)
#}
dataset[,1] <- as.Date(dataset[,1], format = "%Y-%m-%d")
#dataset[,3] <- as.Date(dataset[,3], format = "%Y-%m-%d")
colnames(dataset)[1] <- "DT"

startDate <- min(as.Date(dataset$DT[!is.na(dataset[,2])], format = "%Y-%m-%d"))
endDate <- max(as.Date(dataset$DT[!is.na(dataset[,2])], format = "%Y-%m-%d"))

if(exists("CalcFilter")){
  DateFilter <- as.Date(CalcFilter[1,1], format = "%Y-%m-%d")
  endDate <- min(endDate, DateFilter)
}

if(exists("MonthFilter")){
  boolFilter <- length(unique(MonthFilter[,1])) == 1
}else{
  boolFilter <- FALSE
}

dataset <- dataset[!is.na("DT") & (dataset$DT <= endDate), ]

if(forecastmodel == "mtd"){
  dframe <- model_MTD(dframe = dataset,
                      conf1 = conf1,
                      conf2 = conf2,
                      startDate = startDate,
                      endDate = endDate,
                      dfSellDays = calendar)
}
if(forecastmodel == "daily"){
  dframe <- model_Daily(dframe = dataset,
                        conf1 = conf1,
                        conf2 = conf2,
                        startDate = startDate,
                        endDate = endDate,
                        dfSellDays = calendar)
}

if(exists("MonthForecast")){
  fcast <- MonthForecast[1,1]
  dframe$fcst <- fcast
}else{
  fcast <- 0
}
if(exists("MonthPlan")){
  plan <- MonthPlan[1,1]
  dframe$plan <- plan
}else{
  plan <- 0
}


axisValue <- c(10^0,10^3,10^6, 10^9)
axisLabel <- c("$","$K","$M","$B")
axisScaling <- data.frame(axisValue)
axisScaling$axisLabel <- axisLabel
axisScale <- tail(axisScaling[!is.na(axisScaling$axisValue) &
                                (axisScaling$axisValue < max(abs(dframe$forecast[!is.na(dframe$forecast)]))), ], n = 1L)

mytheme <- theme_classic() + theme(axis.line = element_line(colour = "#005A8C"),
                                   panel.grid.major = element_blank(),
                                   panel.grid.minor = element_blank(),
                                   panel.border = element_blank(),
                                   panel.background = element_blank(),
                                   axis.ticks = element_line(colour = "#005A8C"),
                                   axis.text = element_text(colour = "#005A8C"),
                                   text = element_text(colour = "#005A8C",
                                                       size = sizeLabel),
                                   axis.text.y = element_text(angle = 0)
)

gg <- ggplot(dframe, aes(x = DT, y = x)) + 
      geom_line(color = 'black', size=lineWeightActual) +
      geom_line(aes(x = DT, y = forecast),
                data = dframe,
                color = 'blue', size=lineWeightModel) +
      geom_ribbon(aes(x = DT, 
                      ymax = upper1, 
                      ymin = lower1),
                  data=dframe,
                  alpha = 0.33,
                  fill = "#005A8C") +
      geom_ribbon(aes(x = DT, 
                      ymax = upper2, 
                      ymin = lower2),
                  data=dframe,
                  alpha = 0.33,
                  fill = "#005A8C") +
      mytheme + 
      labs(x = NULL,
           caption = paste("(based on data through ", format(endDate , "%b %d, %Y"),")", sep = "")) +
      scale_y_continuous(name = axisScale$axisLabel, labels = function(x) x/axisScale$axisValue)
if (fcast != 0 & boolFilter == TRUE) {
  gg <- gg +       geom_line(aes(x = DT, y = fcast),
                             data = dframe,
                             color = lineColorForecast, size=lineWeightForecast)
}
if (plan != 0 & boolFilter == TRUE) {
  gg <- gg + geom_line(aes(x = DT, y = plan),
                       data = dframe,
                       color = lineColorPlan, size=lineWeightPlan)
}
####################################################

############# Create and save widget ###############
p = ggplotly(gg) %>% 
  config(displayModeBar = FALSE) %>% 
  layout(dragmode = "pan",
         hovermode = "x",
         margin = list(l = 50,
                       t = 0,
                       r = 0,
                       b = 20,
                       pad = 0),
         xaxis = list(fixedrange = TRUE),
         yaxis = list(fixedrange = TRUE));

# Custom formatting depending on whether forecast is daily or MTD
# Daily forecast has a data series (midpoint timeseries forecast)
# which has values for every day.  We will use this series to present
# the date value for the tooltip
#
# MTD forecast does not have a reliable data series that spans all dates,
# so the date value will be displayed in both the midpoint timeseries
# forecast as well as the Actuals series
if(forecastmodel=="mtd"){
  p$x$data[[1]]$text[!is.na(p$x$data[[1]]$y)] <-
    paste("Date:",format(dframe$DT,
                        "%b %d"),"<br />",
          "Actual:",round(p$x$data[[1]]$y[!is.na(p$x$data[[1]]$y)]/axisScale$axisValue,1));
}else{
  p$x$data[[1]]$text[!is.na(p$x$data[[1]]$y)] <-
    paste("Actual:",round(p$x$data[[1]]$y[!is.na(p$x$data[[1]]$y)]/axisScale$axisValue,1));
}
        
if(forecastmodel=="mtd"){
  p$x$data[[2]]$text[!is.na(p$x$data[[2]]$y)] <-
    paste("Date:",format(dframe$DT[length(p$x$data[[1]]$x[!is.na(p$x$data[[1]]$y)]):length(dframe$DT)],
                        "%b %d"),"<br />",
          "Projection:",round(p$x$data[[2]]$y[!is.na(p$x$data[[2]]$y)]/axisScale$axisValue,1));
}else{
  p$x$data[[2]]$text[!is.na(p$x$data[[2]]$y)] <-
  paste("Date:",format(dframe$DT,
                       "%b %d"),"<br />",
        "Projection:",round(p$x$data[[2]]$y[!is.na(p$x$data[[2]]$y)]/axisScale$axisValue,1));
}

#Prediction interval 1
vector_1 <- 
  paste0("Hi ",conf1*100,": ",round(p$x$data[[3]]$y[c((length(p$x$data[[3]]$y)-1):
                                               (length(p$x$data[[3]]$y)/2+1))]/axisScale$axisValue,1),
         "<br />",
         "Low ",conf1*100,": ",round(p$x$data[[3]]$y[c(1:
                                           (length(p$x$data[[3]]$y)/2)-1)]/axisScale$axisValue,1))
p$x$data[[3]]$text <- c(vector_1,vector_1[length(vector_1)],vector_1[length(vector_1):1],vector_1[1]);

#Prediction interval 2
vector_2 <- 
  paste0("Hi ",conf2*100,": ",round(p$x$data[[4]]$y[c((length(p$x$data[[4]]$y)-1):
                                           (length(p$x$data[[4]]$y)/2+1))]/axisScale$axisValue,1),
         "<br />",
         "Low ",conf2*100,": ",round(p$x$data[[4]]$y[c(1:
                                           (length(p$x$data[[4]]$y)/2)-1)]/axisScale$axisValue,1))
p$x$data[[4]]$text <- c(vector_2,vector_2[length(vector_2)],vector_2[length(vector_2):1],vector_2[1]);

if (fcast != 0 & boolFilter == TRUE) {
  p$x$data[[5]]$text <- paste0("Forecast: ",round(p$x$data[[5]]$y/axisScale$axisValue,1));
}
if (plan != 0 & boolFilter == TRUE) {
  p$x$data[[6]]$text <- paste0("Plan: ",round(p$x$data[[6]]$y/axisScale$axisValue,1));
}

internalSaveWidget(p, 'out.html');
####################################################
