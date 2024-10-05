import pandas as pd
from sqlalchemy import create_engine

# Load the CSV file
df = pd.read_csv('C:\\Users\\prade\\OneDrive\\Desktop\\Traffic\\data.csv', dtype=object)

# Alternatively, if you have already loaded the DataFrame, convert all columns to object
df = df.astype(object)

# Verify the conversion
# print(df.dtypes)

Location_df = pd.DataFrame(df[["count_point_id","region_id",
    "region_name",
    "local_authority_id",
    "local_authority_name",
    "road_name",
    "road_type",
    "start_junction_road_name",
    "end_junction_road_name",
    "easting",
    "northing",
    "latitude",
    "longitude"]])

# 1. Handling Missing Values
# Dropping rows where it has missing values

Location_df.dropna(subset=[ "count_point_id",
            "region_id",
            "local_authority_name"
          ], inplace=True)
df["region_id"] = pd.to_numeric(df["region_id"], errors='coerce')
df["local_authority_name"] = pd.to_numeric(df["local_authority_name"], errors='coerce')

print(Location_df)

# Replace with your actual database connection string
 
connection_string = r"mssql+pyodbc://DESKTOP-MB0Q7BK/Traffic?driver=ODBC+Driver+17+for+SQL+Server"
engine = create_engine(connection_string)

# Load the DataFrame into the SQL table
Location_df.to_sql('Location', engine, if_exists='append', index=False)