view: monthly_kpis {

  sql_table_name: your_dataset.monthly_kpis ;;

  dimension: month {
    sql: ${TABLE}.month ;;
  }

  measure: average_quantity {
    type: average
    sql: ${TABLE}.average_quantity ;;
  }

  measure: total_orders {
    type: sum
    sql: ${TABLE}.total_orders ;;
  }
}