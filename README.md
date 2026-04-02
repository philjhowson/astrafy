![Astrafy](images/astrafy.png)

# Case Study: dbt + Looker Analytics Pipeline for Customer & Sales Intelligence

This project demonstrates the design and implementation of a modular analytics engineering stack using **dbt and Looker**, built to transform raw transactional data into a reliable analytics layer for customer behavior and sales performance analysis across 2022–2023.

The system delivers:<br>
• a structured and tested **data warehouse model (dbt)**<br>
• a reusable **semantic layer (LookML)**<br>
• and an interactive **dashboard (Looker Studio)**<br>

Key focus areas include:<br>
• layered data modeling (staging → intermediate → marts)<br>
• reusable business logic (customer segmentation, order metrics)<br>
• data quality testing and validation<br>
• BI-ready semantic definitions

---

## Problem Statement

The objective of this project was to design an analytics system that enables:<br>
• analysis of customer lifecycle behavior (New, Returning, VIP)<br>
• tracking of sales performance across 2022–2023<br>
• consistent KPI definitions across reporting layers<br><br>

The raw dataset lacked:<br>
• standardized structure across tables<br>
• reusable transformation logic<br>
• analytical modeling for BI consumption

---

## Data Architecture & Design

The project follows a layered **dbt architecture** designed to ensure modularity, scalability, and maintainability.

### Staging Layer

Raw source tables were standardized in:<br>
• `stg_orders`<br>
• `stg_sales`<br><br>

These models:<br>
• normalize field names and data types<br>
• define a consistent analytical grain<br>
• provide a clean interface over raw sources<br>

This ensures downstream models are not dependent on source system inconsistencies.

---

### Intermediate Layer
Reusable business logic is centralized in intermediate models:<br>
• `int_order_quantity`<br>
• `int_customer_segment`<br><br>

These models:<br>
• encapsulate transformations used across multiple analyses<br>
• prevent duplication of logic<br>
• serve as a semantic bridge between staging and marts

---

### Mart Layer
Final analytical tables are exposed through:<br>
• `fct_orders`<br>
• `fct_sales`<br><br>

These marts are optimized for BI consumption and are designed to support:<br>
• performance analysis<br>
• customer analytics<br>
• product-level reporting

---

## Applied Modeling (Business Logic Implementation)

The following transformations demonstrate how the analytical requirements were implemented using dbt.
These models represent the operationalization of the architecture described above, translating business requirements into reusable transformation logic.

### Order-Level Metrics (Exercises 1–4)

![Exercises 1-4](images/int_order_quantity_lineage.png)

This model aggregates sales data at the order grain to compute product quantities and support downstream revenue and order-based analysis.
It establishes a reusable foundation for all order-level KPIs used across the project.

### Customer Segmentation (Exercises 5–6)

![Exercises 1-4](images/int_order_quantity_lineage.png)

Customer segmentation is computed using a 12-month trailing window at the order grain, capturing historical purchase behavior per customer.

This logic enables classification into:<br>
• New<br>
• Returning<br>
• VIP<br><br>

and is reused across both BI dashboards and semantic layer definitions.

---

## Looker Studio Dashboard

I designed the Looker Studio dashboard to expose key metrics from Exercises 1–6 in a cohesive analytical narrative.

The dashboard highlights:<br>
• KPI performance trends<br>
• customer behavior differences<br>
• revenue evolution across 2022–2023<br>

![Looker Studio Dashboard](images/looker_studio_dashboard.png)

---

## Semantic Layer (LookML)

A LookML semantic layer was implemented to ensure consistent metric definitions across all dashboards and users.

Two domain-specific explores were created:<br>
• `fct_orders`: customer and revenue analytics<br>  
• `fct_sales`: product-level performance analytics<br><br>  

This separation enables modular analysis across business domains while maintaining consistent definitions for key metrics such as:<br>
• average order value<br>
• revenue per customer<br>
• product-level contribution<br>

---

## Data Quality & Testing Strategy

To ensure reliability of transformations, dbt schema tests were implemented across all layers:<br>
• uniqueness constraints on primary keys<br>
• non-null validation for critical dimensions<br>
• referential integrity between staging and intermediate models<br><br>

These tests ensure data consistency and prevent silent failures in downstream analytics workflows.

---

## Project Organization

    root
    ├── analyses # contains the sql used to solve coding challenges
    │   ├── exercise_1.sql
    │   ├── exercise_2.sql
    │   ├── exercise_3.sql
    │   ├── exercise_4.sql
    │   ├── exercise_5.sql
    │   └── exercise_6.sql
    ├── images # contains images used in readme.md
    ├── lookml_project # contains the relevant .lkml files for explores and exposing dimensions/measures
    │   ├── models
    │   │    └── astrafy.model.lkml
    │   └── views
    │        ├── fct_orders.view.lkml
    │        └── fct_sales.view.lkml
    ├── macros # ensures consistent database naming
    │   └── generate_schema_name.sql
    ├── models # contains models and tests used in the dbt pipeline
    │   ├── intermediate
    │   │    ├── int_customer_segments.sql
    │   │    ├── int_customer_segment.yml
    │   │    ├── int_order_quantity.sql
    │   │    └── int_order_quantity.yml
    │   ├── marts
    │   │    ├── fct_orders.sql
    │   │    └── fct_sales.sql
    │   └── staging
    │        ├── sources.yml
    │        ├── stg_orders.sql
    │        └── stg_sales.sql
    ├── .gitignore
    ├── dbt_project.yml
    └── README.md