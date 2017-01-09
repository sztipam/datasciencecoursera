# Datascience Courswe 5, Week 2, Peer Graded Assignment
Mate Sztipanovits  
Thursday, January 05, 2017  

# Reading and formatting the data

```r
setwd("~/Documents/My Documents/Certificates/Data Science Specialization/Course 5 - Reproducible Research/course-project-1")
values<-read.csv("activity.csv")
activity<-data.frame(steps=as.numeric(values$steps),
                     date=as.Date(values$date),
                     interval=as.numeric(values$interval))
```

# Histogram of the total number of steps taken each day

```r
total<-aggregate(steps~date,data=activity,sum)
hist(total$steps,main="Total number of steps taken each day.",
     xlab="Total steps")
```

![](PA1_template_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

# Mean and median number of steps taken each day

```r
m.1<-aggregate(steps~date,data=activity,mean)
barplot(m.1[,2],main="Average number of steps taken each day.",
        xlab="Days",ylab="Average number of steps")
```

![](PA1_template_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

# Time series plot of the average number of steps taken

```r
plot(m.1$date,m.1$steps,type="l",main="Average number of steps taken",
     xlab="Date",ylab="Steps")
```

![](PA1_template_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

# The 5-minute interval that, on average, 
# contains the maximum number of steps

```r
interval.max<-aggregate(steps~interval,data=activity,max)
barplot(interval.max$steps,main="Maximum number of steps by 5-minute interval.",
        xlab="5 minute intervals",ylab="Maximum number of steps")
```

![](PA1_template_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

# Code to describe and show a strategy for imputing missing data

```r
imputed.steps <- {
        size<-length(t(activity$steps))
        imputed.steps <- 1:size
        for(l in 1:size) {
                if (is.na(activity$steps[l])) {
                        imputed.steps[l]<-1
                }
                else {
                        imputed.steps[l]<-activity$steps[l]
                }
        }
        imputed.steps
}
```

# Histogram of the total number of steps taken each day after missing
# values are imputed

```r
imputed.steps.daily<-aggregate(imputed.steps~activity$date,FUN=sum)
hist(imputed.steps.daily$imputed.steps)
```

![](PA1_template_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

# Panel plot comparing the average number of steps taken per 5-minute 
# interval across weekdays and weekends

```r
weekday.activity<-weekdays(activity$date)%in%c("Monday","Tuesday","Wednesday","Thursday","Friday")
weekend.activity<-!weekday.activity
par(mfrow=c(1,2))
ave.steps.weekend<-aggregate(activity[,1]~weekend.activity+activity[,3],FUN=mean)
ave.steps.weekday<-aggregate(activity[,1]~weekday.activity+activity[,3],FUN=mean)
plot(ave.steps.weekday[,3],type="l",main="Weekday",xlab="5 minute intervals",ylab="Average steps")
plot(ave.steps.weekend[,3],type="l",main="Weekend",xlab="5 minute intervals",ylab="Average steps")
```

![](PA1_template_files/figure-html/unnamed-chunk-8-1.png)<!-- -->
