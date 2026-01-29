-- creating staging table 
CREATE TABLE layoffs2026_staging LIKE layoffs2026;

INSERT layoffs2026_staging
SELECT * FROM layoffs2026;

-- Standardizing Data
UPDATE layoffs2026_staging
SET company = TRIM(company);

-- Change date format
UPDATE layoffs2026_staging
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs2026_staging
MODIFY COLUMN `date` DATE;

-- Change format to int
ALTER TABLE layoffs2026_staging
MODIFY total_laid_off INT,
MODIFY funds_raised INT;

-- Converting empty strings to NULL
UPDATE layoffs2026_staging
SET
  company             = NULLIF(TRIM(company), ''),
  location            = NULLIF(TRIM(location), ''),
  industry            = NULLIF(TRIM(industry), ''),
  total_laid_off      = NULLIF(total_laid_off, ''),
  percentage_laid_off= NULLIF(TRIM(percentage_laid_off), ''),
  date                = NULLIF(date, ''),
  stage               = NULLIF(TRIM(stage), ''),
  country             = NULLIF(TRIM(country), ''),
  funds_raised        = NULLIF(funds_raised, '');

-- Convert percentage to DECIMAL
ALTER TABLE layoffs2026_staging
MODIFY COLUMN percentage_laid_off DECIMAL(5,2);

-- Filling Missing Values Using Self Join
UPDATE layoffs2026_staging t1
JOIN layoffs2026_staging t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

-- Deleting unnecessary values
DELETE FROM layoffs2026_staging
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

-- Remove duplicates
CREATE TABLE layoffs2026_clean AS
SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY company, location, industry, 
                     total_laid_off, percentage_laid_off, 
                     `date`, stage, country, funds_raised
    ) AS row_num
    FROM layoffs2026_staging
) t
WHERE row_num = 1;
