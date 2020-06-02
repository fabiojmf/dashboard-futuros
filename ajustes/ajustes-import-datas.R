URL = 'http://www2.bmf.com.br/pages/portal/bmfbovespa/lumis/lum-ajustes-do-pregao-ptBR.asp'

contrato.corrente.dol <- 'N20'
contrato.corrente.ind <- 'M20'

lista.tabela <- read_html(URL) %>% html_nodes("table") %>% html_table(fill = T)
df.ajustes <- lista.tabela[[1]]

posicao.dolar <- which(df.ajustes$Mercadoria == 'DOL   - Dólar comercial')
selecao.linha.df <- df.ajustes %>% slice(posicao.dolar : (posicao.dolar+10))
selecao.linha.df <- selecao.linha.df[which(selecao.linha.df$Vencimento == contrato.corrente.dol),]

contrato.dol.cheio <- selecao.linha.df[,2]
aux.danado <- str_remove_all(selecao.linha.df[1, 3], "[,]")
ajuste.ant.dol.cheio <- format(as.numeric(aux.danado), digits=6, decimal.mark=".", big.mark=",", small.mark=",", small.interval=3)
aux.danado <- str_remove_all(selecao.linha.df[1, 4], "[,]")
ajuste.atual.dol.cheio <- format(as.numeric(aux.danado), digits=6, decimal.mark=".", big.mark=",", small.mark=",", small.interval=3)


posicao.ind <- which(df.ajustes$Mercadoria == 'IND   - Ibovespa')
selecao.linha.df <- df.ajustes %>% slice(posicao.ind : (posicao.ind+10))
selecao.linha.df <- selecao.linha.df[which(selecao.linha.df$Vencimento == contrato.corrente.ind),]

contrato.ind.cheio <- selecao.linha.df[,2]
aux.danado <- str_remove_all(selecao.linha.df[1, 3], "[,]")
ajuste.ant.ind.cheio <- format(as.numeric(aux.danado), digits=6, decimal.mark=".", big.mark=",", small.mark=",", small.interval=3)
aux.danado <- str_remove_all(selecao.linha.df[1, 4], "[,]")
ajuste.atual.ind.cheio <- format(as.numeric(aux.danado), digits=6, decimal.mark=".", big.mark=",", small.mark=",", small.interval=3)

remove(aux.danado, posicao.dolar, posicao.ind, selecao.linha.df)

