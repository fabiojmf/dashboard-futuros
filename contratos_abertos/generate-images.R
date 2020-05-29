library(ggplot2)

mybreaks <- function(x) {
  x[seq_along(x) %% 2 == 1]  
}

my.format.negative <- function(num){
  ind <- grepl("-", num)
  num[ind] <-  paste0("(", sub("-", "", num[ind]), ")")
  num
}

# - GRAFICO DOLAR --------

contratos.dolar$DATA1 <- factor(format(contratos.dolar$DATA, "%d/%m"))
contratos.dolar$DATA1 <- forcats::fct_reorder(contratos.dolar$DATA1, contratos.dolar$DATA)

temp.graf.dol <- ggplot(tail(contratos.dolar,n = 30), aes(x = DATA1, y = as.numeric(IE), fill = IE > 0, text = paste('Data: ', DATA1,'<br>Saldo:', format(as.numeric(IE),digits=9, decimal.mark=",", big.mark=".",small.mark=".")))) +
  geom_bar(stat='identity') +
#  labs(title = "Dolar futuro - Contratos em aberto", subtitle = paste("Investidor Estrangeiro -",format.Date(hoje, "%d/%m/%Y"))) +
  xlab("") +
  ylab("") +
  #  scale_x_date(date_labels = "%d/%m", expand = c(0,0), limits = c(Sys.Date() - 40, NA), breaks = "2 day") +
  scale_y_continuous(labels = scales::comma, n.breaks = 7) +
  scale_x_discrete(breaks = mybreaks, expand = c(0,0)) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), plot.caption = element_text(size=8, face="bold.italic")) +
  guides(fill = FALSE)

# valor.var <- format(as.numeric(contratos.dolar[nrow(contratos.dolar),][[8]]), digits=9, decimal.mark=",", big.mark=".",small.mark=".")
# valor.saldo <- format(as.numeric(contratos.dolar[nrow(contratos.dolar),][[3]]), digits=9, decimal.mark=",", big.mark=".",small.mark=".")

# text.saldo.01 <- paste("Saldo:",ifelse(valor.saldo<0,yes = my.format.negative(valor.saldo),no = valor.saldo))
# text.saldo.01.p <- ggpubr::ggparagraph(text.saldo.01, face = "bold", size = 10, color = ifelse(valor.saldo<0,yes="red",no = "blue"))

# text.saldo.02 <- paste("Variação dia:",ifelse(valor.var<0,yes = my.format.negative(valor.var),no = valor.var))
# text.saldo.02.p <- ggpubr::ggparagraph(text.saldo.02, face = "bold", size = 10, color = ifelse(valor.var<0,yes="red",no = "blue"))

# temp.graf.dol <- ggpubr::ggarrange(temp.graf.dol, text.saldo.01.p, text.saldo.02.p, ncol = 1, nrow = 3, heights = c(2, 0.1, 0.1))


# my.fig.file.dol <- 'images/contsDol.png'

# ggsave(filename = my.fig.file.dol, plot = temp.graf.dol, width = 10, height = 10, units = "cm")

# - GRAFICO INDICE --------

contratos.indice$DATA1 <- factor(format(contratos.indice$DATA, "%d/%m"))
contratos.indice$DATA1 <- forcats::fct_reorder(contratos.indice$DATA1, contratos.indice$DATA)

temp.graf.ind <- ggplot(tail(contratos.indice,n = 30), aes(x = DATA1, y = as.numeric(IE), fill = IE > 0, text = paste('Data: ', DATA1,'<br>Saldo:', format(as.numeric(IE),digits=9, decimal.mark=",", big.mark=".",small.mark=".")))) +
  geom_bar(stat='identity') +
#  labs(title = "Indice futuro - Contratos em aberto", subtitle = paste("Investidor Estrangeiro -",format.Date(hoje, "%d/%m/%Y"))) +
  xlab("") +
  ylab("") +
  #  scale_x_date(date_labels = "%d/%m", expand = c(0,0), limits = c(Sys.Date() - 40, NA), breaks = "2 day") +
  scale_y_continuous(labels = scales::comma, n.breaks = 7) +
  scale_x_discrete(breaks = mybreaks, expand = c(0,0)) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), plot.caption = element_text(size=8, face="bold.italic")) +
  guides(fill = FALSE)

# valor.var <- format(as.numeric(contratos.indice[nrow(contratos.indice),][[8]]), digits=9, decimal.mark=",", big.mark=".",small.mark=".")
# valor.saldo <- format(as.numeric(contratos.indice[nrow(contratos.indice),][[3]]), digits=9, decimal.mark=",", big.mark=".",small.mark=".")
# 
# text.saldo.01 <- paste("Saldo:",ifelse(valor.saldo<0,yes = my.format.negative(valor.saldo),no = valor.saldo))
# text.saldo.01.p <- ggpubr::ggparagraph(text.saldo.01, face = "bold", size = 10, color = ifelse(valor.saldo<0,yes="red",no = "blue"))
# 
# text.saldo.02 <- paste("Variação dia:",ifelse(valor.var<0,yes = my.format.negative(valor.var),no = valor.var))
# text.saldo.02.p <- ggpubr::ggparagraph(text.saldo.02, face = "bold", size = 10, color = ifelse(valor.var<0,yes="red",no = "blue"))

# temp.graf.ind <- ggpubr::ggarrange(temp.graf.ind, text.saldo.01.p, text.saldo.02.p, ncol = 1, nrow = 3, heights = c(2, 0.1, 0.1))


# my.fig.file.dol <- 'images/contsInd.png'

# ggsave(filename = my.fig.file.dol, plot = temp.graf.ind, width = 10, height = 10, units = "cm")

