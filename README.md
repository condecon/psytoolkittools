---
editor_options: 
  markdown: 
    wrap: sentence
bibliography: references.bib
---

# PSYTOOLKITTOOLS

PsyToolkit (Stoet 2010, 2017) is a free platform for online psychological research and information.
It allows you to create and run cognitive-psychological experiments and surveys, including personality tests, in your browser.

However, if you want to analyze your PsyToolkit data in R, you might encounter some challenges.
For example, how do you import survey and experiment data into R?

That's why I am developing a new R package called **psytoolkittools**.

The package is designed to help researchers analyze their data more efficiently.
With this package, you can easily integrate survey and experiment data from you PsyToolkit experiments and surveys.

Also, some other useful utilities are available such as to recode your key responses and statuses, and to get an overview over you survey.

## Installing

**Current Release**

To install the current release, use the following R code:

``` r
install.packages("psytoolkittools", repos = "https://condecon.de/packages")
```

**Latest master branch version**

You can also download the latest source code and compile the package yourself.

``` r
library(devtools)
install_github("condecon/psytoolkittools")
```

Please note, RTools are required for compiling the source code.

## Loading Data

At first, download your survey and experiment results from the PsyToolkit website.
You will receive a .ZIP file.
Move this file to your current R working directory.

In R, load the `psytoolkittools` package and run the `load.survey(filename)` function.
For example:

``` r
library(psytoolkittools)
data <- load.survey("data.zip")
```

The function returns a data frame with the survey answers.
A folder called "psy_data" is created.
Do not delete this folder as it is necessary for loading experiment data.

### Loading Experiment Data

To easily load the experiment data, the package provides the `load.experiment.data()` function.
This functions requires two arguments: - Column with the experiment data file names - Vector of strings which correspond to the structure of the saved experiment data

The function returns a data frame which can be combined with the survey data frame by passing it to the function.

``` r
load.experiment(experiment.file.names, label.structure, merge.dataframe = surveydata)
```

## Using this package

When using this package in you project, please cite use this biblatex entry.

```{biblatex}
  @Manual{,
    title = {psytoolkittools: Working with PsyToolkit surveys and experiments},
    author = {Jonas Engicht},
    year = {2023},
    url = {https://github.com/condecon/psytoolkittools},
  }
```

## References

Stoet, Gijsbert.
2010.
"PsyToolkit: A Software Package for Programming Psychological Experiments Using Linux." *Behavior Research Methods* 42 (4): 1096--1104.
<https://doi.org/10.3758/BRM.42.4.1096>.

---------.
2017.
"PsyToolkit: A Novel Web-Based Method for Running Online Questionnaires and Reaction-Time Experiments." *Teaching of Psychology* 44 (1): 24--31.
<https://doi.org/10.1177/0098628316677643>.
