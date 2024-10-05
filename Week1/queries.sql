USE Traffic;

-- 1. Count the total number of locations in the `Location` table.
SELECT COUNT(*) AS TotalLocations FROM Location;

-- 2. Retrieve all unique road types from the `Location` table.
SELECT DISTINCT road_type FROM Location;

-- 3. Find the maximum link length in kilometers from the `LinkLength` table.
SELECT MAX(link_length_km) AS MaxLinkLengthKm FROM LinkLength;

-- 4. Count the total number of traffic counts recorded for each vehicle type in the `TrafficCount` table.
SELECT 
    SUM(pedal_cycles) AS TotalPedalCycles,
    SUM(two_wheeled_motor_vehicles) AS TotalTwoWheeledMotorVehicles,
    SUM(cars_and_taxis) AS TotalCarsAndTaxis,
    SUM(buses_and_coaches) AS TotalBusesAndCoaches,
    SUM(lgvs) AS TotalLGVs,
    SUM(hgvs_2_rigid_axle) AS TotalHGVs2RigidAxle,
    SUM(hgvs_3_rigid_axle) AS TotalHGVs3RigidAxle,
    SUM(hgvs_4_or_more_rigid_axle) AS TotalHGVs4OrMoreRigidAxle,
    SUM(hgvs_3_or_4_articulated_axle) AS TotalHGVs3Or4ArticulatedAxle,
    SUM(hgvs_5_articulated_axle) AS TotalHGVs5ArticulatedAxle,
    SUM(hgvs_6_articulated_axle) AS TotalHGVs6ArticulatedAxle,
    SUM(all_hgvs) AS TotalAllHGVs,
    SUM(all_motor_vehicles) AS TotalAllMotorVehicles
FROM TrafficCount;

-- 5. Find all traffic counts for a specific count point ID.
SELECT * FROM TrafficCount WHERE count_point_id = 6016;

-- 6. Retrieve all locations in a specific region (e.g., "Downtown").
SELECT * FROM Location WHERE region_name = 'South West';

-- 7. Count how many distinct local authorities are there in the `Location` table.
SELECT COUNT(DISTINCT local_authority_id) AS TotalLocalAuthorities FROM Location;

-- 8. Find the average link length in kilometers.
SELECT AVG(link_length_km) AS AverageLinkLengthKm FROM LinkLength;

-- 9. Retrieve all traffic counts recorded on a specific year
SELECT * FROM TrafficCount 
WHERE count_point_id IN (SELECT count_point_id FROM DateTimeInfo WHERE year = 2019);

-- 10. Get the total number of traffic counts per direction of travel.
SELECT direction_of_travel, COUNT(*) AS TotalCounts
FROM Direction
GROUP BY direction_of_travel;

-- 11. Find the locations with the highest easting value.
SELECT TOP 1 * 
FROM Location 
ORDER BY easting DESC;

-- 12. Calculate the total number of all motor vehicles for each location.
SELECT Location.location_id, SUM(TrafficCount.all_motor_vehicles) AS TotalMotorVehicles
FROM Location
JOIN TrafficCount ON Location.count_point_id = TrafficCount.count_point_id
GROUP BY Location.location_id;

-- 13. Find the average number of cars and taxis counted at each location.
SELECT Location.location_id, AVG(TrafficCount.cars_and_taxis) AS AverageCarsAndTaxis
FROM Location
JOIN TrafficCount ON Location.count_point_id = TrafficCount.count_point_id
GROUP BY Location.location_id;

-- 14. Retrieve the count of all HGVS with 2 rigid axles for each count point ID.
SELECT count_point_id, SUM(hgvs_2_rigid_axle) AS TotalHGVs2RigidAxle
FROM TrafficCount
GROUP BY count_point_id;

-- 15. List all distinct combinations of road names and types from the `Location` table.
SELECT DISTINCT road_name, road_type FROM Location;

-- 16. Count the total number of traffic records for each hour of the day.
SELECT hour, COUNT(*) AS TotalRecords
FROM DateTimeInfo
GROUP BY hour;

-- 17. Find the total number of counts for a specific local authority
SELECT COUNT(*) AS TotalCounts 
FROM TrafficCount 
WHERE count_point_id IN (SELECT count_point_id FROM Location WHERE local_authority_name = 'Gloucestershire');

-- 18. Retrieve the link length in miles for each count point ID.
SELECT count_point_id, link_length_miles FROM LinkLength;

-- 19. Find the total number of pedal cycles counted for each region.
SELECT Location.region_name, SUM(TrafficCount.pedal_cycles) AS TotalPedalCycles
FROM Location
JOIN TrafficCount ON Location.count_point_id = TrafficCount.count_point_id
GROUP BY Location.region_name;

-- 20. Retrieve all records from the `DateTimeInfo` table for a specific year
SELECT * FROM DateTimeInfo WHERE year = 2019;
