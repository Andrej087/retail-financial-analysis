# US Big-Box Retailers: A Five-Year Financial Comparison

A beginner finance project comparing **Walmart (WMT), Target (TGT), Costco (COST) and Home Depot (HD)** using their annual reports (10-K filings) from the SEC's EDGAR database. I entered the numbers by hand, checked them against the filings, loaded them into a SQL Server database and used SQL to compare growth and profitability across five fiscal years (20 company-year rows).

*This is a learning exercise, not investment advice.*

## What I did

1. Read the income statement in each company's 10-K filings (three years per filing, so I used older filings to reach back to 2022).
2. Recorded revenue, operating income and net income for each fiscal year in Excel, in millions of US dollars.
3. Checked every value against the filing. Where two filings overlapped, I confirmed the numbers matched.
4. Imported the data into SQL Server and wrote queries for margins, growth and rankings (`retail_queries.sql`).

Data: `retail_financials.csv`. Net income is the amount attributable to the company's shareholders. `fiscal_year` is the calendar year in which the fiscal year ends, and `fiscal_year_end` holds the exact date.

## Results

**Operating margin (operating income / revenue, %)**

| | 2022 | 2023 | 2024 | 2025 | 2026 |
|---|---|---|---|---|---|
| Home Depot | 15.2 | 15.3 | 14.2 | 13.5 | 12.7 |
| Target | 8.4 | 3.5 | 5.3 | 5.2 | 4.9 |
| Walmart | 4.5 | 3.3 | 4.2 | 4.3 | 4.2 |
| Costco | 3.4 | 3.3 | 3.6 | 3.8 | 3.9 |

**Revenue growth vs. prior year (%)**

| | 2023 | 2024 | 2025 | 2026 |
|---|---|---|---|---|
| Walmart | 6.7 | 6.0 | 5.1 | 4.7 |
| Costco | 6.8 | 5.0 | 8.2 | 10.1 |
| Home Depot | 4.1 | -3.0 | 4.5 | 3.2 |
| Target | 2.9 | -1.6 | -0.8 | -1.7 |

**Net margin (net income / revenue, %)**

| | 2022 | 2023 | 2024 | 2025 | 2026 |
|---|---|---|---|---|---|
| Home Depot | 10.9 | 10.9 | 9.9 | 9.3 | 8.6 |
| Target | 6.6 | 2.5 | 3.9 | 3.8 | 3.5 |
| Walmart | 2.4 | 1.9 | 2.4 | 2.9 | 3.1 |
| Costco | 2.6 | 2.6 | 2.9 | 2.9 | 3.0 |

## What I found

- **Home Depot had the highest margin every year,** but it has fallen each year since 2023 (15.3% to 12.7%).
- **Target was the most volatile.** Its operating margin dropped from 8.4% in 2022 to 3.5% in 2023, partly recovered to 5.3%, then drifted down again. Its revenue also fell in each of the last three years.
- **Walmart and Costco are close on operating margin.** In 2023 they were almost tied (Costco narrowly ahead). Since then Costco has improved every year while Walmart has stayed around 4.2-4.3%.
- **Costco grew fastest in 2025 and 2026** (8.2% and 10.1%). Its membership fees (about $5.9 billion in 2026) equal roughly half of its operating income (about $11.7 billion), so a large part of its profit comes from fees and not from selling goods.
- **Walmart's net margin rose from 2.4% in 2024 to 3.1% in 2026 while its operating margin stayed flat.** The "other (gains) and losses" line moved from a $3.0 billion loss in 2024 to a $2.1 billion gain in 2026. That swing accounts for about two-thirds of the increase in its pre-tax income, so part of the improvement came from non-store items.
- **2023 was a weak year for Walmart and Target:** both operating margins fell (Walmart from 4.5% to 3.3%, Target from 8.4% to 3.5%), while Costco and Home Depot barely moved.

## Limits of this analysis

- **Home Depot is a different business** (home improvement), so its higher margins don't mean it is run better than the grocery-heavy retailers.
- **Fiscal years don't line up.** Walmart, Target and Home Depot end around January 31, but Costco's year ends in late August or early September, about seven months later.
- **Three companies have a 53-week year,** which inflates that year's revenue by roughly 2% and distorts growth for that year and the next: Costco (2023 row), Target (2024 row) and Home Depot (2025 row). I didn't adjust for this.
- **Naming differs.** Companies label the same lines and years differently (for example "net earnings" vs. "net income", or "fiscal 2025" for the year ending January 2026), so I matched each line by hand.
- **Five years is still a short window,** and the data shows what happened, not why. Explaining the trends would mean reading the management discussion in each 10-K.

## Next steps

- Add the balance sheet (cash and debt) to compare how much each company owes.
- Read each company's explanation of its margin changes, especially Target's 2023 drop.
- Adjust for the 53-week years.
- Learn enough Python to pull the data from the SEC's API automatically.

## Files

- `retail_financials.csv`: the data
- `retail_queries.sql`: the SQL queries
- `README.md`: this summary
