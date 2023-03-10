download_and_extract <- function(what, date) {
    stopifnot(what %in% c("assemblea_costituente", 
                          "camera",
                          "senato",
                          "europee",
                          "referendum",
                          "regionali",
                          "provinciali",
                          "comunali"))
    if (!dir.exists(paste0("data/", what))) {
        dir.create(paste0("data/", what))
    }
    base_url <- "https://elezioni.interno.gov.it/daithome/documenti/opendata/"
    user_agent <- "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:107.0) Gecko/20100101 Firefox/107.0"
    for (d in date) {
        download.file(paste0(base_url, what, "/", what, "-", d, ".zip"), 
                      destfile = paste0("data/", what, "/", what, "-", d, ".zip"),
                      headers = c("User-Agent" = user_agent))
        unzip(paste0("data/", what, "/", what, "-", d, ".zip"), exdir = paste0("data/", what))
        file.remove(paste0("data/", what, "/", what, "-", d, ".zip"))
    }
}

if (!dir.exists("data")) {
    dir.create("data")
}

# ASSEMBLEA COSTITUENTE 
download_and_extract("assemblea_costituente", "19460602")

# CAMERA e SENATO
date_parl <- c("20180304",
               "20130224",
               "20080413",
               "20060409",
               "20010513",
               "19960421",
               "19940327",
               "19920405",
               "19870614",
               "19830626",
               "19790603",
               "19760620",
               "19720507",
               "19680519",
               "19630428",
               "19580525",
               "19530607",
               "19480418")

download_and_extract("camera", date_parl)
download_and_extract("senato", date_parl)

# EUROPEE
date_eu <- c("20190526",
             "20140525",
             "20090607",
             "20040612",
             "19990613",
             "19940612",
             "19890618",
             "19840617",
             "19790610")

download_and_extract("europee", date_eu)

# REFERENDUM
date_ref <- c("20220612",
              "20200920",
              "20160417",
              "20161204",
              "20110612",
              "20090621",
              "20060625",
              "20050612",
              "20030615",
              "20011007",
              "20000521",
              "19990418",
              "19970615",
              "19950611",
              "19930418",
              "19910609",
              "19900603",
              "19890618",
              "19871108",
              "19850609",
              "19810517",
              "19780611",
              "19740512",
              "19460602")

download_and_extract("referendum", date_ref)

# REGIONALI
date_reg <- c("20211003",
              "20200126",
              "20200920",
              "20190210",
              "20190324",
              "20190526",
              "20191027",
              "20180304",
              "20150531",
              "20141123",
              "20140525",
              "20131117",
              "20130224",
              "20100328",
              "20081214",
              "20061105",
              "20050417",
              "20050403",
              "20011111",
              "20000416",
              "19950423",
              "19900506",
              "19850512",
              "19800608",
              "19750615",
              "19700607")
download_and_extract("regionali", date_reg)

# PROVINCIALI
date_prov <- c("20110515",
               "20100328",
               "20100530",
               "20090607",
               "20080413",
               "20070527",
               "20060528",
               "20050508",
               "20050403")
download_and_extract("provinciali", date_prov)

# COMUNALI
date_com <- c("20220612",
              "20211003",
              "20211010",
              "20211107",
              "20200920",
              "20201025",
              "20190526",
              "20190616",
              "20190623",
              "20190707",
              "20190714",
              "20191110",
              "20180610",
              "20180729",
              "20181021",
              "20170611",
              "20161113",
              "20160605",
              "20151115",
              "20150531",
              "20140525",
              "20141026",
              "20130526",
              "20131117",
              "20120506",
              "20120610",
              "20120617",
              "20120624",
              "20121028",
              "20111127",
              "20110522",
              "20110515",
              "20101128",
              "20100530",
              "20100418",
              "20100411",
              "20100328",
              "20091129",
              "20090607",
              "20080615",
              "20080608",
              "20080427",
              "20080413",
              "20070715",
              "20070617",
              "20070610",
              "20070527",
              "20061001",
              "20060716",
              "20060709",
              "20060618",
              "20060611",
              "20060604",
              "20060528",
              "20051127",
              "20050508",
              "20050417",
              "20050403",
              "20040626",
              "20040612",
              "20030622",
              "20030608",
              "20030525",
              "20020526",
              "20010513",
              "20001112",
              "20000604",
              "20000430",
              "20000416",
              "19990613",
              "19981129",
              "19980524",
              "19971130",
              "19971116",
              "19970427",
              "19961201",
              "19961117",
              "19960609",
              "19960602",
              "19951119",
              "19950528",
              "19950423",
              "19941120",
              "19940612",
              "19931121",
              "19930606",
              "19921213",
              "19920927",
              "19920926",
              "19920705",
              "19920627",
              "19920607",
              "19911215",
              "19911212",
              "19911124",
              "19910929",
              "19910922",
              "19910728",
              "19910714",
              "19910707",
              "19910630",
              "19910623",
              "19910616",
              "19910609",
              "19910602",
              "19910519",
              "19910512",
              "19910421",
              "19910407",
              "19910331",
              "19910324",
              "19910317",
              "19910310",
              "19910224",
              "19910120",
              "19910113",
              "19891210",
              "19891203",
              "19891126",
              "19891112",
              "19891105",
              "19891029",
              "19891022",
              "19891015",
              "19891008",
              "19890924",
              "19890917",
              "19890903",
              "19890730",
              "19890723",
              "19890716",
              "19890709",
              "19890706",
              "19890702",
              "19890611",
              "19890528",
              "19890507",
              "19890423",
              "19890409",
              "19890319",
              "19890312",
              "19890305",
              "19890129",
              "19890122",
              "19890115",
              "19890108")
download_and_extract("comunali", date_com)
