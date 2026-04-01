view: stg_orders {

  description: "Order-level staging table. One row per order."
  sql_table_name: astrafy-491513.analytics_astrafy.stg_orders ;;

  dimension: order_id {
    primary_key: yes
    type: int
    label: "Order ID (orders)"
    group_label: "Order Attributes"
    description: "Order ID for each order. Unique in this table."
    sql: ${TABLE}.order_id ;;
  }

  dimension: customer_id {
    type: int
    description: "ID of the customer who placed the order."
    label: "Customer ID (orders)"
    group_label: "Customer Attributes"
    sql: ${TABLE}.customer_id ;;
  }

  dimension: order_date {
    type: date
    label: "Order Date"
    group_label: "Order Attributes"
    description: "Date the order was placed on."
    sql: ${TABLE}.order_date ;;
  }

  measure: order_count {
    type: count
    description: "Number of orders in the data"
    label: "Number of Orders"
    group_label: "Orders Metrics"
  }

  measure: total_net_sales {
    type: sum
    description: "Total Net Sales for the entire dataset"
    label: "Total Net Sales"
    group_label: "Sales Metrics"
    sql: ${TABLE}.net_sales ;;
  }
}