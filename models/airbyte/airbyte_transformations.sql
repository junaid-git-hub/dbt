{{config(materialized="table")}}

WITH SENDER_MESSAGE AS (
	SELECT id as channel_id,sender->>'id' as sender_id,
	to_timestamp(time/1000)::date as date,
	to_timestamp(time/1000)::time as time,
	sender->>'name' as sender_name,
	content->>'text' as message 
	from public."Messages"
)


SELECT * from SENDER_MESSAGE