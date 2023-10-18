select 
    c.customer_name as "Customer",
    (PRINTF("$%.2f", SUM((s.subscription_length * s.price_per_month)))) as "Amount Due"
from orders o
join customers c 
    on (o.customer_id = c.customer_id)
join subscriptions s
    on (o.subscription_id = s.subscription_id)
where o.order_status = 'unpaid' and s.description = 'Fashion Magazine'
group by c.customer_id