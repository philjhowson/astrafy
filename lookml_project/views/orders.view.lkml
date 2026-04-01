view: total_sales {

  sql_table_name: your_dataset.total_sales ;;

  measure: total_orders {
    type: sum
    sql: ${TABLE}.total_orders ;;
  }
}