connection: "bigquery_connection"

include: "/views/*.view.lkml"

explore: fct_orders {
  label: "Orders Analysis"
  from: fct_orders
}

explore: fct_sales {
  label: "Product Analysis"
  from: fct_sales
}
