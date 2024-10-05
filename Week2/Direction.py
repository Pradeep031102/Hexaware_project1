import pandas as pd
from sqlalchemy import create_engine

# Load the CSV file
df = pd.read_csv('C:\\Users\\prade\\OneDrive\\Desktop\\Traffic\\data.csv', dtype=object)

# Alternatively, if you have already loaded the DataFrame, convert all columns to object
df = df.astype(object)

# Verify the conversion
# print(df.dtypes)

Direction_df = pd.DataFrame(df[[
    "count_point_id",
    "direction_of_travel"]])
Direction_df.dropna(subset=["count_point_id", "direction_of_travel"], inplace=True)
Direction_df.drop_duplicates(inplace=True)
df["count_point_id"] = pd.to_numeric(df["count_point_id"], errors='coerce')
df["direction_of_travel"] = pd.to_numeric(df["direction_of_travel"], errors='coerce')

print(Direction_df)

# Replace with your actual database connection string
 
connection_string = r"mssql+pyodbc://DESKTOP-MB0Q7BK/Traffic?driver=ODBC+Driver+17+for+SQL+Server"
engine = create_engine(connection_string)

# Load the DataFrame into the SQL table
Direction_df.to_sql('Direction', engine, if_exists='append', index=False)