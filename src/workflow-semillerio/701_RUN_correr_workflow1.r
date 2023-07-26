# Corrida general del workflow Semillerio

options(error = function() {
  traceback(20)
  options(error = NULL)
  stop("exiting after script error")
})


# corrida de cada paso del workflow
source("~/labo2023r/src/workflow-semillerio/711_CA_reparar_dataset1.r")
source("~/labo2023r/src/workflow-semillerio/721_DR_corregir_drifting1.r")
source("~/labo2023r/src/workflow-semillerio/731_FE_historia1.r")
source("~/labo2023r/src/workflow-semillerio/741_TS_training_strategy1.r")
source("~/labo2023r/src/workflow-semillerio/751_HT_lightgbm1.r")
source("~/labo2023r/src/workflow-semillerio/771_ZZ_final_semillerio1.r")