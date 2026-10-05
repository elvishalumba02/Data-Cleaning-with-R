---
title: "Data Cleaning"
---

### Data Cleaning

```{r}
library(tidyverse)

df_m <- read.csv("C:\\Users\\Hp\\OneDrive\\Documentos\\Excel, R & Power BI\\Messy_Dataset.csv",
                 na.strings = c("", NA))

colSums(is.na(df_m))
view(df_m)
```

### Missing Data

```{r}
df_cleaned <-  df_m %>% drop_na("Email")
view(df_cleaned)
```



```{r}
df_cleaned$Transaction_Amount[is.na(df_cleaned$Transaction_Amount)] <- mean(
  df_cleaned$Transaction_Amount, na.rm = TRUE)
view(df_cleaned)
```



```{r}
df_cleaned$Customer_Name[is.na(df_cleaned$Customer_Name)] <- "Unknown"
view(df_cleaned)
```

### Handling Date

```{r}
library(lubridate)

df_cleaned$Transaction_Date <-  parse_date_time(df_cleaned$Transaction_Date, 
                                                orders = c("Y-m-d", "m/d/Y", "Y/m/d", "d-m-Y"))
view(df_cleaned)
```


```{r}
df_cleaned$Transaction_Date_Year <- year(df_cleaned$Transaction_Date)
view(df_cleaned)
```

```{r}
df_cleaned$Transaction_Date_Month <- month(df_cleaned$Transaction_Date)
view(df_cleaned)
```

```{r}
df_cleaned$Transaction_Date_Day <- day(df_cleaned$Transaction_Date)
view(df_cleaned)
```

### Duplicates

```{r}
library(dplyr)

df_cleaned %>%
  distinct()

df_cleaned_1 <- df_cleaned %>%
                    distinct()
view(df_cleaned_1)
```


```{r}
df_cleaned_1 <- df_cleaned %>%
                    distinct()
view(df_cleaned_1)
```


```{r}
df_cleaned_2 <- df_cleaned_1 %>%
                    distinct(Customer_ID, .keep_all = TRUE)
view(df_cleaned_2)
```



```{r}
df_cleaned_3 <- df_cleaned_2 %>%
  arrange(Customer_ID, desc(Transaction_Date)) %>%
  distinct(Customer_ID, .keep_all = TRUE)
view(df_cleaned_3)
```



```{r}
df_cleaned_final <- df_cleaned_3
view(df_cleaned_final)
```




















