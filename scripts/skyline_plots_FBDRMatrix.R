library(devtools)
install_github("revbayes/RevGadgets")
library(RevGadgets)

offset = 0

#prefix = "output/model1"

prefix = "output/model2"

rev_out <- rev.process.div.rates(speciation_times_file = paste0(prefix, "_speciation_times.log"),
                                 speciation_rates_file = paste0(prefix, "_speciation_rates.log"),
                                 extinction_times_file = paste0(prefix, "_extinction_times.log"),
                                 extinction_rates_file = paste0(prefix, "_extinction_rates.log"),
                                 fossilization_times_file = paste0(prefix, "_sampling_times.log"),
                                 fossilization_rates_file = paste0(prefix, "_sampling_rates.log"),
                                 maxAge = 100, burnin=0.1,numIntervals=100)

pdf("model2.pdf")
par(mfrow=c(3,1))
rev.plot.div.rates(rev_out,fig.types=c("speciation rate", "extinction rate", "fossilization rate"), # "net-diversification rate","relative-extinction rate"
                   offset = 0, use.geoscale = TRUE)
dev.off()


