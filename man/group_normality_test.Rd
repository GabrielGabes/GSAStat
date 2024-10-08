% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/group_normality_test.R
\name{group_normality_test}
\alias{group_normality_test}
\title{group_normality_test}
\usage{
group_normality_test(df, col_num, col_cat, type_response = 0)
}
\arguments{
\item{df}{A data frame containing the data to be tested.}

\item{col_num}{A string representing the name of the numeric variable to be tested for normality.}

\item{col_cat}{A string representing the name of the categorical variable that defines the groups.}

\item{type_response}{An integer that specifies the type of output.
If \code{0}, the function returns a data frame with the p-values for each group.
If \code{1}, the function returns \code{TRUE} if all groups follow a normal distribution, and \code{FALSE} otherwise. Default is \code{0}.}
}
\value{
Depending on the value of \code{type_response}:
\itemize{
\item If \code{type_response = 0}: A data frame with two columns, \code{group} and \code{p_value}, showing the p-values for each group.
\item If \code{type_response = 1}: A logical value. Returns \code{TRUE} if all groups follow a normal distribution, and \code{FALSE} otherwise.
}
}
\description{
Determines and applies the appropriate normality test for each group in a dataset.
}
\details{
This function assesses the normality of a numeric variable within groups defined by a categorical variable.
It automatically selects the appropriate normality test based on the number of observations in each group.
If any group has more than 5000 observations, the Kolmogorov-Smirnov test is applied; otherwise, the Shapiro-Wilk test is used.
}
\examples{
# Example of using the group_normality_test function
data <- data.frame(response = rnorm(200, mean = 30, sd = 40),
                   group = sample(c("A", "B"), size = 200, replace = TRUE, prob = c(0.6, 0.4)))
group_normality_test(data, 'response', 'group', type_response = 0)
# Returns a data frame with p-values for each group

# Example of using the function with logical output
group_normality_test(data, 'response', 'group', type_response = 1)
# Returns TRUE if all groups follow a normal distribution, FALSE otherwise
}
