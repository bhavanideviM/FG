-- Data Cleaning


SELECT *
FROM layoffs_staging;

-- 1 Remove Duplicates
-- 2 standardise the Data
-- 3 Null Values or Blank Values
-- 4 Remove any Unnecessary columns


WITH duplicate_cte AS
(
SELECT *,
Row_Number() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
From layoffs_staging
)
select *
FROM duplicate_cte 
where row_num >1;

CREATE Table Layoffs_staging
like layoffs;

INSERT Layoffs_staging
SELECT *
FROM layoffs

select * 
from layoffs_staging
where company='casper';


WITH duplicate_cte AS
(
SELECT *,
Row_Number() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
From layoffs_staging
)
DELETE
FROM duplicate_cte 
where row_num >1;

drop table layoffs_staging2;

 CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2
where row_num>1;

INSERT into layoffs_staging2
SELECT *,
Row_Number() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
From layoffs_staging;



WITH duplicate_cte AS
(
SELECT *,
Row_Number() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
From layoffs_staging2
)
Delete
from layoffs_staging2
where row_num>1;



select *
from layoffs_staging2
where row_num>1;

-- Standardizig data

select company, TRIM(company)
from layoffs_staging2;

update layoffs_staging2
set company=TRIM(company);



