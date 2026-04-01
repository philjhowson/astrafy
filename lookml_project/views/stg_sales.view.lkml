view: stg_sales {

  description: "Order line-item staging table. One row per product per order."
  sql_table_name: astrafy-491513.analytics_astrafy.stg_sales ;;

  dimension: order_id {
    type: int
    label: "Order ID (sales)"
    group_label: "Order Attributes"
    description: "Order ID for each order. Not unique in this table."
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    type: int
    label: "Product ID"
    group_label: "Order Attributes"
    description: "ID number of each product that has been ordered."
    sql: ${TABLE}.product_id ;;
  }

  dimension: customer_id {
    type: int
    label: "Customer ID (sales)"
    group_label: "Customer Attributes"
    description: "ID for each customer."
    sql: ${TABLE}.customer_id ;;
  }

  measure: quantity {
    type: sum
    label: "Quantity of Sales"
    group_label: "Order Metrics"
    description: "Total number of items sold."
    sql: ${TABLE}.qty ;;
  }

}