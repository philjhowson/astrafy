![Astrafy](images/astrafy.png)



## Project Organization
    root
    ├── analyses # contains the .sql files for the coding exercises
    │   ├── exercise_1.sql
    │   ├── exercise_2.sql
    │   ├── exercise_3.sql
    │   ├── exercise_4.sql
    │   ├── exercise_5.sql
    │   └── exercise_6.sql
    ├── images # images used in the readme.md file
    ├── lookml_project
    │   ├── models # explores
    │   │    └── astrafy.model.lkml # explores for fct_orders and fct_sales
    │   └── views # defines dimensions and exposes measures
    │        ├── fct_orders.view.lkml
    │        └── fct_sales.view.lkml
    ├── macros # .sql to be executed by dbt
    │   └── generate_schema_name.sql # ensures the correct dataset name is created
    ├── models # sql used to create staging, intermediate, and marts
    │   ├── intermediate # .sql and .yml files for creation and testing
    │   │    ├── int_customer_segments.sql
    │   │    ├── int_customer_segment.yml
    │   │    ├── int_order_quantity.sql
    │   │    └── int_order_quantity.yml
    │   ├── marts # .sql used to generate the fact tables to be exposed to Looker
    │   │    ├── fct_orders.sql
    │   │    └── fct_sales.sql
    │   └── staging # source configuration and staging files
    │        ├── sources.yml
    │        ├── stg_orders.sql
    │        └── stg_sales.yml    
    ├── .gitignore
    └── README.md

