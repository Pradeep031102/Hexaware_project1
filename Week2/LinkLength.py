import pandas as pd
from sqlalchemy import create_engine

# Load the CSV file
df = pd.read_csv('C:\\Users\\prade\\OneDrive\\Desktop\\Traffic\\data.csv', dtype=object)

# Alternatively, if you have already loaded the DataFrame, convert all columns to object
df = df.astype(object)

# Verify the conversion
# print(df.dtypes)

LinkLength_df = pd.DataFrame(df[["count_point_id", "link_length_km","link_length_miles"]])
LinkLength_df.dropna(subset=["count_point_id", "link_length_km"], inplace=True)
LinkLength_df.drop_duplicates(inplace=True)
df["count_point_id"] = pd.to_numeric(df["count_point_id"], errors='coerce')
df["link_length_km"] = pd.to_numeric(df["link_length_km"], errors='coerce')

print(LinkLength_df)

# Replace with your actual database connection string
 
connection_string = r"mssql+pyodbc://DESKTOP-MB0Q7BK/Traffic?driver=ODBC+Driver+17+for+SQL+Server"
engine = create_engine(connection_string)

# Load the DataFrame into the SQL table
LinkLength_df.to_sql('LinkLength', engine, if_exists='append', index=False)