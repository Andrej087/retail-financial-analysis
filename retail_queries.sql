USE retail;
-- Check: all rows in the table
SELECT * FROM financials;

-- Operating margin by company and year
SELECT ticker, fiscal_year,
       CAST(100.0 * operating_income / revenue AS DECIMAL(5,1)) AS operating_margin_pct
FROM financials
ORDER BY fiscal_year DESC, operating_margin_pct DESC;

-- Year-over-year revenue growth
SELECT ticker, fiscal_year, revenue,
       CAST(100.0 * (revenue - LAG(revenue) OVER (PARTITION BY ticker ORDER BY fiscal_year))
            / LAG(revenue) OVER (PARTITION BY ticker ORDER BY fiscal_year) AS DECIMAL(5,1)) AS growth_pct
FROM financials
ORDER BY ticker, fiscal_year;

-- Net margin by company and year
SELECT ticker, fiscal_year,
       CAST(100.0 * net_income / revenue AS DECIMAL(5,1)) AS net_margin_pct
FROM financials
ORDER BY fiscal_year DESC, net_margin_pct DESC;

-- Operating margin ranking within each year (1 = highest)
SELECT fiscal_year, ticker,
       CAST(100.0 * operating_income / revenue AS DECIMAL(5,1)) AS operating_margin_pct,
       RANK() OVER (PARTITION BY fiscal_year
                    ORDER BY 1.0 * operating_income / revenue DESC) AS margin_rank
FROM financials
ORDER BY fiscal_year DESC, margin_rank;