library(openxlsx)

my.file.name <- "tabs/Contratos futuros em aberto.xlsx"

contratos.dolar <- read.xlsx(my.file.name, sheet = 1, cols = 1:8, detectDates = TRUE, colNames = TRUE)
contratos.indice <- read.xlsx(my.file.name, sheet = 2, cols = 1:8, detectDates = TRUE, colNames = TRUE)
contratos.juros <- read.xlsx(my.file.name, sheet = 3, cols = 1:8, detectDates = TRUE, colNames = TRUE)

source('util/util-dates.R')

return.compare.dates <- my.fct.compare.dates(as.Date(contratos.dolar[nrow(contratos.dolar),][[1]]))

if(return.compare.dates) {
  source('contratos_abertos/import-and-clean-data.R')

  
  hoje <- my.fct.return.date()
  
  contratos.juros[nrow(contratos.juros) + 1,] = c(as.character(hoje),
                                                  txjuros.total,
                                                  txjuros.estrangeiro,
                                                  txjuros.ii,
                                                  txjuros.pjf,
                                                  txjuros.pjnf,
                                                  txjuros.pf, 
                                                  txjuros.estrangeiro - as.numeric(contratos.juros[nrow(contratos.juros),][3]))
  
  contratos.dolar[nrow(contratos.dolar) + 1,] = c(as.character(hoje),
                                                  dolfut.total,
                                                  dolfut.estrangeiro,
                                                  dolfut.ii,
                                                  dolfut.pjf,
                                                  dolfut.pjnf,
                                                  dolfut.pf, 
                                                  dolfut.estrangeiro - as.numeric(contratos.dolar[nrow(contratos.dolar),][3]))
  
  contratos.indice[nrow(contratos.indice) + 1,] = c(as.character(hoje),
                                                    indfut.total,
                                                    indfut.estrangeiro,
                                                    indfut.ii,
                                                    indfut.pjf,
                                                    indfut.pjnf,
                                                    indfut.pf, 
                                                    indfut.estrangeiro - as.numeric(contratos.indice[nrow(contratos.indice),][3]))
  
  wb <- loadWorkbook(my.file.name)
  
  writeData(wb, sheet = "Historico dolar", contratos.dolar , colNames = TRUE)
  writeData(wb, sheet = "Historico ibov", contratos.indice , colNames = TRUE)
  writeData(wb, sheet = "Historico juros", contratos.juros , colNames = TRUE)
  
  saveWorkbook(wb, my.file.name, overwrite = TRUE)
  
  cat("Dados gravados com sucesso")
  
}else{
  
  cat("Essa data já foi gravada")

}

