view: fct_orders {

  label: "Sales Performance"
  sql_table_name: astrafy-491513.analytics.fct_orders ;;

  dimension_group: order_date {
    type: time
    timeframes: [date, week, month, quarter, year]
    label: "Date of Order"
    datatype: date
    sql: ${TABLE}.order_date ;;
  }

  dimension: customer_id {
    type: int
    label: "Customer ID"
    sql: ${TABLE}.customer_id ;;
  }

  dimension: order_segmentation {
    type: string
    label: "User Segmentation"
    sql: ${TABLE}.order_segmentation ;;
  }

  dimension: order_id {
    type: int
    primary_key: yes
    label: "Order ID"
    sql: ${TABLE}.order_id ;;
  }

  dimension: qty_product {
    type: int
    label: "Basket Size"
    sql: ${TABLE}.qty_product ;;
  }

  dimension: net_sales {
    type: float
    label: "Net Sales"
    sql: ${TABLE}.net_sales ;;
  }

  measure: total_revenue {
    type: sum
    label: "Total Net Sales"
    sql: ${net_sales} ;;
 }

  measure: order_count {
    type: count
    label: "Total Number of Orders"
  }

  measure: customer_count {
    type: count_distinct
    label: "Unique Customer Count"
    sql: ${customer_id} ;;
  }

  measure: aov {
    type: number
    label: "Average Order Value"
    sql: ${total_revenue} / NULLIF(${order_count}, 0) ;;
  }

  measure: total_qty_product {
    type: sum
    label: "Total Number of Products Sold"
    sql: ${qty_product} ;;
  }

  measure: avg_basket_size {
    type: number
    label: "Average Basket Size"
    sql: ${total_qty_product} / NULLIF(${order_count}, 0) ;;
  }

  measure: revenue_per_customer {
    type: number
    label: "Average Value per Customer"
    sql: ${total_revenue} / NULLIF(${customer_count}, 0) ;;
  }

}