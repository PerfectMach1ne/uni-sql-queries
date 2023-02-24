USE wspa_hr;

SELECT DISTINCT
	location_id,
    street_address,
    city,
    state_province,
    country_name
FROM departments INNER JOIN locations
USING(location_id)
INNER JOIN countries
USING(country_id);