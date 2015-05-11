categoricals <- eval(parse(text=substring(gsub(",)", ")", getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from HEALTH_EXPENDITURE"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_agc846', PASS='orcl_agc846', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'True'), verbose = TRUE)), 1, 2^31-1)))


i <- categoricals[[2]][[2]]
r <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select \\\""i"\\\" from HEALTH_EXPENDITURE where \\\""i"\\\" is not null "'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL',USER='C##cs329e_agc846',PASS='orcl_agc846',MODE='native_mode',MODEL='model',returnDimensions = 'False',returnFor = 'JSON', i=i),verbose = TRUE)))

p <- ggplot(r, aes(x=EXPENDITURE)) + geom_histogram(binwidth=500)
p + ggtitle("Distribution of Data Points based on Health Expenditure") + theme(plot.title=element_text(size=18, face='bold', vjust=2)) + labs(x="Health Expenditure", y="Count") + theme(axis.text.x=element_text(size=12, angle=0), axis.text.y=element_text(size=14))

png("../00 Doc/measures.png", width = 25, height = 20, units = "in", res = 72)
grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 1)))   

print(p, vp = viewport(layout.pos.row = 1, layout.pos.col = 1))

dev.off()