source("eda.R")

library(tidyverse)
library(ggplot2)
library(lme4)
library(jtools)
library(lmerTest)

model <- lmer(b_babip ~ sprint_speed + exit_velocity_avg + launch_angle_avg + sweet_spot_percent + (1 + exit_velocity_avg|year) + (1 + launch_angle_avg|year) + (1 + sweet_spot_percent|year), data = df_no_2020, REML = FALSE)
summary(model)
summ(model)
ranova(model)

ranef(model)
fixef(model)
coef(model)[1]

plot(model)
qqnorm(resid(model))
qqline(resid(model))

