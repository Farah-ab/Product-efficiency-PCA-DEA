import pandas as pd

# Input2: Shipping cost

df = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Shipping List Unit Price per product group.xlsx')
df = df.fillna(method='ffill').fillna(method='bfill')

df.iloc[:, 1:] = df.iloc[:, 1:].apply(pd.to_numeric)
df = df.interpolate(method='linear')
df.to_excel('/Users/farahaboucha/Desktop/Graduation Project/Filled Input2.xlsx', index=False)

#Input4: Product cost

cost = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Product cost by product group.xlsx')
cost = cost.fillna(method='ffill').fillna(method='bfill')

cost.iloc[:, 1:] = df.iloc[:, 1:].apply(pd.to_numeric)
cost = cost.interpolate(method='linear')
cost.to_excel('/Users/farahaboucha/Desktop/Graduation Project/Filled Input4.xlsx', index=False)

#Output 1: Order count

count = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Order Count per Product group.xlsx')
count = count.fillna(method='ffill').fillna(method='bfill')

count.iloc[:, 1:] = count.iloc[:, 1:].apply(pd.to_numeric)
count = count.interpolate(method='linear')
count.to_excel('/Users/farahaboucha/Desktop/Graduation Project/Filled Output1.xlsx', index=False)


# Output 2: Gross profit

profit = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Gross profit per product group.xlsx')
profit = profit.fillna(method='ffill').fillna(method='bfill')

profit.iloc[:, 1:] = profit.iloc[:, 1:].apply(pd.to_numeric)
profit = profit.interpolate(method='linear')
profit.to_excel('/Users/farahaboucha/Desktop/Graduation Project/Filled Output2.xlsx', index=False)

#Output 3: Net promoter score

NPS = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/NPS by Product Group.xlsx')
NPS = NPS.fillna(method='ffill').fillna(method='bfill')

NPS.iloc[:, 1:] = NPS.iloc[:, 1:].apply(pd.to_numeric)
NPS = NPS.interpolate(method='linear')
NPS.to_excel('/Users/farahaboucha/Desktop/Graduation Project/Filled Output3.xlsx', index=False)
