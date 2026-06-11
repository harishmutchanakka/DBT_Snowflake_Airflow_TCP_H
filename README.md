# Sales Analytics Pipeline
## dbt · Snowflake · Apache Airflow

End-to-end ELT pipeline processing 1.5M orders from TPC-H dataset using dbt for transformation, Snowflake as the cloud warehouse, and Apache Airflow for orchestration.

---

## Architecture
![Lineage Graph](lineage_graph.png)

## Stack
| Layer | Tool |
|---|---|
| Warehouse | Snowflake (Azure) |
| Transformation | dbt-core 1.11, dbt_utils, dbt_expectations |
| Orchestration | Apache Airflow 2.6.3 |
| Source Data | TPC-H SF1 — 1.5M orders, 6M line items |
| Version Control | GitHub |

## dbt Project Includes
- 5 staging models with sources.yml
- 1 intermediate model (ephemeral CTE)
- fct_orders — incremental fact table (1.5M rows)
- dim_customers — enriched dimension (150K rows)
- customer_snapshot — SCD Type 2 history tracking
- order_priority_tiers — seed CSV
- 2 custom Jinja macros
- dbt_utils + dbt_expectations data quality tests
- 25 passing data tests
- Full column-level documentation

## Screenshots
### dbt Lineage Graph
![Lineage Graph](lineage_graph.png)

### Airflow DAG — All Tasks Green
![Airflow DAG](airflow_dag.png)

## How to Run Locally