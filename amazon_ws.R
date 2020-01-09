library(rvest)
url<-"https://www.amazon.es/s?k=aspiradoras&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss_2"
selector<-"#search > div.s-desktop-width-max.s-desktop-content.sg-row > div.sg-col-20-of-24.sg-col-28-of-32.sg-col-16-of-20.sg-col.s-right-column.sg-col-32-of-36.sg-col-8-of-12.sg-col-12-of-16.sg-col-24-of-28 > div > span:nth-child(5) > div.s-result-list.s-search-results.sg-row > div:nth-child(1) > div > span > div > div > div > div > div:nth-child(2) > div.sg-col-4-of-12.sg-col-8-of-16.sg-col-16-of-24.sg-col-12-of-20.sg-col-24-of-32.sg-col.sg-col-28-of-36.sg-col-20-of-28 > div > div:nth-child(1) > div > div > div:nth-child(1) > h2 > a"
pagina<-read_html(url)
nodo<-html_node(pagina,selector)
nodo_texto<-html_text(nodo)
nodo_links<-html_attr(nodo,"href")
nodo_links

urlcompleta<-paste0("www.amazon.es",nodo_links)
urlcompleta

"https://www.amazon.es/s?k=aspiradoras&page=2&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&qid=1578521096&ref=sr_pg_2"
"https://www.amazon.es/s?k=aspiradoras&page=3&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&qid=1578521096&ref=sr_pg_3"

library(stringr)

pag<-"s?k=aspiradoras&page=2&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&qid=1578521096&ref=sr_pg_2"
lista_paginas<-c(1:10)
pag<-str_replace(pag, "page=2",paste0("page=",lista_paginas))
pag
pag<-str_replace(pag, "sr_pg_2",paste0("sr_pg_",lista_paginas))
pag


paginas<-paste0("https://www.amazon.es/",pag)
paginas

dameLinksPagina<-function(url){
  selector<-"div > div:nth-child(1) > div > div > div:nth-child(1) > h2 > a"
  pagina<-read_html(url)
  nodo<-html_nodes(pagina,selector)
  nodo_texto<-html_text(nodo)
  nodo_links<-html_attr(nodo,"href")
  nodo_links
}

test<-dameLinksPagina(paginas[3])
test

linksAsp<-sapply(paginas, dameLinksPagina)
linksAsp
vlink<-as.vector(linksAsp)
length(vlink)

vlinkAspiradora<-paste0("https://www.amazon.es/",vlink)
vlinkAspiradora

url<-"https://www.amazon.es//Einhell-TE-VC-1925-SA-seco-h%C3%BAmedo/dp/B00BLZVIYK/ref=sr_1_151?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&keywords=aspiradoras&qid=1578524088&sr=8-151"
selector<-"#productTitle"
pagina_web<-read_html(url)
nombre_nodo<-html_node(pagina_web,selector)
nombre_texto<-html_text(nombre_nodo)
nombre_texto

opiniones<-"#acrCustomerReviewText"
opiniones_nodo<-html_node(pagina_web,opiniones)
opiniones_texto<-html_text(opiniones_nodo)
opiniones_texto

precio<-"#priceblock_ourprice"
precio_nodo<-html_node(pagina_web,precio)
precio_texto<-html_text(precio_nodo)
precio_texto

tabla<-"#prodDetails > div > div.column.col1 > div:nth-child(1) > div.content.pdClearfix > div > div > table"
tabla_nodo<-html_node(pagina_web,tabla)
tabla_tab<-html_table(tabla_nodo)
tabla_tab
class(tabla_tab)
val<-tabla_tab$X2
val
res_tabla<-data.frame(t(val))
res_tabla                      
tabla_name<-tabla_tab$X1
tabla_name
colnames(res_tabla)<-tabla_name
res_tabla
str(res_tabla)

resultado_aspiradoras<-c(nombre_texto,precio_texto,opiniones_texto,as.character(res_tabla$`Peso del producto`),as.character(res_tabla$`Potencia eléctrica`),as.character(res_tabla$`Dimensiones del producto`),as.character(res_tabla$Volumen) )
resultado_aspiradoras

getArticulo<-function(url){
  print(url)
  selector<-"#productTitle"
  pagina_web<-read_html(url)
  nombre_nodo<-html_node(pagina_web,selector)
  nombre_texto<-html_text(nombre_nodo)
  nombre_texto
  
  opiniones<-"#acrCustomerReviewText"
  opiniones_nodo<-html_node(pagina_web,opiniones)
  opiniones_texto<-html_text(opiniones_nodo)
  opiniones_texto
  
  precio<-"#priceblock_ourprice"
  precio_nodo<-html_node(pagina_web,precio)
  precio_texto<-html_text(precio_nodo)
  precio_texto
  
  tabla<-"#prodDetails > div > div.column.col1 > div:nth-child(1) > div.content.pdClearfix > div > div > table"
  tabla_nodo<-html_node(pagina_web,tabla)
    if(!is.na(tabla_nodo)){
    tabla_tab<-html_table(tabla_nodo)
    tabla_tab
    class(tabla_tab)
    val<-tabla_tab$X2
    val
    res_tabla<-data.frame(t(val))
    res_tabla                      
    tabla_name<-tabla_tab$X1
    tabla_name
    colnames(res_tabla)<-tabla_name
    res_tabla
    }
  
  col<-c("Peso del producto","Dimensiones del producto", "Volumen","Potencia")
  if(length(res_tabla)==0){
    #no hay detalles
    mitab<-data.frame(colnames(col))
    mitab<-rbind(mitab,c("-1","-1","-1","-1"))
    colnames(mitab)<-col
    
  }else{
    #evaluar cada uno de los atributos
    zero<-matrix("-1",ncol=4,nrow=1)
    dfzero<-as.data.frame(zero)
    colnames(dfzero)<-col
    peso<-as.character(res_tabla$`Peso del producto`)
    if(length(peso)==0)peso<-"-1"
    dime<-as.character(res_tabla$`Dimensiones del producto`)
    if(length(dime)==0)dime<-"-1"
    potencia<-as.character(res_tabla$`Potencia eléctrica`)
    if(length(potencia)==0)potencia<-"-1"
    volumen<-as.character(res_tabla$Volumen)
    if(length(volumen)==0)volumen<-"-1"
    dfzero$`Peso del producto`<-peso
    dfzero$`Dimensiones del producto`<-dime
    dfzero$`Volumen`<-volumen
    dfzero$`Potencia`<-potencia
    mitab<<-dfzero
    colnames(mitab)<-col
  }
  
  articulo<-c(nombre_texto,precio_texto,opiniones_texto, as.character(mitab$`Peso del producto`[1]),as.character(mitab$`Dimensiones del producto`),as.character(mitab$`Volumen`),as.character(mitab$`Potencia`))
  articulo
}

res<-getArticulo(vlinkAspiradora[1])
res

resultado_datos<-sapply(vlinkAspiradora, getArticulo)
res<-t(resultado_datos)
#View(res)

mis_aspiradoras<-as.data.frame(res)
colnames(res)<-c("Nombre","Precio","Opiniones","Peso","Dimensiones","Volumen","Potencia")
rownames(res)<-c(1:200)
View(res)