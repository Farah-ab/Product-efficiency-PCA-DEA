
#Interpretation  
#Peers Analysis    
peers <- data.frame(peers(deam4results))
lambda <- data.frame(lambda(deam4results))
lambda.matrix <- as.matrix(lambda(deam4results))

peers
lambda

#Ranking of DMUs Based on peers weight    
rankedDMUs <- rank(-lambda, ties.method = "min")
rankedDMUs <- data.frame(DMU = rownames(lambda), Rank = rankedDMUs)
rankedDMUs <- rankedDMUs[order(rankedDMUs$Rank), ]
rankedDMUs

#Ranking of DMUs Based on efficiency scores    

m4results <- m4results[order(-m4results$Efficiency), ]
m4results$Rank <- seq_len(nrow(m4results))

subset <- data.frame(Rank = m4results$Rank)
row.names(subset) <- row.names(m4results)

subset

#Excess Analysis    
excess <- data.frame(excess(deam4results,x,y))
mean <- colMeans(excess)
excess <- rbind(excess, mean)

excess