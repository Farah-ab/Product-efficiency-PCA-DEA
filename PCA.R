# PCA Application:

# Optimal Principal Components
# Input and Output Matrix of data creation: 

data <- read_excel("/Users/farahaboucha/Desktop/Graduation Project/Normalized Dataset.xlsx")

input.data.matrix <- matrix(nrow = nrow(data), ncol = 4)
colnames(input.data.matrix) <- c("Counted Rejections", "Average Shipping Cost", "Items with Complaint", "Average product cost")
rownames(input.data.matrix) <- paste(1:nrow(data), sep = "")

input.data.matrix[, "Counted Rejections"] <- data$`Counted Rejections`
input.data.matrix[, "Average Shipping Cost"] <- data$`Average Shipping Cost`
input.data.matrix[, "Items with Complaint"] <- data$`Items with Complaint`
input.data.matrix[, "Average product cost"] <- data$`Average product cost`

input.data.matrix <- apply(input.data.matrix, 2, as.numeric)


data <- read_excel("/Users/farahaboucha/Desktop/Graduation Project/Normalized Dataset.xlsx")

output.data.matrix <- matrix(nrow = nrow(data), ncol = 3)
colnames(output.data.matrix) <- c( "Average Order Count", "Average gross profit", "Monthly NPS")
rownames(output.data.matrix) <- paste(1:nrow(data), sep = "")

output.data.matrix[, "Average Order Count"] <- data$`Average Order Count`
output.data.matrix[, "Average gross profit"] <- data$`Average gross profit`
output.data.matrix[, "Monthly NPS"] <- data$`Average gross profit`

output.data.matrix <- apply(output.data.matrix, 2, as.numeric)
head(output.data.matrix)

# Summary of PCA application
pca.output <- prcomp(output.data.matrix, scale = TRUE)
summary(pca.output)

pca.input <- prcomp(input.data.matrix, scale = TRUE)
summary(pca.input)

# Scree Plot:

variance_prop <- pca.input$sdev^2 / sum(pca.input$sdev^2)
eigenvalues <- pca.input$sdev^2

barplot(variance_prop, xlab = "Principal Component", ylab = "Proportion of Variance Explained",
        main = "Input Scree Plot", col = "lightblue")
text(x = 1:length(eigenvalues), y = variance_prop, labels = round(eigenvalues, 2), pos = 3)

elbow_point <- 0
for (i in 2:length(eigenvalues)) {
  if (variance_prop[i] - variance_prop[i-1] < 0.05) {
    elbow_point <- i - 1
    break
  }
}
abline(v = elbow_point + 0.5, col = "red", lwd = 2, lty = 2)

variance_prop <- pca.output$sdev^2 / sum(pca.output$sdev^2)
eigenvalues <- pca.output$sdev^2

barplot(variance_prop, xlab = "Principal Component", ylab = "Proportion of Variance Explained",
        main = "Output Scree Plot", col = "lightblue")
text(x = 1:length(eigenvalues), y = variance_prop, labels = round(eigenvalues, 2), pos = 3)

elbow_point <- 0
for (i in 2:length(eigenvalues)) {
  if (variance_prop[i] - variance_prop[i-1] < 0.05) {
    elbow_point <- i - 1
    break
  }
}
abline(v = elbow_point + 0.5, col = "red", lwd = 2, lty = 2)


# PCA Visualization 
# The PCA graph of variables: </h5>

input.variables <- fviz_pca_var(pca.input,
                                col.var = "cos2",
                                gradient.cols = c("red", "blue", "green"),
                                repel = TRUE)
input.variables <- input.variables + ggtitle("PCA graph of input variables")
input.variables

output.variables <- fviz_pca_var(pca.output,
                                 col.var = "cos2",
                                 gradient.cols = c("red", "blue", "green"),
                                 repel = TRUE)
output.variables <- output.variables + ggtitle("PCA graph of output variables")
output.variables

# Contribution plot

fviz_contrib(pca.input,choice = 'var')
fviz_contrib(pca.input,choice = 'var',axes = 2)


fviz_contrib(pca.output,choice = 'var')
fviz_contrib(pca.output,choice = 'var',axes = 2)


#The PC scores: 
input.scores <- predict(pca.input, newdata = input.data.matrix)
input.scores_df <- as.data.frame(input.scores)
colnames(input.scores_df) <- paste("Input", colnames(input.scores_df), sep = " ")

write_xlsx(input.scores_df, "/Users/farahaboucha/Desktop/Graduation Project/Input scores.xlsx")
head(input.scores_df)

output.scores <- predict(pca.output, newdata = output.data.matrix)
output.scores_df <- as.data.frame(output.scores)
colnames(output.scores_df) <- paste("Output", colnames(output.scores_df), sep = " ")

write_xlsx(output.scores_df, "/Users/farahaboucha/Desktop/Graduation Project/Output scores.xlsx")
head(output.scores_df)