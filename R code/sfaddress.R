library(dplyr)
library(stringr)
library(rvest)
library(tidyr)
#Because Zillow has 20 pages limits (won't provide new information even we change the page in the url address),
#we cannot simply loop the pages by change url address. Instead, we decide to seperate the properties in SF by their 
#price range, so each filter will have approximately 20 pages results.

#The base url address for San Francisco
url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/0-200000_price/0-719_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
#change urls address for loop
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

#a function to get the address (including zipcode) information from each url
findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text() #convert javascript to text
  data_frame(add)
}

#loop through all urls specified before (20 pages), and combined result in row format
zip1 <-bind_rows(lapply(urls, findadd))

#seperate address and zip code
add1 <- zip1 %>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

#do the similar things for other price ranges (each about 20pages)
url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/200000-320000_price/719-1150_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip2 <-bind_rows(lapply(urls, findadd))
add2 <- zip2 %>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")


url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/320000-420000_price/1150-1509_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip3 <-bind_rows(lapply(urls, findadd))
add3 <- zip3 %>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/420000-495000_price/1509-1779_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip4 <-bind_rows(lapply(urls, findadd))
add4 <- zip4 %>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/495000-549000_price/1779-1973_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip5 <-bind_rows(lapply(urls, findadd))
add5 <- zip5 %>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/549000-590000_price/1973-2120_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip6 <-bind_rows(lapply(urls, findadd))
add6 <- zip6 %>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/590000-624000_price/2120-2242_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip7 <-bind_rows(lapply(urls, findadd))
add7 <- zip7 %>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")


url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/624000-649000_price/2242-2332_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip8 <-bind_rows(lapply(urls, findadd))
add8 <- zip8 %>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/629000-650000_price/2260-2336_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip9 <-bind_rows(lapply(urls, findadd))
add9 <- zip9 %>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/650000-670000_price/2336-2407_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip10 <-bind_rows(lapply(urls, findadd))
add10<- zip10 %>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/670000-699000_price/2407-2512_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip11 <-bind_rows(lapply(urls, findadd))
add11<- zip11 %>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/699000-719000_price/2512-2584_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip12 <-bind_rows(lapply(urls, findadd))
add12<- zip12%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/719000-740000_price/2584-2659_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip13 <-bind_rows(lapply(urls, findadd))
add13<- zip13%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/740000-759000_price/2659-2727_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip14 <-bind_rows(lapply(urls, findadd))
add14<- zip14%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/759000-785000_price/2727-2821_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip15 <-bind_rows(lapply(urls, findadd))
add15<- zip15%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/785000-808000_price/2821-2903_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip16 <-bind_rows(lapply(urls, findadd))
add16<- zip16%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/808000-830000_price/2903-2982_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip17 <-bind_rows(lapply(urls, findadd))
add17<- zip17%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/830000-850000_price/2982-3054_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip18 <-bind_rows(lapply(urls, findadd))
add18<- zip18%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/850000-870000_price/3054-3126_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip19 <-bind_rows(lapply(urls, findadd))
add19<- zip19%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/870000-898000_price/3126-3227_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip20 <-bind_rows(lapply(urls, findadd))
add20<- zip20%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/898000-918000_price/3227-3299_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip21 <-bind_rows(lapply(urls, findadd))
add21<- zip21%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/918000-949000_price/3299-3410_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip22 <-bind_rows(lapply(urls, findadd))
add22<- zip22%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/949000-970000_price/3410-3485_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip23 <-bind_rows(lapply(urls, findadd))
add23<- zip23%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/970000-999000_price/3485-3590_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip24 <-bind_rows(lapply(urls, findadd))
add24<- zip24%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/999001-1045000_price/3590-3755_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip25 <-bind_rows(lapply(urls, findadd))
add25<- zip25%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1045001-1085000_price/3755-3899_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip26 <-bind_rows(lapply(urls, findadd))
add26<- zip26%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1085001-1120000_price/3899-4024_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip27 <-bind_rows(lapply(urls, findadd))
add27<- zip27%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1120001-1160000_price/4024-4168_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip28 <-bind_rows(lapply(urls, findadd))
add28<- zip28%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1160001-1200000_price/4168-4312_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip29 <-bind_rows(lapply(urls, findadd))
add29<- zip29%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1200001-1250000_price/4312-4492_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip30 <-bind_rows(lapply(urls, findadd))
add30<- zip30%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1250001-1300000_price/4492-4671_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip31<-bind_rows(lapply(urls, findadd))
add31<- zip31%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")


url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1300001-1350000_price/4671-4851_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip32<-bind_rows(lapply(urls, findadd))
add32<- zip32%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1350001-1400000_price/4851-5031_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip33<-bind_rows(lapply(urls, findadd))
add33<- zip33%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1400001-1470000_price/5031-5282_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip34<-bind_rows(lapply(urls, findadd))
add34<- zip34%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1470001-1530000_price/5282-5498_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip35<-bind_rows(lapply(urls, findadd))
add35<- zip35%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1530001-1600000_price/5498-5749_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip36<-bind_rows(lapply(urls, findadd))
add36<- zip36%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1600001-1690000_price/5749-6073_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip37<-bind_rows(lapply(urls, findadd))
add37<- zip37%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1690001-1790000_price/6073-6432_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip38<-bind_rows(lapply(urls, findadd))
add38<- zip38%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1790001-1900000_price/6432-6827_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip39<-bind_rows(lapply(urls, findadd))
add39<- zip39%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/1900001-2090000_price/6827-7510_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip40<-bind_rows(lapply(urls, findadd))
add40<- zip40%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/2090001-2300000_price/7510-8264_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip41<-bind_rows(lapply(urls, findadd))
add41<- zip41%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/2300001-2600000_price/8264-9342_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip42<-bind_rows(lapply(urls, findadd))
add42<- zip42%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")


url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/2600001-3100001_price/9342-11139_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip43<-bind_rows(lapply(urls, findadd))
add43<- zip43%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")


url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/3100001-4200001_price/11139-15092_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip44<-bind_rows(lapply(urls, findadd))
add44<- zip44%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

url_base <- "http://www.zillow.com/homes/for_sale/San-Francisco-CA/20330_rid/4200001-_price/15092-_mp/any_days/37.97695,-122.148743,37.659091,-122.742692_rect/10_zm/"
urls <- paste0(url_base,1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip45<-bind_rows(lapply(urls, findadd))
add45<- zip45%>% filter(grepl("CA",add)) %>% separate(add, c("address", "zip"), "CA") %>% mutate(state="CA") %>% unite(add, c(address,state), sep="")

#combined all address got before
address <- rbind(add1,add2,add3,add4,add5,add6,add7,add8,add9,add10,add11,add12,add13,add14,add15,add16,add17,add18,add19,
                 add20,add21,add22,add23,add24,add25,add26,add27,add28,add29,
                 add30,add31,add32,add33,add34,add35,add36,add37,add38,add39,
                 add40,add41,add42,add43,add44,add45)
#get only the unique address
add <- address[!duplicated(address),]
#output as a csv file
write.csv(address, file = "uniquesfaddress.csv",row.names=FALSE)


