# PCA-DEA Application  
#Model 1: Basic DEA Model   

data <- read_excel("/Users/farahaboucha/Desktop/Graduation Project/Normalized Dataset.xlsx")
x <- data.matrix(data[, colnames(data) %in% c("Counted Rejections", "Average Shipping Cost", "Items with Complaint", "Average product cost")])
y <- data.matrix(data[, colnames(data) %in% c("Average Order Count", "Average gross profit", "Monthly NPS")])

deam1results <- dea(x, y, RTS = "vrs")
efficiencies <- efficiencies(deam1results)
status <- ifelse(efficiencies == 1, "Efficient", "Inefficient")
m1results <- data.frame(Efficiency = efficiencies, Status = status, row.names = row.names(x))

subset <- subset(data, select = c("Product ID", colnames(x), colnames(y)))
m1data <- merge(subset, m1results, all = TRUE, sort = FALSE)
head(m1data)

m1results

# DEA frontier of Model1 
dea.plot.frontier(x,y,RTS = "vrs" , txt=TRUE)

# Efficient DMUs of Model1
m1efficientDMUs <- subset(m1results, Status == "Efficient")
m1efficientDMUs

# Distribution of efficiency scores of Model1 
par(mar = c(2, 2, 2, 2) + 0.1)
hist(efficiencies, breaks = 10, col = "lightblue", main = "The distribution of efficiency scores for Model 1", xlab = "Efficiency")

#Model 2: Input dimension reduction
data <- read_excel("/Users/farahaboucha/Desktop/Graduation Project/PCA-DEA Normalized Dataset.xlsx")
x <- data.matrix(data[, colnames(data) %in% c("Input PC1", "Input PC2")])
y <- data.matrix(data[, colnames(data) %in% c("Average Order Count", "Average gross profit", "Monthly NPS")])

deam2results <- dea(x, y, RTS = "vrs")

m2efficiencies <- efficiencies(deam2results)
status <- ifelse(efficiencies == 1, "Efficient", "Inefficient")
m2results <- data.frame(Efficiency = efficiencies, Status = status, row.names = row.names(x))
subset <- subset(data, select = c("Product ID", colnames(x), colnames(y)))
m2data <- merge(subset, m2results, all = TRUE, sort = FALSE)

head(m2data)
m2results

#DEA frontier of Model2
dea.plot.frontier(x,y,RTS = "vrs" , txt=TRUE)

#Efficient DMUs of Model2 
m2efficientDMUs <- subset(m2results, Status == "Efficient")
m2efficientDMUs

# Distribution of efficiency scores of Model2    
par(mar = c(2, 2, 2, 2) + 0.1)
hist(m2efficiencies, breaks = 10, col = "lightblue", main = "The distribution of efficiency scores for Model 2", xlab = "Efficiency")

# Model 3: Output dimension reduction 
data <- read_excel("/Users/farahaboucha/Desktop/Graduation Project/PCA-DEA Normalized Dataset.xlsx")
x <- data.matrix(data[, colnames(data) %in% c("Counted Rejections", "Average Shipping Cost", "Items with Complaint", "Average product cost")])
y <- data.matrix(data[, colnames(data) %in% c("Output PC1" ,	"Output PC2" )])

deam3results <- dea(x, y, RTS = "vrs")
m3efficiencies <- efficiencies(deam3results)

status <- ifelse(efficiencies == 1, "Efficient", "Inefficient")
m3results <- data.frame(Efficiency = efficiencies, Status = status, row.names = row.names(x))
subset <- subset(data, select = c("Product ID", colnames(x), colnames(y)))
m3data <- merge(subset, m3results, all = TRUE, sort = FALSE)

m3results
head(m3data)


#DEA frontier of Model3    
dea.plot.frontier(x,y,RTS = "vrs" , txt=TRUE)

#Efficient DMUs of Model3    

m3efficientDMUs <- subset(m3results, Status == "Efficient")
m3efficientDMUs

#Distribution of efficiency scores of Model3    
par(mar = c(2, 2, 2, 2) + 0.1)
hist(m3efficiencies, breaks = 10, col = "lightblue", main = "The distribution of efficiency scores for Model 3", xlab = "Efficiency")

#Model 4: Joint Input-Output dimension reduction   
data <- read_excel("/Users/farahaboucha/Desktop/Graduation Project/PCA-DEA Normalized Dataset.xlsx")
x <- data.matrix(data[, colnames(data) %in% c("Input PC1", "Input PC2" )])
y <- data.matrix(data[, colnames(data) %in% c("Output PC1" ,	"Output PC2" )])

deam4results <- dea(x, y, RTS = "vrs")

efficiencies <- efficiencies(deam4results)
status <- ifelse(efficiencies == 1, "Efficient", "Inefficient")
m4results <- data.frame(Efficiency = efficiencies, Status = status, row.names = row.names(x))
subset <- subset(data, select = c("Product ID", colnames(x), colnames(y)))

m4data <- merge(subset, m4results, all = TRUE, sort = FALSE)
head(m4data)
m4results

#DEA frontier of Model4    
dea.plot.frontier(x,y,RTS = "vrs" , txt=TRUE)


#Efficient DMUs of Model4    
m4efficientDMUs <- subset(m4results, Status == "Efficient")
m4efficientDMUs

# Distribution of efficiency scores of Model4    
par(mar = c(2, 2, 2, 2) + 0.1)
hist(efficiencies, breaks = 10, col = "lightblue", main = "The distribution of efficiency scores for Model 4", xlab = "Efficiency")
