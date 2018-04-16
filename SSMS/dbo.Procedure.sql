USE [SSMS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[INSERT_CATEGORY] (
	@category_id int = 5,
	@category_name varchar(100),
	@category_description varchar(500)
)
AS
INSERT INTO category (category_id, category_name, category_description) VALUES (@category_id, @category_name, @category_description)
GO

CREATE PROCEDURE [dbo].[INSERT_CUSTOMER] (
	@customer_id int = 5,
	@name varchar(100),
	@address varchar(100),
	@contact_no varchar(15),
	@email varchar(50),
	@user_id int = 5
)
AS
INSERT INTO customer_details (customer_id, name, address, contact_no, email, user_id) VALUES (@customer_id, @name, @address, @contact_no, @email, @user_id)
GO

CREATE PROCEDURE [dbo].[INSERT_SUPPLIER] (
	@supplier_id int = 5,
	@supplier_name varchar(100),
	@contact_no varchar(15),
	@email varchar(50),
	@address varchar(100),
	@url varchar(100),
	@personal_no varchar(15),
	@user_id int = 5
)
AS
INSERT INTO suppliers (supplier_id, supplier_name, contact_no, email, address, url, personal_no, user_id) VALUES (@supplier_id, @supplier_id, @contact_no, @email, @address, @url, @personal_no, @user_id)
GO

CREATE PROCEDURE [dbo].[INSERT_PRODUCT] (
	@product_id int = 5,
	@item_name varchar(100),
	@item_code varchar(10),
	@description varchar(500),
	@price varchar(100),
	@purchase_date date,
	@category_id int = 5,
	@supplier_id int = 5,
	@user_id int = 5
)
AS
INSERT INTO product_details (product_id, item_name, item_code, description, price, purchase_date, category_id, supplier_id, user_id) VALUES (@product_id, @item_name, @item_code, @description, @price, @purchase_date, @category_id, @supplier_id, @user_id)
GO


