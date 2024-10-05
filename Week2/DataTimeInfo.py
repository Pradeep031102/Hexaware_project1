import pandas as pd
from sqlalchemy import create_engine

# Load the CSV file
df = pd.read_csv('C:\\Users\\prade\\OneDrive\\Desktop\\Traffic\\data.csv', dtype=object)

# Alternatively, if you have already loaded the DataFrame, convert all columns to object
df = df.astype(object)

# Verify the conversion
# print(df.dtypes)

DataTimeInfo_df = pd.DataFrame(df[["count_point_id", "year", "count_date", "hour"]])
DataTimeInfo_df.dropna(subset=["count_point_id", "year"], inplace=True)
DataTimeInfo_df.drop_duplicates(inplace=True)
df["count_point_id"] = pd.to_numeric(df["count_point_id"], errors='coerce')
df["year"] = pd.to_numeric(df["year"], errors='coerce')

print(DataTimeInfo_df)

# Replace with your actual database connection string
 
connection_string = r"mssql+pyodbc://DESKTOP-MB0Q7BK/Traffic?driver=ODBC+Driver+17+for+SQL+Server"
engine = create_engine(connection_string)

# Load the DataFrame into the SQL table
DataTimeInfo_df.to_sql('DateTimeInfo', engine, if_exists='append', index=False)