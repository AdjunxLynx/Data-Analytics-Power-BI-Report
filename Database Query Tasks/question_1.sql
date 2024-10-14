SELECT sum("staff numbers") as Amount_Of_Staff_In_GB
FROM dim_stores
WHERE country_code = 'GB'