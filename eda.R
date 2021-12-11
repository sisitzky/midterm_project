library(tidyverse)
library(ggplot2)
library(lme4)
library(jtools)
library(lmerTest)


# read data and remove blank row
df <- read.csv("stats.csv")
df <- df[,-38]  

# create babip variable
df$b_babip <- (df$b_total_hits - df$b_home_run) / (df$b_ab - df$b_home_run - df$b_strikeout + df$b_total_sacrifices)  

# creating subset without 2020 data
df_no_2020 <- df %>%
                subset(year != '2020')

# exit velocity plot
ggplot(df_no_2020, aes(x = log(exit_velocity_avg), y = log(b_babip), color = as.factor(year))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Exit Velocity", color = "Year", caption = "Figure 1")

# creating launch angle subset
la_df_no_2020 <- df_no_2020 %>%
                  filter(launch_angle_avg > .5)

# launch angle plot
ggplot(la_df_no_2020, aes(x = log(launch_angle_avg), y = b_babip, color = as.factor(year))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# sweetspot % plot
ggplot(df_no_2020, aes(x = log(sweet_spot_percent), y = log(b_babip), color = as.factor(year))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# barrel rate plot
ggplot(df_no_2020, aes(x = log(barrel_batted_rate), y = log(b_babip), color = as.factor(year))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# oz contact % plot
ggplot(df_no_2020, aes(x = log(oz_contact_percent), y = log(b_babip), color = as.factor(year))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# iz contact % plot
ggplot(df_no_2020, aes(x = log(iz_contact_percent), y = log(b_babip), color = as.factor(year))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


