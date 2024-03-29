% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/make_hexbin_label.R
\name{make_hexbin_label}
\alias{make_hexbin_label}
\title{Group label plot position.}
\usage{
make_hexbin_label(sce, col)
}
\arguments{
\item{sce}{A \code{\link[SingleCellExperiment]{SingleCellExperiment}} object.}

\item{col}{The name referring to one column in meta data for which
the label position on the plot is calculated for every level. The chosen
column needs to be a factor.}
}
\value{
A dataframe.
}
\description{
Group label plot position.
}
\examples{
# For SingleCellExperiment object
library(TENxPBMCData)
library(scater)
tenx_pbmc3k <- TENxPBMCData(dataset = "pbmc3k")
rm_ind <- calculateAverage(tenx_pbmc3k) < 0.1
tenx_pbmc3k <- tenx_pbmc3k[!rm_ind, ]
tenx_pbmc3k <- logNormCounts(tenx_pbmc3k)
tenx_pbmc3k <- runPCA(tenx_pbmc3k)
tenx_pbmc3k <- make_hexbin(tenx_pbmc3k, 80, dimension_reduction = "PCA")
tenx_pbmc3k$random <- factor(sample(1:3, ncol(tenx_pbmc3k), replace = TRUE))
make_hexbin_label(tenx_pbmc3k, col = "random")
}
