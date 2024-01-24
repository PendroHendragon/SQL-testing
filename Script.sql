select count(*) as LOL from asset_management_asset,asset_management_assettype,flight_flight where asset_management_asset.type_id = asset_management_assettype.id and asset_management_assettype.name = 'SAT' and asset_management_asset.status = 'S';


select to_char("date", 'MONTH YYYY') from asset_management_inspection;

select * from asset_management_inspection where
to_char(asset_management_inspection."date",'MONTH YYYY')>='JANUARY   2023' and
to_char(asset_management_inspection."date",'MONTH YYYY') <= to_char(current_date, 'MONTH YYYY') and
asset_management_inspection."comments" like 'NÃO FUNCIONA' 
 ;

select count(asset_management_asset.id) as My_Count, asset_management_asset.status from asset_management_asset, asset_management_inspection where asset_management_asset.id = asset_management_inspection.asset_id and to_char(date, 'MONTH YYYY') = to_char(current_date, 'MONTH YYYY') group by asset_management_asset.status;
select count(distinct asset_management_inspection.asset_id) as My_Count from asset_management_inspection,asset_management_asset where asset_management_inspection.asset_id = asset_management_asset.id and to_char(date, 'MONTH YYYY') = to_char(current_date, 'MONTH YYYY');
select Count(*) from asset_management_inspection where to_char("date", 'MONTH YYYY') = to_char(current_date, 'MONTH YYYY');
select * from flight_airport fa order by id ;

select * from asset_management_assetreservation ama ;

select * from flight_airport fa  ;
select distinct status from asset_management_asset ama ;

select asset_management_asset.serial_number,asset_management_assettype."name", flight_airport.code from
asset_management_asset,asset_management_assettype,flight_airport
where asset_management_asset.type_id = asset_management_assettype.id and
asset_management_assettype."name" = 'DRAWER' and asset_management_asset.status = 'S'
and asset_management_asset.location_id = flight_airport.id and flight_airport."code" = 'ADCEN' and asset_management_asset.serial_number = '' ;


select flight_airport.code,count(distinct asset_management_inspection.asset_id) as Inspected
from asset_management_inspection, asset_management_asset, flight_airport 
where asset_management_asset.location_id = flight_airport.id and to_char(asset_management_inspection."date",'YYYY')='2023'
and asset_management_asset.id = asset_management_inspection.asset_id
group by flight_airport.code;
;

SELECT flight_airport.code,Count(asset_management_asset.id) as Inspected
FROM asset_management_asset, flight_airport
WHERE NOT exists  
    (SELECT * 
     FROM asset_management_inspection
     WHERE asset_management_asset.id = asset_management_inspection.asset_id and to_char(asset_management_inspection."date",'YYYY')='2023') 
     and asset_management_asset.location_id  = flight_airport.id
     group by flight_airport.code
    order by flight_airport.code;


select * from asset_management_assettype where asset_management_assettype."name"='' or asset_management_assettype is null;