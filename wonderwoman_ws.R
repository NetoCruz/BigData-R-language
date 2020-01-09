install.packages("rvest")
library(rvest)
url<-"https://www.imdb.com/title/tt0451279/"
pagina_web<-read_html(url)
selector<-"#title-overview-widget > div.vital > div.title_block > div > div.ratings_wrapper > div.imdbRating > div.ratingValue > strong > span"
nodo<-html_node(pagina_web,selector)
nodo
nodo_texto<-html_text(nodo)
nodo_texto

selector_tabla<-"#titleCast > table"
nodo_table<-html_node(pagina_web,selector_tabla)
nodo_tabla_texto<-html_table(nodo_table)
nodo_tabla_texto
