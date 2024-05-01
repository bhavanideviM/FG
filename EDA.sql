-- Exploratory Data Analysis

select *
from layoffs_staging2;

select max(total_laid_off),max(percentage_laid_off)
from layoffs_staging2;

select *
from layoffs_staging2
where percentage_laid_off = 1
order by total_laid_off desc ;

select company, SUM(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select min(`date`) , max(`date`)
from layoffs_staging2;

select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;

select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;

select `date`, sum(total_laid_off)
from layoffs_staging2
group by `date`
order by 1 desc;

select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc;

select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;

select company, AVG(percentage_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select substring(`date`, 6,2) as `Month`,sum(total_laid_off) 
from layoffs_staging2
group by month
order by 1 asc;

select substring(`date`, 6,2) as `Month`,sum(total_laid_off) 
from layoffs_staging2
where substring(`date`, 6,2) is not null
group by month
order by 1 asc;



