library(readr)
library(survival)
library(survminer)

castaways <- read_csv("./castaways2.csv")
castaways$event <- !castaways$is_censored

ggsurvplot(survfit(Surv(elim, event) ~ sex, data = castaways))
ggsurvplot(survfit(Surv(elim, event) ~ agegroup, data = castaways))
ggsurvplot(survfit(Surv(elim, event) ~ agegroup+sex, data = castaways))

ggsurvplot(survfit(Surv(elim, event) ~ school + agegroup, data = castaways[(castaways$sex == 'Male')])) + ggtitle('Male castaways')#, conf.int = TRUE, risk.table = TRUE)
ggsurvplot(survfit(Surv(elim, event) ~ school + agegroup, data = castaways[(castaways$sex == 'Female')&(castaways$agegroup=='Old'),]))#, conf.int = TRUE, risk.table = TRUE)

ggsurvplot(survfit(Surv(elim, event) ~ agegroup, data = castaways[castaways$school=='Old School',]))
ggsurvplot(survfit(Surv(elim, event) ~ agegroup, data = castaways[castaways$school=='New School',]))

ggsurvplot(survfit(Surv(elim, event) ~ sex, data = castaways[castaways$school=='Old School',]))
ggsurvplot(survfit(Surv(elim, event) ~ sex, data = castaways[castaways$school=='New School',]))

ggsurvplot(survfit(Surv(elim, event) ~ coast, data = castaways))
ggsurvplot(survfit(Surv(elim, event) ~ region, data = castaways))
