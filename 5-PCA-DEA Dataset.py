import pandas as pd
from sklearn.preprocessing import MinMaxScaler

PC_input = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Input scores.xlsx')
PC_output = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Output scores.xlsx')
PCA_scores = pd.concat([PC_input, PC_output], axis=1)

scaler = MinMaxScaler()
normalized_scores = scaler.fit_transform(PCA_scores)
normalized_dataset = pd.DataFrame(normalized_scores, columns=PCA_scores.columns)

dataset = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Normalized Dataset.xlsx')
merged_data = pd.concat([dataset, normalized_dataset], axis=1)

merged_data.to_excel('/Users/farahaboucha/Desktop/Graduation Project/PCA-DEA Dataset.xlsx', index=False)
print(merged_data.head())
