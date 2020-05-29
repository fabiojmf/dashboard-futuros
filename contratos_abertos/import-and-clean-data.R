tables <- XML::readHTMLTable('http://www2.bmf.com.br/pages/portal/bmfbovespa/lumis/lum-tipo-de-participante-ptBR.asp' , encoding = "UTF-8")

# - MERCADO FUTURO DE TAXA DE JURO --------

txjuros.pjf.var1 <- tables$`MERCADO FUTURO DE TAXA DE JURO                    `[1:1,]$V2
txjuros.pjf.var2 <- tables$`MERCADO FUTURO DE TAXA DE JURO                    `[1:1,]$V4
txjuros.pjf.var1 <- str_replace_all(txjuros.pjf.var1,"[.]","")
txjuros.pjf.var2 <- str_replace_all(txjuros.pjf.var2,"[.]","")
txjuros.pjf <- as.numeric(txjuros.pjf.var1) - as.numeric(txjuros.pjf.var2)

remove(txjuros.pjf.var1,txjuros.pjf.var2)

txjuros.ii.var1 <- tables$`MERCADO FUTURO DE TAXA DE JURO                    `[5:5,]$V2
txjuros.ii.var2 <- tables$`MERCADO FUTURO DE TAXA DE JURO                    `[5:5,]$V4
txjuros.ii.var1 <- str_replace_all(txjuros.ii.var1,"[.]","")
txjuros.ii.var2 <- str_replace_all(txjuros.ii.var2,"[.]","")
txjuros.ii <- as.numeric(txjuros.ii.var1) - as.numeric(txjuros.ii.var2)

remove(txjuros.ii.var1, txjuros.ii.var2)

txjuros.estrangeiro.var1 <- tables$`MERCADO FUTURO DE TAXA DE JURO                    `[7:7,]$V2
txjuros.estrangeiro.var2 <- tables$`MERCADO FUTURO DE TAXA DE JURO                    `[7:7,]$V4
txjuros.estrangeiro.var1 <- str_replace_all(txjuros.estrangeiro.var1,"[.]","")
txjuros.estrangeiro.var2 <- str_replace_all(txjuros.estrangeiro.var2,"[.]","")
txjuros.estrangeiro <- as.numeric(txjuros.estrangeiro.var1) - as.numeric(txjuros.estrangeiro.var2)

remove(txjuros.estrangeiro.var1, txjuros.estrangeiro.var2)

txjuros.pjnf.var1 <- tables$`MERCADO FUTURO DE TAXA DE JURO                    `[9:9,]$V2
txjuros.pjnf.var2 <- tables$`MERCADO FUTURO DE TAXA DE JURO                    `[9:9,]$V4
txjuros.pjnf.var1 <- str_replace_all(txjuros.pjnf.var1,"[.]","")
txjuros.pjnf.var2 <- str_replace_all(txjuros.pjnf.var2,"[.]","")
txjuros.pjnf <- as.numeric(txjuros.pjnf.var1) - as.numeric(txjuros.pjnf.var2)

remove(txjuros.pjnf.var1, txjuros.pjnf.var2)

txjuros.pf.var1 <- tables$`MERCADO FUTURO DE TAXA DE JURO                    `[10:10,]$V2
txjuros.pf.var2 <- tables$`MERCADO FUTURO DE TAXA DE JURO                    `[10:10,]$V4
txjuros.pf.var1 <- str_replace_all(txjuros.pf.var1,"[.]","")
txjuros.pf.var2 <- str_replace_all(txjuros.pf.var2,"[.]","")
txjuros.pf <- as.numeric(txjuros.pf.var1) - as.numeric(txjuros.pf.var2)

remove(txjuros.pf.var1, txjuros.pf.var2)

txjuros.total.var1 <- tables$`MERCADO FUTURO DE TAXA DE JURO                    `[11:11,]$V2
txjuros.total.var1 <- str_replace_all(txjuros.total.var1,"[.]","")
txjuros.total <- as.numeric(txjuros.total.var1)

remove(txjuros.total.var1)

# MERCADO FUTURO DE DOLAR --------
dolfut.pjf.var1 <- tables$`MERCADO FUTURO DE DÓLAR                           `[1:1,]$V2
dolfut.pjf.var2 <- tables$`MERCADO FUTURO DE DÓLAR                           `[1:1,]$V4
dolfut.pjf.var1 <- str_replace_all(dolfut.pjf.var1,"[.]","")
dolfut.pjf.var2 <- str_replace_all(dolfut.pjf.var2,"[.]","")
dolfut.pjf <- as.numeric(dolfut.pjf.var1) - as.numeric(dolfut.pjf.var2)

remove(dolfut.pjf.var1, dolfut.pjf.var2)

dolfut.ii.var1 <- tables$`MERCADO FUTURO DE DÓLAR                           `[5:5,]$V2
dolfut.ii.var2 <- tables$`MERCADO FUTURO DE DÓLAR                           `[5:5,]$V4
dolfut.ii.var1 <- str_replace_all(dolfut.ii.var1,"[.]","")
dolfut.ii.var2 <- str_replace_all(dolfut.ii.var2,"[.]","")
dolfut.ii <- as.numeric(dolfut.ii.var1) - as.numeric(dolfut.ii.var2)

remove(dolfut.ii.var1, dolfut.ii.var2)

dolfut.estrangeiro.var1 <- tables$`MERCADO FUTURO DE DÓLAR                           `[7:7,]$V2
dolfut.estrangeiro.var2 <- tables$`MERCADO FUTURO DE DÓLAR                           `[7:7,]$V4
dolfut.estrangeiro.var1 <- str_replace_all(dolfut.estrangeiro.var1,"[.]","")
dolfut.estrangeiro.var2 <- str_replace_all(dolfut.estrangeiro.var2,"[.]","")
dolfut.estrangeiro <- as.numeric(dolfut.estrangeiro.var1) - as.numeric(dolfut.estrangeiro.var2)

remove(dolfut.estrangeiro.var1, dolfut.estrangeiro.var2)

dolfut.pjnf.var1 <- tables$`MERCADO FUTURO DE DÓLAR                           `[9:9,]$V2
dolfut.pjnf.var2 <- tables$`MERCADO FUTURO DE DÓLAR                           `[9:9,]$V4
dolfut.pjnf.var1 <- str_replace_all(dolfut.pjnf.var1,"[.]","")
dolfut.pjnf.var2 <- str_replace_all(dolfut.pjnf.var2,"[.]","")
dolfut.pjnf <- as.numeric(dolfut.pjnf.var1) - as.numeric(dolfut.pjnf.var2)

remove(dolfut.pjnf.var1, dolfut.pjnf.var2)

dolfut.pf.var1 <- tables$`MERCADO FUTURO DE DÓLAR                           `[10:10,]$V2
dolfut.pf.var2 <- tables$`MERCADO FUTURO DE DÓLAR                           `[10:10,]$V4
dolfut.pf.var1 <- str_replace_all(dolfut.pf.var1,"[.]","")
dolfut.pf.var2 <- str_replace_all(dolfut.pf.var2,"[.]","")
dolfut.pf <- as.numeric(dolfut.pf.var1) - as.numeric(dolfut.pf.var2)

remove(dolfut.pf.var1, dolfut.pf.var2)

dolfut.total.var1 <- tables$`MERCADO FUTURO DE DÓLAR                           `[11:11,]$V2
dolfut.total.var1 <- str_replace_all(dolfut.total.var1,"[.]","")
dolfut.total <- as.numeric(dolfut.total.var1)

remove(dolfut.total.var1)

# MERCADO FUTURO DE IBOVESPA --------

indfut.pjf.var1 <- tables$`MERCADO FUTURO DE IBOVESPA                        `[1:1,]$V2
indfut.pjf.var2 <- tables$`MERCADO FUTURO DE IBOVESPA                        `[1:1,]$V4
indfut.pjf.var1 <- str_replace_all(indfut.pjf.var1,"[.]","")
indfut.pjf.var2 <- str_replace_all(indfut.pjf.var2,"[.]","")
indfut.pjf <- as.numeric(indfut.pjf.var1) - as.numeric(indfut.pjf.var2)

remove(indfut.pjf.var1, indfut.pjf.var2)

indfut.ii.var1 <- tables$`MERCADO FUTURO DE IBOVESPA                        `[4:4,]$V2
indfut.ii.var2 <- tables$`MERCADO FUTURO DE IBOVESPA                        `[4:4,]$V4
indfut.ii.var1 <- str_replace_all(indfut.ii.var1,"[.]","")
indfut.ii.var2 <- str_replace_all(indfut.ii.var2,"[.]","")
indfut.ii <- as.numeric(indfut.ii.var1) - as.numeric(indfut.ii.var2)

remove(indfut.ii.var1, indfut.ii.var2)

indfut.estrangeiro.var1 <- tables$`MERCADO FUTURO DE IBOVESPA                        `[6:6,]$V2
indfut.estrangeiro.var2 <- tables$`MERCADO FUTURO DE IBOVESPA                        `[6:6,]$V4
indfut.estrangeiro.var1 <- str_replace_all(indfut.estrangeiro.var1,"[.]","")
indfut.estrangeiro.var2 <- str_replace_all(indfut.estrangeiro.var2,"[.]","")
indfut.estrangeiro <- as.numeric(indfut.estrangeiro.var1) - as.numeric(indfut.estrangeiro.var2)

remove(indfut.estrangeiro.var1, indfut.estrangeiro.var2)

indfut.pjnf.var1 <- tables$`MERCADO FUTURO DE IBOVESPA                        `[8:8,]$V2
indfut.pjnf.var2 <- tables$`MERCADO FUTURO DE IBOVESPA                        `[8:8,]$V4
indfut.pjnf.var1 <- str_replace_all(indfut.pjnf.var1,"[.]","")
indfut.pjnf.var2 <- str_replace_all(indfut.pjnf.var2,"[.]","")
indfut.pjnf <- as.numeric(indfut.pjnf.var1) - as.numeric(indfut.pjnf.var2)

remove(indfut.pjnf.var1, indfut.pjnf.var2)

indfut.pf.var1 <- tables$`MERCADO FUTURO DE IBOVESPA                        `[9:9,]$V2
indfut.pf.var2 <- tables$`MERCADO FUTURO DE IBOVESPA                        `[9:9,]$V4
indfut.pf.var1 <- str_replace_all(indfut.pf.var1,"[.]","")
indfut.pf.var2 <- str_replace_all(indfut.pf.var2,"[.]","")
indfut.pf <- as.numeric(indfut.pf.var1) - as.numeric(indfut.pf.var2)

remove(indfut.pf.var1, indfut.pf.var2)

indfut.total.var1 <- tables$`MERCADO FUTURO DE IBOVESPA                        `[10:10,]$V2
indfut.total.var1 <- str_replace_all(indfut.total.var1,"[.]","")
indfut.total <- as.numeric(indfut.total.var1)

remove(indfut.total.var1)