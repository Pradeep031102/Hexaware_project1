import pandas as pd
from sqlalchemy import create_engine

# Load the CSV file
df = pd.read_csv('C:\\Users\\prade\\OneDrive\\Desktop\\Traffic\\data.csv', dtype=object)

# Alternatively, if you have already loaded the DataFrame, convert all columns to object
df = df.astype(object)

# Verify the conversion
# print(df.dtypes)

TrafficCount_df = pd.DataFrame(df[["count_point_id",
    "pedal_cycles",
    "two_wheeled_motor_vehicles",
    "cars_and_taxis",
    "buses_and_coaches",
    "lgvs",
    "hgvs_2_rigid_axle",
    "hgvs_3_rigid_axle",
    "hgvs_4_or_more_rigid_axle",
    "hgvs_3_or_4_articulated_axle",
    "hgvs_5_articulated_axle",
    "hgvs_6_articulated_axle",
    "all_hgvs",
    "all_motor_vehicles"]])

TrafficCount_df.dropna(subset=["count_point_id",
            "pedal_cycles",
            "hgvs_4_or_more_rigid_axle"], inplace=True)

df["count_point_id"] = pd.to_numeric(df["count_point_id"], errors='coerce')
df["pedal_cycles"] = pd.to_numeric(df["pedal_cycles"], errors='coerce')

print(TrafficCount_df)

# Replace with your actual database connection string
 
connection_string = r"mssql+pyodbc://DESKTOP-MB0Q7BK/Traffic?driver=ODBC+Driver+17+for+SQL+Server"
engine = create_engine(connection_string)

# Load the DataFrame into the SQL table
TrafficCount_df.to_sql('TrafficCount', engine, if_exists='append', index=False)