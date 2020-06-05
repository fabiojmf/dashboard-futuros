library(xml2)
library(rvest)
library(stringr)

URL <-
  'https://br.investing.com/currencies/usd-brl-bmf-futures-historical-data'

lista.tabela <-
  read_html(URL) %>% html_nodes("#curr_table") %>% html_table(fill = T)
df.valores <- lista.tabela[[1]]

df.valores$Máxima <-
  as.numeric(str_remove(df.valores$Máxima, "[,]"))
df.valores$Mínima <-
  as.numeric(str_remove(df.valores$Mínima, "[,]"))


media.cinco.dias <-
  round(mean((df.valores$Máxima[1:5] - df.valores$Mínima[1:5]) * 1000))
media.dez.dias <-
  round(mean((df.valores$Máxima[1:10] - df.valores$Mínima[1:10]) * 1000))
media.quinze.dias <-
  round(mean((df.valores$Máxima[1:15] - df.valores$Mínima[1:15]) * 1000))
media.vinte.dias <-
  round(mean((df.valores$Máxima[1:21] - df.valores$Mínima[1:21]) * 1000))
media.trinta.dias <-
  round(mean((df.valores$Máxima[1:nrow(df.valores)] - df.valores$Mínima[1:nrow(df.valores)]) * 1000))
