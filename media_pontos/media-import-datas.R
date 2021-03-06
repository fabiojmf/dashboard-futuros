library(xml2)
library(rvest)
library(stringr)

URL <-
  'https://br.investing.com/currencies/usd-brl-bmf-futures-historical-data'

lista.tabela <-
  read_html(URL) %>% html_nodes("#curr_table") %>% html_table(fill = T)
df.valores <- lista.tabela[[1]]

df.valores$M�xima <-
  as.numeric(str_remove(df.valores$M�xima, "[,]"))
df.valores$M�nima <-
  as.numeric(str_remove(df.valores$M�nima, "[,]"))


media.cinco.dias <-
  round(mean((df.valores$M�xima[1:5] - df.valores$M�nima[1:5]) * 1000))
media.dez.dias <-
  round(mean((df.valores$M�xima[1:10] - df.valores$M�nima[1:10]) * 1000))
media.quinze.dias <-
  round(mean((df.valores$M�xima[1:15] - df.valores$M�nima[1:15]) * 1000))
media.vinte.dias <-
  round(mean((df.valores$M�xima[1:21] - df.valores$M�nima[1:21]) * 1000))
media.trinta.dias <-
  round(mean((df.valores$M�xima[1:nrow(df.valores)] - df.valores$M�nima[1:nrow(df.valores)]) * 1000))
