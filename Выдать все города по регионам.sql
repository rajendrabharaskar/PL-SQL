select REGION_NAME, CITY_NAME
from CITIES
inner join REGION on REGION.REGION_ID = CITIES.REGION_ID;
