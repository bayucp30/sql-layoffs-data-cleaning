-- =========================
-- RAW TABLE SCHEMA
-- =========================

CREATE TABLE layoffs2026 (
    company TEXT,
    location TEXT,
    industry TEXT,
    total_laid_off TEXT,
    percentage_laid_off TEXT,
    date TEXT,
    stage TEXT,
    country TEXT,
    funds_raised TEXT
);

-- =========================
-- STAGING TABLE
-- (Created using LIKE in your script)
-- =========================

CREATE TABLE layoffs2026_staging LIKE layoffs2026;

-- =========================
-- FINAL CLEAN TABLE
-- (After data type conversion & deduplication)
-- =========================

CREATE TABLE layoffs2026_clean (
    company TEXT,
    location TEXT,
    industry TEXT,
    total_laid_off INT,
    percentage_laid_off DECIMAL(5,2),
    date DATE,
    stage TEXT,
    country TEXT,
    funds_raised_millions INT
);
