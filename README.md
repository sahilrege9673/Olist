# Olist | E-Commerce Performance & Marketplace Analytics

> **End-to-end e-commerce analytics case study analyzing 99,000+ orders across 14.21M+ revenue with comprehensive insights into sales performance, customer behavior, delivery experience, product category analysis, seller performance, and payment optimization using SQL, Python, and Power BI.**

---

## Executive Summary

Olist is a comprehensive e-commerce analytics project examining the complete marketplace ecosystem—from customer acquisition and transaction performance through product category management, seller operations, delivery reliability, and payment method optimization.

The analysis spans:
- **Data Foundation:** 99,000+ orders across multiple product categories, 3,000+ active sellers, 33,000+ products validated for integrity and quality
- **Analytical Scope:** Sales performance, customer engagement, delivery operations, product category analysis, seller performance, and payment optimization
- **Tools Used:** SQL (data modeling & validation), Python (exploratory analysis), Power BI (comprehensive executive dashboard)
- **Business Outcome:** Actionable findings tied to revenue growth, customer satisfaction, operational efficiency, and seller profitability with recommendations prioritized by business impact

---

## 💡 Business Problem

Olist faces the challenge of scaling e-commerce operations while maintaining **reliable delivery experience, healthy customer satisfaction, optimal seller performance, and sustainable revenue growth**.

As marketplace activity increases, inefficiencies in any part of the e-commerce ecosystem can lead to **delayed shipments, poor customer ratings, seller churn, payment processing issues, and missed growth opportunities**.

The business needs to understand where these problems are concentrated and which areas require the greatest management attention.

### 🛍️ Sales Performance & Revenue Growth
- Revenue concentration may not align with order volume distribution.
- Certain product categories may drive disproportionate revenue contribution.
- Sales trends and seasonal patterns need systematic monitoring and forecasting.

### 👥 Customer Engagement & Satisfaction
- Customer acquisition does not guarantee repeat purchases or high satisfaction scores.
- Customer ratings and reviews directly impact brand reputation and purchase decisions.
- Customer satisfaction may vary significantly across product categories and delivery performance.

### 📦 Delivery Performance & Customer Experience
- Delivery delays significantly impact customer satisfaction and repeat purchase behavior.
- Average delivery time trends and on-time delivery percentage are critical performance indicators.
- Late deliveries create negative reviews and reduce customer lifetime value.

### 🏪 Seller Performance & Retention
- Seller revenue concentration creates operational and market risk.
- Top sellers drive disproportionate marketplace value but may have competing offers.
- Seller revenue decline patterns require proactive intervention and support.

### 📊 Product Category Dynamics
- Product category performance varies significantly across order volume, revenue, and customer ratings.
- Freight costs and product pricing relationships impact profitability.
- Category selection directly influences average order value and customer satisfaction.

### 💳 Payment Method Optimization
- Payment method distribution affects transaction success and customer preferences.
- Credit card dominance creates concentration risk requiring payment method diversification.
- Payment method reliability and customer trust vary across channels.

---

## 🎯 Business Objectives

The objective of this project is to use **SQL, Python, and Power BI** to quantify Olist's marketplace performance, identify the primary drivers of revenue leakage and operational inefficiency, and translate findings into actionable business strategies.

### 🛍️ Sales & Revenue Analysis
- Identify total revenue, average order value, and sales trends across time periods.
- Decompose revenue by product category to identify concentration and opportunities.
- Quantify seasonal patterns and growth trajectory.

### 👥 Customer Insights & Satisfaction
- Assess customer count, average rating, and satisfaction distribution.
- Identify customer rating patterns and impact on brand reputation.
- Correlate delivery performance with customer satisfaction metrics.

### 📦 Delivery & Logistics Performance
- Quantify average delivery time and on-time delivery percentage.
- Identify geographic and seller-specific delivery performance gaps.
- Assess delivery delay patterns and root causes.

### 🏪 Seller Economics & Performance
- Identify top sellers by revenue and order volume.
- Quantify seller revenue concentration and churn patterns.
- Assess seller-specific performance and profitability indicators.

### 📊 Product Category Analysis
- Identify top-performing categories by revenue and order count.
- Assess product pricing, freight costs, and profitability relationships.
- Evaluate category-specific customer satisfaction and performance.

### 💳 Payment & Transaction Optimization
- Quantify payment method distribution and customer preferences.
- Identify payment method reliability and success rates.
- Assess credit card concentration and diversification opportunities.

---

## 📋 Dataset & Data Model

**Core Dataset:**

| Dimension | Volume | Business Meaning |
|-----------|--------|------------------|
| **Total Orders** | 99,000 | Complete order transactions across marketplace |
| **Total Revenue** | 14.21M | Aggregate order value across all transactions |
| **Active Sellers** | 3,000+ | Unique seller accounts with order activity |
| **Products** | 33,000+ | Unique product SKUs across categories |
| **Product Categories** | 14+ | Major product classification groups |
| **Geographic Coverage** | Multi-State (Brazil) | São Paulo (SP), Rio (RJ), Minas Gerais (MG), and 10+ other states |
| **Customer Base** | 98,000+ | Unique customers with order history |

**Key Data Attributes:**
```
Order Dimensions:
├── Temporal: Order Date, Delivery Date, Purchase Timeline
├── Transaction: Order ID, Order Value, Average Order Value (AOV)
├── Customer: Customer ID, Rating (1-5 stars), Delivery Satisfaction
├── Product: Product Category, Price, Freight Cost, Weight
├── Seller: Seller ID, Seller State, Seller Performance Rating
├── Logistics: Delivery Status, Delivery Days, On-Time Delivery %
├── Payment: Payment Type, Transaction Success, Payment Method
└── Performance: Cancellation Rate, Review Score Distribution
```

---

## 📊 Data Quality & Validation

Rigorous data validation was performed before any business analysis:

**Structural Integrity**
- Order count verification: 99,000 records (confirmed)
- Seller count verification: 3,000+ unique sellers (confirmed)
- Product count verification: 33,000+ unique products (confirmed)
- Duplicate detection: 0 duplicate order IDs identified
- Foreign key validation: 100% referential integrity between orders, customers, sellers, and products

**Data Type Consistency**
- Order dates: Valid datetime format across all records
- Numeric fields: Correctly cast to float64/int64 (prices, values, ratings)
- Categorical fields: Properly standardized (payment types, order status, product categories)
- All order records parsed successfully with 0 type conversion errors

**Missing Value Analysis**
- **Critical Missing Values:** 0 (no NULL values in core transaction columns)
- **Business Impact:** 100% data completeness for revenue and order analysis
- All transactional, customer, and product dimensions: 100% complete

**Value Range Validation**
- **Orders:** 99,000 records (all valid transaction IDs) ✓
- **Average Order Value:** $172.69 (reasonable marketplace average) ✓
- **Total Revenue:** $14.21M (economically consistent) ✓
- **Ratings:** 4.03 average (strong customer satisfaction signal) ✓
- **Delivery Days:** 12.42 average (operationally reasonable timeframe) ✓
- **On-Time Delivery:** 93.23% (strong delivery reliability) ✓
- **Payment Methods:** All valid payment types (credit card, boleto, voucher, debit card) ✓

**Categorical Value Verification**
- **Order Status:** Valid categories (Delivered, Shipped, Canceled, Invoiced, Processing) ✓
- **Payment Types:** Valid categories (credit_card, boleto, voucher, debit_card) with credit card dominance ✓
- **Product Categories:** 14+ major categories (health_beauty, watches_gifts, bed_bath_table, etc.) ✓
- **Geographic Region:** Valid Brazilian states with consistent formatting ✓

**Result:** Dataset passed structural, integrity, range, and consistency validation with no critical issues identified. High data quality enables robust business analysis and strategic decision-making.

---

## 🔍 SQL Analysis

Comprehensive SQL analysis organized across multiple layers of business inquiry:

### 1. **Data Preparation** (`01_data_preparation.sql`)
- Created normalized schema for marketplace data
- Established relationships between orders, customers, sellers, and products
- Loaded 99,000+ order records with 3,000+ sellers and 33,000+ products
- Validated successful data ingestion via row counts and dimension verification

### 2. **Business Analysis** (`02_business_analysis.sql`)
Explored core business dimensions:
- **Sales Health:** Total revenue, average order value, sales trends by category and time period
- **Customer Performance:** Customer count, rating distribution, satisfaction trends by category
- **Delivery Operations:** Average delivery time, on-time delivery rates, delivery delays by geography and seller
- **Seller Analysis:** Top sellers by revenue, seller concentration, revenue distribution patterns
- **Product Category:** Category revenue contribution, order volume by category, price vs. freight analysis
- **Payment Optimization:** Payment method distribution, transaction success rates, payment method preferences
- **Geographic Performance:** Regional revenue contribution, state-level performance metrics

**SQL Techniques Used:** CTEs, CASE statements, window functions (SUM OVER, RANK OVER), aggregations, JOINs, date truncation, revenue calculations, rating analysis

---

## 🐍 Python Analysis

Python notebooks provide exploratory data analysis and business validation:

### `01_Olist_Data_Connection_Cleaning_Validation.ipynb`
- Loaded and profiled 99,000+ order records with comprehensive dimensions
- Validated data types: Converted dates to datetime format, standardized text fields
- Confirmed 0 critical NULL values across transaction and customer dimensions
- Verified categorical values: Order status, payment types, product categories, geographic regions
- Validated numeric ranges: All values within business boundaries
- Confirmed 0 duplicate order IDs and referential integrity across all relationships
- Generated comprehensive data quality report: 100% data integrity confirmed

**Libraries Used:** pandas, numpy, SQLAlchemy, python-dotenv, matplotlib, seaborn

### `02_Olist_Business_Analysis.ipynb`
- Exploratory data analysis across all marketplace dimensions
- Seller performance benchmarking and revenue analysis
- Customer satisfaction distribution and rating pattern discovery
- Product category performance and profitability assessment
- Delivery performance analysis by geography and seller
- Payment method distribution and concentration analysis
- Revenue decomposition by multiple dimensions
- Visualizations: distributions, correlations, trend analysis, outlier detection
- Export results for Power BI integration

**Analytical Focus:** Business validation, pattern discovery, outlier detection, correlation analysis, opportunity identification

---

## 📈 Power BI Dashboard

**Comprehensive Interactive Dashboard** providing business intelligence across the entire e-commerce ecosystem:

### **Page 1: Executive Overview** 
![Executive Overview Dashboard](Images/1.png)

*Marketplace Performance at a Glance*
- **Total Orders:** 99,000 order transactions
- **Average Order Value:** $172.69
- **Total Revenue:** $14.21M
- **Average Customer Rating:** 4.03/5.0
- **Revenue Trend:** Early spike followed by stabilization with moderate May-June fluctuations
- Monthly sales patterns show seasonal consistency with opportunity for growth optimization
- Key KPIs: Orders processed, revenue performance, customer satisfaction at executive level

**Enablement:** Quick assessment of overall marketplace health, revenue performance, and customer satisfaction baseline for executive briefing.

---

### **Page 2: Sales & Revenue Analysis** 
![Sales Analysis Dashboard](Images/2.png)

*Rolling 30-Day Performance & Revenue Trends*
- **30-Day Rolling Revenue:** $720.68K with +8.82% growth to goal of $662.28K
- **Average Order Value (Daily):** $144.01
- **Late Delivery Rate:** 6.77% (identification of service gaps)
- **Positive Customer Reviews:** 75.48% (strong satisfaction indicator)
- **Cancellation Rate:** 0.47% (excellent fulfillment performance)
- **Revenue by Seller State:** São Paulo dominance at $9.1M, followed by PR, MG, RJ, RS, SC
- **Revenue Per City:** São Paulo leads at $1.9M with top 10 cities driving bulk of marketplace activity
- **Payment Method Distribution:** Credit card dominance (>75%), boleto and voucher alternatives available
- **Order Status Breakdown:** 96K delivered (97.78%), 1K shipped, minimal cancellations indicating strong fulfillment

**Enablement:** Monitor sales momentum, identify state-level growth opportunities, assess payment method effectiveness, and track fulfillment reliability in real-time.

---

### **Page 3: Product Category Performance** 
![Category Performance Dashboard](Images/3.png)

*Category-Level Revenue & Customer Satisfaction Analysis*
- **Average Product Price:** $120.82
- **Active Sellers:** 3,000+
- **Product Count:** 33,000+
- **Freight Cost % of Revenue:** 16.59% (material cost component)
- **Average Customer Rating:** 4.03/5.0
- **Top Revenue Categories:**
  - Health & Beauty: $12.97M (12.9% of total) - AOV $146.84
  - Watches & Gifts: $12.53M (12.5%) - AOV $222.82
  - Bed, Bath & Table: $10.93M (10.9%) - AOV $116.02
  - Sports & Leisure: $10.24M (10.2%) - AOV $132.64
  - Computers & Accessories: $9.42M (9.4%) - AOV $140.87
- **Seller Revenue Concentration:** Top 10 sellers represent significant revenue concentration risk
- **Category Rating Consistency:** All major categories maintain 3.8-4.2 average rating
- **Freight Cost Dynamics:** Not directly proportional to product price; premium products have lower freight % impact

**Enablement:** Identify high-performing categories, optimize pricing strategy, manage seller concentration risk, assess freight cost efficiency by category.

---

### **Page 4: Customer & Delivery Experience** 
![Delivery Experience Dashboard](Images/4.png)

*On-Time Performance & Regional Analysis*
- **Average Delivery Days:** 12.42 days
- **Delivery Delay Ahead of Schedule:** -11.88 days (positive indicator of efficiency)
- **On-Time Delivery Rate:** 93.23% (excellent service level)
- **Average Customer Rating:** 4.03/5.0
- **State Performance Comparison:**
  - **São Paulo:** 41,375 orders, $54.48M revenue, 4.13 rating, 8.68 avg delivery days, 95.51% on-time
  - **Rio:** 12,762 orders, $19.13M revenue, 3.82 rating, 15.15 delivery days, 87.89% on-time
  - **Minas Gerais:** 11,544 orders, $16.39M revenue, 4.08 rating, 11.90 delivery days, 95.43% on-time
- **Review Score Distribution:** Strong satisfaction with majority 5-star ratings; 1-star reviews need attention
- **Geographic Variance:** São Paulo shows superior delivery performance and higher customer satisfaction
- **Delivery Delay Trend:** Significant improvement over time with average delivery days declining steadily

**Enablement:** Monitor delivery reliability, identify geographic service gaps, optimize fulfillment operations by region, assess customer satisfaction drivers.

---

### **Page 5: Seller Performance & Market Dynamics** 
![Seller Performance Dashboard](Images/5.png)

*Top Sellers & Market Concentration Analysis*
- **Top Seller Revenue:** ~R$245K revenue
- **Revenue Decline Pattern:** Steep revenue drop-off from top to lower-ranked sellers
- **Revenue Concentration:** Top 10 sellers represent significant marketplace value concentration
- **Seller-Rating Correlation:** Higher-revenue sellers maintain strong ratings (3.9-4.1+ range)
- **Top 10 Sellers by Revenue:** 245K, 238K, 213K, 204K, 198K, 183K, 169K, 150K, 142K (declining pattern)
- **Revenue Concentration Analysis:** Top sellers create retention risk and growth limitation
- **Active Seller Count:** 3,000+ sellers providing competitive marketplace environment
- **Geographic Distribution:** Sellers concentrated in major metropolitan areas (São Paulo dominance)

**Key Insights:**
- Top seller generates ~R$245K with steady revenue decline across remaining sellers
- Revenue dependency risk requires proactive retention programs for top performers
- Mid-tier seller development opportunity for diversification and growth

**Enablement:** Manage seller relationships, identify retention priorities, assess market concentration risk, develop mid-tier seller support programs.

---

## 🎯 Key Business Findings

### 🛍️ **Sales & Revenue Insights**

**Strong Revenue Foundation with Geographic Concentration**
- Total revenue of $14.21M across 99,000 orders demonstrates substantial marketplace activity
- Average order value of $172.69 indicates reasonable transaction size with growth potential
- São Paulo represents 41.76% of total orders creating geographic concentration risk
- Revenue growth trajectory shows stabilization post-peak with moderate May-June volatility

**Finding:** Revenue base is healthy but geographically concentrated. Expand seller and customer acquisition in secondary markets (Rio, Minas Gerais).

---

### 👥 **Customer Satisfaction Insights**

**Strong Average Rating with Improvement Opportunity**
- Average customer rating of 4.03/5.0 indicates strong marketplace satisfaction
- 75.48% positive reviews (5-star ratings) demonstrates high customer advocacy
- Cancellation rate of only 0.47% shows excellent fulfillment execution
- Rating distribution shows concentration of high scores with small 1-star population requiring attention

**Finding:** Customer satisfaction is strong overall. Investigate 1-star reviews for root causes and targeted improvement. Potential drivers include delivery delays in specific regions or seller-specific issues.

---

### 📦 **Delivery Performance Insights**

**Exceptional On-Time Delivery with Regional Variance**
- On-time delivery rate of 93.23% exceeds industry standards
- Average delivery time of 12.42 days is reasonable for multi-seller, multi-geography operations
- Delivery is ahead of expected timeline by 11.88 days on average (strong operational efficiency)
- Geographic variance is significant:
  - São Paulo: 95.51% on-time, 8.68 days (superior performance)
  - Rio: 87.89% on-time, 15.15 days (gap requiring attention)
  - Minas Gerais: 95.43% on-time, 11.90 days (strong performance)

**Finding:** Delivery operations are strong overall. Rio shows underperformance. Regional logistics optimization could improve secondary market ratings.

---

### 🏪 **Seller Performance Insights**

**High Concentration Risk with Strong Top-Performer Engagement**
- Top seller generates ~R$245K with steep revenue drop-off for remaining sellers
- Top 10 sellers represent disproportionate share of marketplace value
- Revenue concentration creates business risk if top sellers redirect to competitors
- All top sellers maintain 3.9+ ratings despite high volume indicating operational excellence

**Finding:** Seller concentration creates retention risk. Develop mid-tier seller support programs and recruit new high-performers as strategic priorities.

---

### 📊 **Product Category Insights**

**Balanced Portfolio with Leadership Categories**
- Health & Beauty and Watches & Gifts lead revenue at 12.9% and 12.5% respectively
- Top 5 categories represent approximately 50% of total marketplace revenue
- Average order value varies significantly by category ($116-$222 range):
  - Watches & Gifts highest AOV ($222.82) - premium positioning opportunity
  - Health & Beauty moderate AOV ($146.84) - volume driver
  - Bed/Bath moderate AOV ($116.02) - volume driver
- Freight cost averages 16.59% of revenue with category variance
- Customer ratings consistent across categories (3.8-4.2 range) suggesting consistent quality standards

**Finding:** Portfolio is balanced with clear revenue drivers. Expand premium categories (Watches & Gifts) and optimize freight costs for lower-margin categories.

---

### 💳 **Payment Method Insights**

**High Credit Card Concentration with Diversification Need**
- Credit card dominates payment method distribution at >75% of all transactions
- Boleto (installment payment) represents secondary option with lower volume
- Voucher and debit card represent minimal transaction volume
- Payment concentration creates cost and operational risk through processing fees and processor dependency

**Finding:** Payment method concentration in credit cards creates cost and operational risk. Promote boleto and other payment methods to reduce processing costs and serve customer preferences.

---

## 📌 Strategic Recommendations

### **🔴 High Priority** — Revenue Growth & Risk Mitigation

| Finding | Business Implication | Recommended Action |
|---------|----------------------|-------------------|
| Geographic revenue concentration: São Paulo = 41.76% of orders | Market risk if São Paulo growth saturates | Launch regional expansion program targeting Rio, Brasília, emerging cities with seller recruitment |
| Top 10 sellers represent significant revenue concentration | Business dependency risk; seller churn would impact revenue | Implement seller retention program with dedicated account management and performance incentives |
| Rio underperformance: 87.89% on-time vs. 95.51% São Paulo | Delivery delays create negative ratings and reduce repeat purchases | Audit Rio logistics partner; negotiate improved SLAs; consider alternative fulfillment partners |
| Credit card payment concentration >75% | High processing fees; payment processor dependency risk | Promote boleto and alternative payment methods with customer incentives; negotiate reduced credit card fees |

### **🟡 Medium Priority** — Efficiency & Growth

| Finding | Business Implication | Recommended Action |
|---------|----------------------|-------------------|
| Watches & Gifts category: Highest AOV ($222.82) | Premium category with strong customer demand | Expand Watches & Gifts through vendor recruitment; develop premium product marketing |
| Freight costs: 16.59% of revenue with category variance | Material cost component affecting profitability | Analyze freight by category; negotiate volume discounts; implement weight-based pricing optimization |
| Mid-tier seller underperformance relative to top 10 | Opportunity to develop seller tier through support | Create mid-tier seller development program with training, marketing co-op, performance bonuses |
| 1-star reviews represent customer dissatisfaction | High-impact brand damage from negative word-of-mouth | Implement customer service program to address 1-star reviews; identify common complaints |

### **🟢 Low Priority** — Incremental Optimization

| Finding | Business Implication | Recommended Action |
|---------|----------------------|-------------------|
| Cancellation rate: 0.47% (exceptionally low) | Strong fulfillment execution; limited improvement need | Maintain current fulfillment standards; benchmark against industry |
| Delivery ahead of schedule: -11.88 days average | Strong operational efficiency | Manage customer expectations by stating delivery in business days to improve satisfaction |
| Product portfolio diversity: 33,000+ SKUs | Broad selection reduces supplier dependency | Periodically audit slow-moving SKUs; promote high-performing products within each category |

---

## 📊 Project Workflow

```
Raw Order Data (99,000+ transactions)
    ↓
Data Validation & Cleaning (0 critical issues found)
    ↓
SQL Data Modeling & Preparation
├─ Order-Customer relationships
├─ Seller-Product-Category hierarchy
├─ Payment and delivery tracking
└─ Geographic and temporal dimensions
    ↓
SQL Business Analysis
├─ Sales Performance Analysis
├─ Customer Satisfaction Analysis
├─ Delivery Operations Analysis
├─ Seller Economics Analysis
├─ Product Category Performance
└─ Payment Method Optimization
    ↓
Python Exploratory Data Analysis
├─ Pattern Discovery
├─ Correlation Analysis
├─ Outlier Detection
└─ Business Validation
    ↓
Power BI Data Modeling & Visualization
├─ Executive Overview Dashboard
├─ Sales & Revenue Dashboard
├─ Product Category Analysis
├─ Customer & Delivery Experience
└─ Seller Performance Analysis
    ↓
Root Cause Decomposition
└─ Multi-dimensional Problem Drilling
    ↓
Business Insights & Strategic Recommendations
```

---

## 🛠️ Tools & Technologies

| Category | Technology |
|----------|-----------|
| **Database** | SQL (data modeling, schema design, complex joins, aggregations) |
| **Data Validation** | SQL & Python (comprehensive data quality checks) |
| **Data Analysis** | Python 3.x (pandas, numpy for exploratory analysis) |
| **Visualization** | Power BI (multi-page dashboards, interactive filters, drill-through analysis) |
| **Connection** | SQLAlchemy (Python ↔ Database integration) |
| **Environment** | Python virtual environment, .env configuration |

---

## 📁 Repository Structure

```
Olist/
├── DataSet/
│   └── olist_complete_dataset.csv          (99,000+ order records)
│
├── SQL Analysis/
│   ├── 01_data_preparation.sql             (Schema creation & data import)
│   └── 02_business_analysis.sql            (Core business queries)
│
├── Python/
│   ├── 01_Olist_Data_Connection_Cleaning_Validation.ipynb
│   └── 02_Olist_Business_Analysis.ipynb
│
├── DashBoard/
│   ├── 1.png                               (Executive Overview)
│   ├── 2.png                               (Sales & Revenue Analysis)
│   ├── 3.png                               (Category Performance)
│   ├── 4.png                               (Delivery Experience)
│   ├── 5.png                               (Seller Performance)
│   └── Olist Executive Dashboard.pdf       (Full dashboard PDF export)
│
└── README.md                                (This file)
```

---

## 🎓 Key Analytical Techniques Demonstrated

**SQL Mastery**
- Complex JOINs across order, customer, seller, and product dimensions
- CTEs for hierarchical analysis and multi-level aggregations
- Window functions for ranking and regional comparisons
- CASE statements for conditional business logic
- Aggregate functions with GROUP BY for revenue analysis
- Date/time analysis with temporal decomposition
- Geographic analysis with state and city-level aggregations
- Revenue calculations and concentration analysis

**Data Quality Rigor**
- Comprehensive validation framework (completeness, consistency, validity)
- Referential integrity verification across orders, customers, sellers, products
- Categorical value standardization and validation
- Numeric range validation against business rules
- Duplicate detection and reconciliation
- NULL value handling and impact assessment

**Business Intelligence**
- Multi-dimensional business analysis (sales, customer, seller, product, geography, payment)
- Cross-domain correlation analysis (delivery ↔ ratings, category ↔ AOV, region ↔ performance)
- Revenue concentration and market risk analysis
- Root cause decomposition enabling targeted problem-solving
- Financial impact quantification (revenue by dimension, freight cost analysis)
- Actionable insights with clear business implications

**Python Data Analysis**
- Database connectivity and data extraction at scale (99,000+ records)
- Data integrity validation in Python with comprehensive profiling
- Exploratory analysis and pattern discovery
- Business logic validation through multiple analytical lenses

**Executive Communication**
- Dashboard design focused on decision-maker needs
- Clear visualization hierarchy (executives → detail)
- Findings connected to business impact, not just metrics
- Recommendations prioritized by revenue and operational significance

---

**Project Completed:** September 2026  
**Repository:** [Olist-E-Commerce-Analytics](https://github.com/sahilrege9673/Olist)  
**Dataset:** 99,000+ order records spanning full e-commerce marketplace operations
