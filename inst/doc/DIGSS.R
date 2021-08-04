## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include=FALSE-----------------------------------------------------
library(DIGSS)

## ----creating_parameters------------------------------------------------------
#create list
my_parameters<-list(col.width = 50,
                    grid.type = "hexagonal",
                    simulations = 10,
                    area = c(0.5,0.5),
                    site.density = 20,
                    site.area = 10000,
                    overlap = 0.5,
                    obj.density = 1,
                    obj.distribution = "spherical",
                    survey.radius = 0.5)

#change class to `SurveySim`
class(my_parameters)<-"surveySim"

## ----editing_parameters-------------------------------------------------------
#load parametersExample into new list 
my_parameters<-parametersExample

#change density of sites
my_parameters$site.density <- 15

#change number of simulations to run faster examples:
my_parameters$simulations <- 8

#print all parameters in new list
print(my_parameters)

## ----fixed_simulations, include=FALSE-----------------------------------------
#run simulations based on the example list created before
my_sim<-surveySim(my_parameters, plot.artifacts = TRUE)


## ----print_results------------------------------------------------------------
knitr::kable(round(my_sim$Summary,2),caption = "Summary of results for the DIGSS simulations.")

## ----results_by_site----------------------------------------------------------
knitr::kable(round(my_sim$BySite,2), caption= "Results of survey efficiency in detecting sites.")
knitr::kable(round(my_sim$ByArtifact,2),caption= "Results of survey efficiency in detecting sites based on artifacts found in surveys")

## ----loop_example, include=FALSE----------------------------------------------
#run the example presented above
width_loop<-surveyLoops(my_parameters, "col.width",c(50,75,100,125),"sitesFound")

## ----loop_sites_found---------------------------------------------------------
#number of survey pits in each simulation loop
knitr::kable(round(width_loop$surveysPerSim,2),caption="Number of survey pits in each simulation")

#frequency of sites found in each simulation loop
knitr::kable(round(width_loop$sitesFound,2),caption="Frequency of sites found in each simuation")

#frequency of sites found based on artifact in each simulation loop
knitr::kable(round(width_loop$sitesFoundOnArtifacts,2),caption="Frequency of sites found based on presence of artifacts in each simuation")

#average number of artifacts per survey pit
knitr::kable(round(width_loop$artifactsPerSurvey,2),caption="Average number of artifacts per survey pit for each simulation")

#success rate index
knitr::kable(round(width_loop$successRateIndex,2),caption="Success rate index for each simulation")


