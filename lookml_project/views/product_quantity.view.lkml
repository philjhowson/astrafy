view: product_quantity {

  sql_table_name: your_dataset.product_quantity ;;

  dimension: order_id {
    primary_key: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_date {
    type: date
    sql: ${TABLE}.order_date ;;
  }

  dimension: customer_id {
    sql: ${TABLE}.customer_id ;;
  }

  measure: total_orders {
    type: count
  }

  measure: total_quantity {
    type: sum
    sql: ${TABLE}.qty_product ;;
  }

  measure: avg_quantity {
    type: average
    sql: ${TABLE}.qty_product ;;
  }

  measure: total_sales {
    type: sum
    sql: ${TABLE}.net_sales ;;
  }
}