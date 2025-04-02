/* Write your T-SQL query statement below */
with first_order as( select customer_id, min(d.order_date) first_date
 from Delivery d group by customer_id)
 select 
   round (sum (case when f.first_date=de.customer_pref_delivery_date then 1 else 0 end)*1.0/count(de.delivery_id)*100,2) as immediate_percentage
 from delivery de, first_order f
 where de.customer_id=f.customer_id and de.order_date=f.first_date
