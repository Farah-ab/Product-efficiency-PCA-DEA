# Input1: Counted rejections

df = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Order rejections per product group.xlsx')
Counted_Rejections = df['Product ID'].value_counts()

Input1 = pd.DataFrame({'Product ID': Counted_Rejections.index, 'Counted Rejections': Counted_Rejections.values})
Input1.to_excel('/Users/farahaboucha/Desktop/Graduation Project/Input1.xlsx', engine='openpyxl', index=False)


# Input2: Average shipping cost

df = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Filled Input2.xlsx')
df['Average Shipping Cost'] = df.iloc[:, 1:].mean(axis=1)

Input2 = df[['Product ID', 'Average Shipping Cost']].copy()
Input2.to_excel('/Users/farahaboucha/Desktop/Graduation Project/Input2.xlsx', index=False)
print(Input2.head())


# Input3: Average Items wih complaints

df = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Complaint Rate by Product Group Weekly.xlsx')
df = df.loc[:, ~df.columns.str.contains('Complaint Rate|Complaint Action Amount|Complaint Items VGP')]
df_cleaned = df.dropna(subset=['Items with Complaint'])

Input3 = df_cleaned.groupby('Product ID')['Items with Complaint'].mean().reset_index()
Input3.to_excel('/Users/farahaboucha/Desktop/Graduation Project/Input3.xlsx', index=False)


# Input4: Average product cost

df = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Filled Input4.xlsx')
df['Average product cost'] = df.iloc[:, 1:].mean(axis=1)

Input4 = df[['Product ID', 'Average product cost']].copy()
Input4.to_excel('/Users/farahaboucha/Desktop/Graduation Project/Input4.xlsx', index=False)

# Output1: Average order count

df = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Filled Output1.xlsx')
df['Average Order Count'] = round(df.iloc[:, 1:].mean(axis=1), 0)

Output1 = df[['Product ID', 'Average Order Count']].copy()
Output1.to_excel('/Users/farahaboucha/Desktop/Graduation Project/Output1.xlsx', index=False)


# Output2: Average gross profit

df = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Filled Output2.xlsx')
df['Average gross profit'] = round(df.iloc[:, 1:].mean(axis=1), 0)

Output2 = df[['Product ID', 'Average gross profit']].copy()
Output2.to_excel('/Users/farahaboucha/Desktop/Graduation Project/Output2.xlsx', index=False)

#Output3: Net promoter score

NPS = pd.read_excel('/Users/farahaboucha/Desktop/Graduation Project/Filled Output3.xlsx')
NPS['Monthly NPS'] = round(NPS.iloc[:, 1])

Output3 = NPS[['Product ID', 'Monthly NPS']].copy()
Output3.to_excel('/Users/farahaboucha/Desktop/Graduation Project/Output3.xlsx', index=False)
