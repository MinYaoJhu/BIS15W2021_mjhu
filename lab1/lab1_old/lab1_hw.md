---
title: "Lab 1 Homework"
author: "Please Add Your Name Here"
date: "2020-12-29"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run.  

**1. Navigate to the R console and calculate the following expressions.**  
  + 5 - 3 * 2  
  + 8 / 2 ** 2  
  

```r
5 - 3 * 2
```

```
## [1] -1
```


```r
8 / 2 ** 2
```

```
## [1] 2
```

**2. Did any of the results in #1 surprise you? Write two programs that calculate each expression such that the result for the first example is 4 and the second example is 16.**  


```r
(5 - 3) * 2
```

```
## [1] 4
```


```r
(8 / 2) ** 2
```

```
## [1] 16
```


**3. Make a new object `pi` as 3.14159265359.**  


```r
pi <- 3.14159265359
pi
```

```
## [1] 3.141593
```


**4. Is `pi` an integer or numeric? Why? Show your code.**  


```r
class(pi)
```

```
## [1] "numeric"
```


**5. You have decided to use your new analysis powers in R to become a professional gambler. Here are your winnings and losses this week. Note that you don't gamble on the weekends!**  

```r
blackjack <- c(140, -20, 70, -120, 240, NA, NA)
roulette <- c(60, 50, 120, -300, 10, NA, NA)
```

**a. Build a new vector called `days` for the days of the week.** 


```r
days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
```


We will use `days` to name the elements in the poker and roulette vectors.

```r
names(blackjack) <- days
names(roulette) <- days
```

**b. Calculate how much you won or lost in blackjack over the week.**  


```r
sum(blackjack)
```

```
## [1] NA
```

**c. What is your interpretation of this result? What do you need to do to address the problem? Recalculate how much you won or lost in blackjack over the week.**  


```r
anyNA(blackjack)
```

```
## [1] TRUE
```

```r
sum(blackjack, na.rm=T)
```

```
## [1] 310
```

**d. Calculate how much you won or lost in roulette over the week.**  


```r
sum(roulette, na.rm=T)
```

```
## [1] -60
```

**e. Build a `total_week` vector to show how much you lost or won on each day over the week. Which days seem lucky or unlucky for you?**


```r
total_week <- blackjack + roulette
total_week
```

```
##    Monday   Tuesday Wednesday  Thursday    Friday  Saturday    Sunday 
##       200        30       190      -420       250        NA        NA
```

**f. Should you stick to blackjack or roulette? Write a program that verifies this below.**  


```r
sum(blackjack, na.rm=T)>sum(roulette, na.rm=T)
```

```
## [1] TRUE
```


## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.  
