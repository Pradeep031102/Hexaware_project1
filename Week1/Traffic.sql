CREATE DATABASE Traffic

CREATE TABLE Location (
    location_id INT PRIMARY KEY IDENTITY(1,1),
    count_point_id INT,
    region_id INT,
    region_name VARCHAR(100),
    local_authority_id INT,
    local_authority_name VARCHAR(100),
    road_name VARCHAR(100),
    road_type VARCHAR(50),
    start_junction_road_name VARCHAR(100),
    end_junction_road_name VARCHAR(100),
    easting FLOAT,
    northing FLOAT,
    latitude FLOAT,
    longitude FLOAT
);
CREATE TABLE DateTimeInfo (
    datetime_id INT PRIMARY KEY IDENTITY(1,1),
    count_point_id INT,
    year INT,
    count_date DATE,
    hour INT
);
CREATE TABLE LinkLength (
    length_id INT PRIMARY KEY IDENTITY(1,1),
    count_point_id INT,
    link_length_km FLOAT,
    link_length_miles FLOAT
);
CREATE TABLE TrafficCount (
    traffic_id INT PRIMARY KEY IDENTITY(1,1),
    count_point_id INT,
    pedal_cycles INT,
    two_wheeled_motor_vehicles INT,
    cars_and_taxis INT,
    buses_and_coaches INT,
    lgvs INT,
    hgvs_2_rigid_axle INT,
    hgvs_3_rigid_axle INT,
    hgvs_4_or_more_rigid_axle INT,
    hgvs_3_or_4_articulated_axle INT,
    hgvs_5_articulated_axle INT,
    hgvs_6_articulated_axle INT,
    all_hgvs INT,
    all_motor_vehicles INT
);
CREATE TABLE Direction (
    direction_id INT PRIMARY KEY IDENTITY(1,1),
    count_point_id INT,
    direction_of_travel VARCHAR(50)
);

SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG = 'Traffic';

select* from TrafficCount



