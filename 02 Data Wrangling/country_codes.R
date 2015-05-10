codes <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select country, country_code from population"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_agc846', PASS='orcl_agc846', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

head(codes)