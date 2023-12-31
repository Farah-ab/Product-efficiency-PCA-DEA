# Merging the variables

Input1 = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Input1.xlsx')
Input2 = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Input2.xlsx')
Input3 = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Input3.xlsx')
Input4 = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Input4.xlsx')
Output1 = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Output1.xlsx')
Output2 = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Output2.xlsx')
Output3 = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Output3.xlsx')

Dataset = pd.merge(Input1, Input2, on='Product ID')
Dataset = pd.merge(Dataset, Input3, on='Product ID')
Dataset = pd.merge(Dataset, Input4, on='Product ID')
Dataset = pd.merge(Dataset, Output1, on='Product ID')
Dataset = pd.merge(Dataset, Output2, on='Product ID')
Dataset = pd.merge(Dataset, Output3, on='Product ID')
Dataset.to_excel('/Users/farahaboucha/Desktop/Graduation Project/Dataset.xlsx', index=False)

# Normalization
from sklearn.preprocessing import MinMaxScaler

dataset = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Dataset.xlsx')
scaler = MinMaxScaler()
columns_to_normalize = ['Counted Rejections', 'Average Shipping Cost', 'Items with Complaint', 'Average product cost', 'Average Order Count', 'Average gross profit', 'Monthly NPS']
normalized_dataset = scaler.fit_transform(dataset[columns_to_normalize])

dataset[columns_to_normalize] = normalized_dataset

dataset = dataset.sort_values(by=dataset.columns[0])
dataset.to_excel('/Users/farahaboucha/Desktop/Graduation Project/Normalized Dataset.xlsx', index=False)
