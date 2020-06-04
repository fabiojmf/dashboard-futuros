source('util/util-dates.R')

data.pesquisa.ptax <- get.dia.anterior()
URL <-
  str_glue(
    'https://ptax.bcb.gov.br/ptax_internet/consultaBoletim.do?method=consultarBoletim&RadOpcao=3&DATAINI=',
    data.pesquisa.ptax,
    "&DATAFIM=&ChkMoeda=61"
  )

lista.tabela <-
  read_html(URL) %>% html_nodes("table") %>% html_table(fill = T)
df.aberturas <- lista.tabela[[1]]

df.ptax.dolar <-
  data.frame("Valores" = c(
    as.numeric(sub(",", ".", df.aberturas[3, 4])),
    as.numeric(sub(",", ".", df.aberturas[4, 4])),
    as.numeric(sub(",", ".", df.aberturas[5, 4])),
    as.numeric(sub(",", ".", df.aberturas[6, 4]))
  ))

df.ptax.dolar[1, 2] = format((df.ptax.dolar[which.max(df.ptax.dolar$Valores), ] - df.ptax.dolar[which.min(df.ptax.dolar$Valores), ]) *
  1000, digits=4)
df.ptax.dolar[2, 2] = format(mean(df.ptax.dolar[1:4, 1]), digits=6, decimal.mark=".", big.mark=",", small.mark=",", small.interval=3)
