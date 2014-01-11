	SELECT salesCompany.companyName as 'Company Name', salesCompanyDomestic.state as 'State', phoneNumber as 'Phone', 
commissionRate as 'Commission Rate'
From salesCompany join salesCompanyDomestic
on salesCompany.companyId = salesCompanyDomestic.companyId
Where commissionRate > (SELECT commissionRate
FROM salesCompanyDomestic
 WHERE salesCompanyDomestic.companyId 
= '111')

Order by commissionRate desc
