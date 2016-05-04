library(dplyr)
library(stringr)
library(rvest)
library(tidyr)
#Because Zillow has 20 pages limits (won't provide new information even we change the page in the url address),
#we cannot simply loop the pages by change url address. Instead, we decide to seperate the properties in NY by their 
#zipcode, then loop the combination of zipcode and pages for each zipcode.

url_base <- "http://www.zillow.com/homes/for_sale/New-York-NY-"
#Manhattan zipcode from 10001 to 10014
urls <- paste0(url_base, rep(10001:10014,each=20),"/",1:20,"_p/0_mmm/1_rs/")

#get the address information from a specific url, and convert it to text, then as a dataframe
findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
#loop through all combination of zipcodes and pages
zip1 <-bind_rows(lapply(urls, findadd))
#seperate address and zip code information 
add1 <- zip1 %>% filter(grepl("NY",add)) %>% separate(add, c("address", "zip"), "NY") %>% mutate(state="NY") %>% unite(add, c(address,state), sep="")

#basically doing the same things as above, but for different zip codes
#zip from 10016 to 10027
urls <- paste0(url_base, rep(10016:10027,each=20),"/",1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip2 <-bind_rows(lapply(urls, findadd))
add2 <- zip2 %>% filter(grepl("NY",add)) %>% separate(add, c("address", "zip"), "NY") %>% mutate(state="NY") %>% unite(add, c(address,state), sep="")

#zip from 10028 to 10039
urls <- paste0(url_base, rep(10028:10039,each=20),"/",1:20,"_p/0_mmm/1_rs/")

findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip3 <-bind_rows(lapply(urls, findadd))
add3 <- zip3 %>% filter(grepl("NY",add)) %>% separate(add, c("address", "zip"), "NY") %>% mutate(state="NY") %>% unite(add, c(address,state), sep="")

#zip others
zipother1 <- c(10040,10044,10048,10065,10069,10075,10111,10115,10128,10280,10281,10282)
urls <- paste0(url_base, rep(zipother1,each=20),"/",1:20,"_p/0_mmm/1_rs/")
findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip4 <-bind_rows(lapply(urls, findadd))
add4 <- zip4 %>% filter(grepl("NY",add)) %>% separate(add, c("address", "zip"), "NY") %>% mutate(state="NY") %>% unite(add, c(address,state), sep="")

#Brooklyn
url_base <- "http://www.zillow.com/homes/for_sale/Brooklyn-New-York-NY-"
urls <- paste0(url_base, rep(11201:11239,each=20),"/",1:20,"_p/0_mmm/1_rs/")
findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip5 <-bind_rows(lapply(urls, findadd))
add5 <- zip5 %>% filter(grepl("NY",add)) %>% separate(add, c("address", "zip"), "NY") %>% mutate(state="NY") %>% unite(add, c(address,state), sep="")
add5[1966,]$zip <- 11206
add5[1966,]$add <- "10 Montieth St, NY"

#Queens
url_base <- "http://www.zillow.com/homes/for_sale/Queens-New-York-NY-"
zipqueens <-c(11001,11004,11005,11040,11096,11101,11102,11103,11104,11105,11106,11109,11354,11355,11356,11357,11358,11359,11360,11361,11362,11363,11364,11365,11366,11367,11368,11369,11371,11372,11373,11374,11375,11377,11378,11379,11385,11411,11412,11413,11414,11415,11416,11417,11418,11419,11420,11421,
              11422,11423,11426,11427,11428,11429,11430,11432,11433,11434,11435,11436,11451,11691,11692,11694,11697)

urls <- paste0(url_base, rep(zipqueens,each=20),"/",1:20,"_p/0_mmm/1_rs/")
findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip6 <-bind_rows(lapply(urls, findadd))
add6 <- zip6 %>% filter(grepl("NY",add)) %>% separate(add, c("address", "zip"), "NY") %>% mutate(state="NY") %>% unite(add, c(address,state), sep="") %>% slice(-c(2848, 3020, 16721, 19556, 23040, 23264, 23265, 23266, 23267, 23705))

#Bronx
url_base <- "http://www.zillow.com/homes/for_sale/Bronx-New-York-NY-"
urls <- paste0(url_base, rep(10451:10475,each=20),"/",1:20,"_p/0_mmm/1_rs/")
findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip7 <-bind_rows(lapply(urls, findadd))
add7 <- zip7 %>% filter(grepl("NY",add)) %>% separate(add, c("address", "zip"), "NY") %>% mutate(state="NY") %>% unite(add, c(address,state), sep="")

#staten islands
url_base <- "http://www.zillow.com/homes/for_sale/Staten-Island-New-York-NY-"
urls <- paste0(url_base, rep(10301:10314,each=20),"/",1:20,"_p/0_mmm/1_rs/")
findadd <- function(url) {
  add <- read_html(url) %>%
    html_nodes(".routable") %>%
    html_text()
  data_frame(add)
}
zip8 <-bind_rows(lapply(urls, findadd))
add8 <- zip8 %>% filter(grepl("NY",add)) %>% separate(add, c("address", "zip"), "NY") %>% mutate(state="NY") %>% unite(add, c(address,state), sep="")

#combine all addresses found above
address <- rbind(add1,add2,add3,add4,add5,add6,add7,add8)
#We only want unique address
add <- address[!duplicated(address),]

#output as csv files
write.csv(address, file = "nyaddress.csv",row.names=FALSE)
write.csv(add, file = "uniquenyaddress.csv",row.names=FALSE)


