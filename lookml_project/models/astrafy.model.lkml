connection: "bigquery_connection"

include: "/views/*.view.lkml"

explore: product_quantity {

  label: "Orders Analysis"

  join: customer_segment {
    type: left_outer
    sql_on: ${product_quantity.order_id} = ${customer_segment.order_id} ;;
  }

}