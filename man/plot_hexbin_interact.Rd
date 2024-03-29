% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_hexbin_interact.R
\name{plot_hexbin_interact}
\alias{plot_hexbin_interact}
\title{Plot of interaction of expression of single cells in bivariate hexagon cells.}
\usage{
plot_hexbin_interact(
  sce,
  mod,
  type,
  feature,
  interact,
  title = NULL,
  xlab = NULL,
  ylab = NULL
)
}
\arguments{
\item{sce}{A \code{\link[SingleCellExperiment]{SingleCellExperiment}} object.}

\item{mod}{A vector of strings referring to the names of the modularities.
For \code{\link[SingleCellExperiment]{SingleCellExperiment}} use "RNA" to
access the RNA expression data stored as the main experiment type.}

\item{type}{A vector of strings referring to the types of assays in the
\code{\link[SingleCellExperiment]{SingleCellExperiment}} object.}

\item{feature}{A vector of strings referring to the names of one features in
the same order as the vector of modularities.}

\item{interact}{A string specifying how interaction between features is
calculated. Possible interaction measures are
\code{corr_spearman} and \code{mi} (see details).}

\item{title}{A string containing the title of the plot.}

\item{xlab}{A string containing the title of the x axis.}

\item{ylab}{A string containing the title of the y axis.}
}
\value{
A \code{\link{ggplot2}{ggplot}} object.
}
\description{
Plot of interaction of expression of single cells in bivariate hexagon cells.
}
\details{
This function plots the interaction between any features in the
   hexagon cell representation calculated with \code{\link{make_hexbin}}. The
   interaction between the chosen features is calculated by one of two
   measurers \code{corr_spearman}, \code{ratio} and \code{mi}:

   \describe{
      \item{\code{mi}}{Returns the mutual information coefficient.}
      \item{\code{corr_spearman}}{Returns the Spearman correlation.}
      \item{\code{fc}}{Return the log fold change between the features.}
   }

   Note that \code{fc} should be applied to log normalized values.
}
\examples{
# For SingleCellExperiment
library(TENxPBMCData)
library(scater)
tenx_pbmc3k <- TENxPBMCData(dataset = "pbmc3k")
rm_ind <- calculateAverage(tenx_pbmc3k) < 0.1
tenx_pbmc3k <- tenx_pbmc3k[!rm_ind, ]
colData(tenx_pbmc3k) <- cbind(colData(tenx_pbmc3k), perCellQCMetrics(tenx_pbmc3k))
tenx_pbmc3k <- logNormCounts(tenx_pbmc3k)
tenx_pbmc3k <- runPCA(tenx_pbmc3k)
tenx_pbmc3k <- make_hexbin(tenx_pbmc3k, 10, dimension_reduction = "PCA")
plot_hexbin_interact(tenx_pbmc3k,
    type = c("counts", "counts"), mod = c("RNA", "RNA"),
    feature = c("ENSG00000146109", "ENSG00000102265"), interact = "fc"
)
}
