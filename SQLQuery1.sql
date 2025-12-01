

select * from Color
select * from Command
select * from Product 
where 1 = 1 and Brand_id = 1 
			and FinalPrice > 10000000
			and ScreenSize between 10 and 20 
order by FinalPrice asc 
select top 5 * from Product where Brand_id = 1 order by FinalPrice desc
select * from Product_Color order by image
select COUNT(ProductID) as Number from Product
select * from Brand
