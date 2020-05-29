URL = 'http://www2.bmf.com.br/pages/portal/bmfbovespa/lumis/lum-ajustes-do-pregao-ptBR.asp'

lista.tabela <- read_html(URL) %>% html_nodes("table") %>% html_table(fill = T)
df.ajustes <- lista.tabela[[1]]

contrato.dol.cheio <- df.ajustes[which(df.ajustes$Mercadoria == 'DOL   - Dólar comercial'), 2]
aux.danado <- str_remove_all(df.ajustes[which(df.ajustes$Mercadoria == 'DOL   - Dólar comercial'), 3], "[,]")
ajuste.ant.dol.cheio <- format(as.numeric(aux.danado), digits=6, decimal.mark=".", big.mark=",", small.mark=",", small.interval=3)
aux.danado <- str_remove_all(df.ajustes[which(df.ajustes$Mercadoria == 'DOL   - Dólar comercial'), 4], "[,]")
ajuste.atual.dol.cheio <- format(as.numeric(aux.danado), digits=6, decimal.mark=".", big.mark=",", small.mark=",", small.interval=3)

contrato.ind.cheio <- df.ajustes[which(df.ajustes$Mercadoria == 'IND   - Ibovespa'), 2]
aux.danado <- str_remove_all(df.ajustes[which(df.ajustes$Mercadoria == 'IND   - Ibovespa'), 3], "[,]")
ajuste.ant.ind.cheio <- format(as.numeric(aux.danado), digits=6, decimal.mark=".", big.mark=",", small.mark=",", small.interval=3)
aux.danado <- str_remove_all(df.ajustes[which(df.ajustes$Mercadoria == 'IND   - Ibovespa'), 4], "[,]")
ajuste.atual.ind.cheio <- format(as.numeric(aux.danado), digits=6, decimal.mark=".", big.mark=",", small.mark=",", small.interval=3)

# contrato.dol.mini <- df.ajustes[which(df.ajustes$Mercadoria == 'WDO   - Dólar Mini - WDO'), 2]
# aux.danado <- str_remove_all(df.ajustes[which(df.ajustes$Mercadoria == 'DOL   - Dólar comercial'), 3], "[,]")
# ajuste.ant.dol.mini <- format(as.numeric(aux.danado), digits=6, decimal.mark=".", big.mark=",", small.mark=",", small.interval=3)
# aux.danado <- str_remove_all(df.ajustes[which(df.ajustes$Mercadoria == 'DOL   - Dólar comercial'), 4], "[,]")
# ajuste.atual.dol.mini <- format(as.numeric(aux.danado), digits=6, decimal.mark=".", big.mark=",", small.mark=",", small.interval=3)
# 
# contrato.ind.mini <- df.ajustes[which(df.ajustes$Mercadoria == 'WIN   - Ibovespa Mini'), 2]
# aux.danado <- str_remove_all(df.ajustes[which(df.ajustes$Mercadoria == 'DOL   - Dólar comercial'), 3], "[,]")
# ajuste.ant.ind.mini <- format(as.numeric(aux.danado), digits=6, decimal.mark=".", big.mark=",", small.mark=",", small.interval=3)
# aux.danado <- str_remove_all(df.ajustes[which(df.ajustes$Mercadoria == 'DOL   - Dólar comercial'), 4], "[,]")
# ajuste.atual.ind.mini <- format(as.numeric(aux.danado), digits=6, decimal.mark=".", big.mark=",", small.mark=",", small.interval=3)


