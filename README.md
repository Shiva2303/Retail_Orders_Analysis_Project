# Retail Orders Analysis Project

## Overview
This project analyzes retail order data to derive business insights using Python and SQL. The analysis focuses on revenue patterns, product performance, and sales growth across different dimensions like regions, categories, and time periods.

## Dataset
The dataset contains retail orders with the following key information:
- Order details (ID, date, shipping mode)
- Customer segmentation
- Geographic information (country, city, state, region)
- Product information (category, subcategory, product ID)
- Financial metrics (quantity, sales price, profit)

## Key Analyses

### 1. Top Revenue Generating Products
- Identifies the top 10 products by revenue
- Helps in understanding which products are driving the most sales
- Used for inventory management and marketing focus

### 2. Regional Product Performance
- Analyzes top 5 selling products in each region
- Reveals regional preferences and buying patterns
- Assists in regional marketing and stock distribution

### 3. Month-over-Month Growth Analysis (2022 vs 2023)
- Compares monthly sales between 2022 and 2023
- Tracks year-over-year growth patterns
- Identifies seasonal trends and performance improvements

### 4. Category Performance by Month
- Determines peak sales months for each product category
- Helps in seasonal planning and inventory management
- Identifies optimal timing for category-specific promotions

### 5. Subcategory Growth Analysis
- Measures profit growth by subcategory between 2022 and 2023
- Identifies fastest-growing product segments
- Guides investment and expansion decisions

## Technical Implementation
- Data processing using Python (Pandas)
- Data storage in SQL Server
- Advanced SQL queries featuring:
  - Common Table Expressions (CTEs)
  - Window Functions
  - Aggregate Functions
  - Date/Time Operations

## Setup Instructions
1. Install required Python packages:
```bash
pip install pandas sqlalchemy pyodbc
```

2. Database Configuration:
```python
engine = sqlalchemy.create_engine('mssql+pyodbc://SERVER_NAME/DATABASE_NAME?driver=ODBC+Driver+17+for+SQL+Server')
```

3. Execute the Jupyter notebook for data processing and loading

## SQL Queries
All analysis queries are documented in the `analysis_queries.sql` file and include:
- Revenue analysis
- Regional performance
- Time-based comparisons
- Category/subcategory analysis

## Future Enhancements
- Add customer segmentation analysis
- Include profit margin analysis by region
- Develop predictive sales models
- Create automated reporting dashboards

## Contributing
Feel free to fork this repository and submit pull requests for any enhancements.


