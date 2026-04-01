view: customer_segment {

  sql_table_name: your_dataset.customer_segment ;;

  dimension: order_id {
    sql: ${TABLE}.order_id ;;
  }

  dimension: customer_id {
    sql: ${TABLE}.customer_id ;;
  }

  dimension: order_date {
    type: date
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_segmentation {
    type: string
    sql: ${TABLE}.order_segmentation ;;
  }

  measure: orders {
    type: count
  }
}