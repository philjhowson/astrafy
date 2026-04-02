view: fct_sales {

  label: "Product Performance"
  sql_table_name: astrafy-491513.analytics.fct_sales ;;

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

  dimension: order_id {
    type: int
    label: "Order ID"
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    type: int
    label: "Product ID"
    sql: ${TABLE}.product_id ;;
  }

  dimension: qty {
    type: int
    label: "Quantity"
    sql: ${TABLE}.qty ;;
  }

  measure: total_qty {
    type: sum
    label: "Total Quantity of Products Sold"
    sql: ${qty} ;;
  }

  measure: average_qty {
    type: average
    label: "Average Quantity of Products Sold"
    sql: ${qty} ;;
  }

}