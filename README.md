# PSYTOOLKITTOOLS

[![Build master branch](https://github.com/condecon/psytoolkittools/actions/workflows/r_master.yml/badge.svg)](https://github.com/condecon/psytoolkittools/actions/workflows/r_master.yml)

[![Build dev branch](https://github.com/condecon/psytoolkittools/actions/workflows/r_dev.yml/badge.svg)](https://github.com/condecon/psytoolkittools/actions/workflows/r_dev.yml)

## Installing 

**Current Release**
To install the current release, use the following R code:
```r
install.packages("psytoolkittools", repos = "https://condecon.de/packages")
```
**Latest master branch version**
You can also download the latest source code and compile the package yourself.
```r
library(devtools)
install_github("condecon/psytoolkittools")
```
Please note, RTools are required for compiling the source code.

## Loading Data

At first, download your survey and experiment results from the
PsyToolkit website. You will receive a .ZIP file. Move this file to your
current R working directory.

In R, load the `psytoolkittools` package and run the `load.survey(filename)` function.
For example:
```r
library(psytoolkittools)
data <- load.survey("data.zip")
```
The function returns a data frame with the survey answers.
A folder called "psy_data" is created. Do not delete this folder as it is necessary for loading experiment data.

### Loading Experiment Data
To easily load the experiment data, the package provides the `load.experiment.data()` function.
This functions requires two arguments:
- Column with the experiment data file names
- Vector of strings which correspond to the structure of the saved experiment data

The function returns a data frame which can be combined with the survey data frame by passing it to the function.
```r
load.experiment(experiment.file.names, label.structure, merge.dataframe = surveydata)
```

# Utilities

## `recode.keys`
In PsyToolkit, when saving keys, the pressed key itself is not saved instead the position in which the key was defined is saved.
For further analysis, it can be helpful to reverse the saved value to the name of the original key that has been pressed by the participant.
In this case `recode.keys()` can be used.
The function takes to parameters. The first is the vector or column that shall be recoded. The second parameter is a vector of characters in which the characters are in the same line up than in the experiment code.
For example:
```
#experiment code
...
keys 1 2 3 4 space
...
```

```r
#R code
recode.keys(data, c("1", "2", "3", "4", "space"))
```
## `recode.status`

In PsyToolkit experiments, a status of 1 represents a correct and 2 an incorrect answer. 3 represents a time out.\
With `recode.status()`, status codes can be recoded to custom values.

*Example:*

```r
recode.status(vector, correct = 1, error = 0, timeout = -99)
```