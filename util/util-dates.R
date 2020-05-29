my.all.page <-
  read_html(
    'http://www2.bmf.com.br/pages/portal/bmfbovespa/lumis/lum-tipo-de-participante-ptBR.asp'
  ) %>% html_nodes("form") %>% html_nodes("p") %>% html_text()
my.date.page <-
  as.Date(str_sub(my.all.page, start = 42, end = 51), format = '%d/%m/%Y')

my.fct.compare.dates <- function(param) {
  if (param == my.date.page) {
    return(FALSE)
  } else{
    return(TRUE)
  }
}

my.fct.return.date <- function() {
  return(my.date.page)
}

get.dia.anterior <- function() {
  library(bizdays)
  
  create.calendar(
    name = "ANBIMA",
    holidays = holidaysANBIMA,
    weekdays = c("saturday", "sunday")
  )
  
  dia.util.anterior <- Sys.Date() - 1
  
  if (is.bizday(dia.util.anterior, "ANBIMA")) {
    return (format(dia.util.anterior, "%d/%m/%Y"))
  } else{
    return (format(adjust.previous(dia.util.anterior, "ANBIMA"), "%d/%m/%Y"))
  }
}

get.dia.hoje <- function() {
  if (is.null(calendars()[["ANBIMA"]])) {
    create.calendar(
      name = "ANBIMA",
      holidays = holidaysANBIMA,
      weekdays = c("saturday", "sunday")
    )
  }
  dia.hoje <- Sys.Date()
  if (is.bizday(dia.hoje, "ANBIMA")) {
    return (format(dia.hoje, "%d/%m/%Y"))
  } else{
    return (format(adjust.previous(dia.hoje, "ANBIMA"), "%d/%m/%Y"))
  }
}