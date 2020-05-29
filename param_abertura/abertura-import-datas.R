library(xml2)
library(rvest)
library(stringr)

URL = 'http://www2.bmf.com.br/pages/portal/bmfbovespa/lumis/lum-parametros-de-abertura-ptBR.asp'

lista.tabela <- read_html(URL) %>% html_nodes("table") %>% html_table(fill = T)
df.aberturas <- lista.tabela[[1]]

param.abertura <- format(as.numeric(sub(",", ".", df.aberturas[nrow(df.aberturas),3])), digits=6, decimal.mark=".", big.mark=",", small.mark=",", small.interval=3)

