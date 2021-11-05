Select *
From co2andgdp..CO2
order by 2,3

--Select *
--From co2andgdp..GDP
--Order by 2,3

Select Country, year, co2, co2_per_capita, co2_per_unit_energy
From co2andgdp..CO2
order by 2,3

-- CO2 vs CO2 from OIL
-- This shows the percentage of CO2 emissions that are from oil over time

Select Country, year, co2, oil_co2, (oil_co2/co2)*100 as percentemissionsfromoil
From co2andgdp..CO2
Where oil_co2>0 and co2>0 and Country like '%states%'
order by 1,2

--Shows Countries with the highest percent of emissions from oil

Select Country, year, co2, max(oil_co2) as Emissionsfromco2, max((oil_co2/co2))*100 as percentemissionsfromoil
From co2andgdp..CO2
Where Year=2018
Group by Country, co2, year
Order by percentemissionsfromoil desc

--Shows countries with the highest actual emissions of co2 from Oil

Select Country, year, co2, max(oil_co2) as Emissionsfromco2, max((oil_co2/co2))*100 as percentemissionsfromoil
From co2andgdp..CO2
Where Year=2018
Group by Country, co2, year
Order by Emissionsfromco2 desc

--This shows the percentage 1 person makes up of the national co2 emissions from the highest to lowest

Select co2.country, co2.year, population, co2, oil_co2, (oil_co2/co2)*100 as percentemissionsfromoil, (co2/population)*100 as percentco2perperson
From co2andgdp..CO2 co2
Join co2andgdp..GDP gdp
 on co2.country = gdp.country
 and co2.year = gdp.year
 Where co2.year = 2018
 and gdp.population is not null 
 Order by percentco2perperson desc 

 -- CO2 data set, https://github.com/owid/co2-data (accessed on 11/02)








