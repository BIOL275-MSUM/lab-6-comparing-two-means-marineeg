Lab 6 Comparing means
================
2021-04-28

Fill out this report and submit it as your completed assignment.

You can view the R markdown script that created this report here:
[README.Rmd](README.Rmd)

## \(t\)-test

Researchers studying the number of electric fish species living in
various parts of the Amazon basin were interested in whether the
presence of tributaries affected the local number of electric fish
species in the main rivers (Fernandes et al. 2004).

They counted the number of electric fish species above and below the
entrance point of a major tributary at 12 different river locations.

The data is provided in your GitHub repository.

For each question below, write a sentence answering the question and
show the code you used to come up with the answer, if applicable.

### Question A

> Test the hypothesis that the tributaries have no effect on the number
> of species of electric fish.

``` library(tidyverse)

fish <- read_csv(file ="chap12q19ElectricFish.csv")

electric_fish <- 
  pivot_longer(fish, speciesUpstream:speciesDownstream,
               names_to = "location",
               values_to = "species") %>%
  mutate(location = str_remove(location, c("speccies"))) %>%
  print()

t.test(species ~ location, data = electric_fish)
```

### Question B

> What is the difference in the mean numbers of species between areas
> upstream and downstream of a tributary? What is the 95% confidence
> interval of this difference in means?

The mean difference is the downstream (16.41667) - upstream (14.58333)
which = 1.83334 The 95% confidence interval is -4.587031 8.253697

### Question C

> State the assumptions that you had to make to complete parts (A) and
> (B). Create a graph to assess whether one of those assumptions was
> met.

    electric_fish %>%
      ggplot(aes(x = species)) +
      geom_histogram(aes(fill = location),
                     bins = 10,
                     alpha = 0.5,
                     position = "identity") +
      scale_fill_manual(values = c("darkorange", "cyan4")) +
      theme_minimal()

P is greater than alpha so we do not reject the null, we accept the
alternative: there is no significant difference in the species counts.

## ANOVA

Fiddler crabs are so called because males have a greatly enlarged
“major” claw, which is used to attract females and to defend a
burrow.

Darnell and Munguia (2011) recently suggested that this appendage might
also act as a heat sink, keeping males cooler while out of the burrow on
hot days.

To test this, they placed four groups of crabs into separate plastic
cups and supplied a source of radiant heat (60-watt light bulb) from
above. The four groups were intact male crabs, male crabs with the major
claw removed; male crabs with the other (minor) claw removed (control);
and intact female fiddler crabs.

They measured the body temperature of crabs every 10 minutes for 1.5
hours. These measurements were used to calculate a rate of heat gain for
every individual crab in degrees C/log minute. Rates of heat gain for
all crabs are provided in the accompanying data file.

### Question D

> Graph the distribution of body temperatures for each crab type:

    ggplot(crabs, aes(x=crabType, y = bodyTemperature)) +
      geom_point(size = 2, color = "red") +
      geom_smooth (method = lm)

### Question E

> Does body temperature vary among crab types? State the null and
> alternative hypothesis, conduct and ANOVA, and interpret the results.

    aov_crabs <-
      aov(bodyTemperature ~ crabType, data = crabs)
    aov_crabs
    
    summary(aov_crabs)

The null hypothesis would be that the temperature does not vary between
crab type. The alternative hypothesis would be that the temperature does
vary
