﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SSMS {
    public partial class Stock : System.Web.UI.Page {

        public static string currentUser, currentUserId, userName;

        protected static string connectingStringSSMS = Login.connectingStringSSMS;

        protected void Page_Load(object sender, EventArgs e) {

            if (Session["Name"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                currentUser = Session["Full_Name"].ToString();
                userName = Session["User_Name"].ToString();
                currentUserId = Session["User_Id"].ToString();
                System.Diagnostics.Debug.WriteLine("Supplier Session username: " + Session["Name"].ToString());
            }

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();
                Response.Write("Connected");


                // 1. Command to select all the stock details from the database
                SqlCommand cmdSelectStockDetails = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT stock_id, arrived_quantity, stock_quantity, arrived_date, product_id " +
                                    "FROM stock",
                    CommandType = CommandType.Text
                };


                // 2. Command to select items which are out of stock
                SqlCommand cmdOutOfStockDetails = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT s.stock_id, s.arrived_quantity, s.stock_quantity, s.product_id, s.arrived_date " +
                                    "FROM stock s " +
                                    "WHERE s.stock_quantity < 10 ",
                    CommandType = CommandType.Text
                };


                // 3. Command to select all the unsold stock details in last 31 days from the database
                SqlCommand cmdUnsoldStockDetails = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT s.stock_id, s.arrived_quantity, s.stock_quantity, s.product_id, s.arrived_date " +
                                    "FROM stock s " +
                                    "WHERE s.product_id " +
                                    "NOT IN " +
                                    "(" +
                                    "SELECT sd.product_id FROM sales_details sd " +
                                    "WHERE sd.billing_date >= GetDate() - 31" +
                                    ")",
                    CommandType = CommandType.Text
                };


                //1. Items table start
                // Read all data from query and append to string builder which will be used to build table row
                SqlDataReader stockDataReader = cmdSelectStockDetails.ExecuteReader();
                StringBuilder stockTable = new StringBuilder();
                while (stockDataReader.Read()) {

                    stockTable.Append("<tr>");
                    stockTable.Append("<td class='color-blue-grey-lighter'>" + stockDataReader.GetValue(0) + "</td>");
                    stockTable.Append("<td>" + GetProductName(connection, stockDataReader.GetValue(4)) + "</td>");
                    stockTable.Append("<td>" + stockDataReader.GetValue(1) + "</td>");
                    stockTable.Append("<td>" + stockDataReader.GetValue(2) + "</td>");
                    stockTable.Append("<td>" + stockDataReader.GetValue(3) + "</td>");
                    stockTable.Append("</tr>");

                }
                stockDataReader.Close();
                StockTablePlaceHolder.Controls.Add(new Literal { Text = stockTable.ToString() }); ;
                // Items table end


                // 2. Items table start for out of stock items
                // Read all data from query and append to string builder which will be used to build table row
                SqlDataReader outOfStockDataReader = cmdOutOfStockDetails.ExecuteReader();
                StringBuilder outOfStockTable = new StringBuilder();
                int countOOS = 1;
                while (outOfStockDataReader.Read()) {

                    outOfStockTable.Append("<tr>");
                    outOfStockTable.Append("<td class='color-blue-grey-lighter'>" + countOOS + "</td>");
                    outOfStockTable.Append("<td>" + GetProductName(connection, outOfStockDataReader.GetValue(3)) + "</td>");
                    outOfStockTable.Append("<td>" + outOfStockDataReader.GetValue(1) + "</td>");
                    outOfStockTable.Append("<td>" + outOfStockDataReader.GetValue(2) + "</td>");
                    outOfStockTable.Append("<td>" + outOfStockDataReader.GetValue(4) + "</td>");
                    outOfStockTable.Append("</tr>");

                    countOOS++;
                }
                outOfStockDataReader.Close();
                OutOfStockTablePlaceholder.Controls.Add(new Literal { Text = outOfStockTable.ToString() }); ;
                // Out of stock table end


                // 3. Items table start for stock items which is not sold in last 31 days
                // Read all data from query and append to string builder which will be used to build table row
                SqlDataReader unsoldStockDataReader = cmdUnsoldStockDetails.ExecuteReader();
                StringBuilder unsoldStockTable = new StringBuilder();
                int count = 1;
                while (unsoldStockDataReader.Read()) {

                    unsoldStockTable.Append("<tr>");
                    unsoldStockTable.Append("<td class='color-blue-grey-lighter'>" + count + "</td>");
                    unsoldStockTable.Append("<td>" + GetProductName(connection, unsoldStockDataReader.GetValue(3)) + "</td>");
                    unsoldStockTable.Append("<td>" + unsoldStockDataReader.GetValue(1) + "</td>");
                    unsoldStockTable.Append("<td>" + unsoldStockDataReader.GetValue(2) + "</td>");
                    unsoldStockTable.Append("<td>" + unsoldStockDataReader.GetValue(4) + "</td>");
                    unsoldStockTable.Append("</tr>");

                    count++;
                }
                unsoldStockDataReader.Close();
                UnsoldStockPlaceholder.Controls.Add(new Literal { Text = unsoldStockTable.ToString() }); ;
                // Unsold stock in last 31 days table end

                connection.Close();
                connection.Dispose();

            } catch (Exception exception) {
                Response.Write("<script>alert(' " + exception.Message + "')</script>");
            }

        }

        [WebMethod]
        public void logOut(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Index Session Logout:");
            HttpContext.Current.Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        [WebMethod]
        public static string ChangePassword(string oldPassword, string newPassword)
        {
            try
            {
                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                SqlCommand cmdVerifyUser = new SqlCommand
                {
                    Connection = connection,
                    CommandText = "SELECT password FROM users WHERE user_name = '" + userName + "' AND password = '" + oldPassword + "'",
                    CommandType = CommandType.Text
                };

                SqlDataReader credentialsReader = cmdVerifyUser.ExecuteReader();
                //return credentialsReader.HasRows.ToString();
                if (credentialsReader.HasRows)
                {
                    SqlCommand changeUserPassword = new SqlCommand
                    {
                        Connection = connection,
                        CommandText = "UPDATE users SET password = '" + newPassword + "' WHERE user_name = '" + userName + "'",
                        CommandType = CommandType.Text
                    };

                    int changePasswordCount = changeUserPassword.ExecuteNonQuery();
                    credentialsReader.Close();
                    connection.Close();
                    connection.Dispose();
                    if (changePasswordCount == 1)
                    {
                        return ("0");
                    }
                    else
                    {
                        return ("2");
                    }
                }
                else
                {
                    return ("1");
                }

            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        // Insert items
        [WebMethod]
        public static string InsertIntoStock(string pId, string quantity, string arrivedDate, string uId) {
        
            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();               

                //int stockQuantity = Convert.ToInt32(quantity) + GetStockQuantity(pId, connection);

                // Change date format form ss/mm/yy to yy/mm/dd
                // Microsoft SQL support yy/mm//dd format
                string[] date = arrivedDate.Split('/');
                string arrDate = date[2] + "/" + date[1] + "/" + date[0];

                // For the purpose of stock primary key auto increment 
                int stockId = 0;
                SqlCommand cmdStockId = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT MAX(stock_id) FROM stock",
                    CommandType = CommandType.Text
                };

                SqlDataReader stockIdReader = cmdStockId.ExecuteReader();
                while (stockIdReader.Read()) {

                    if (stockIdReader.GetValue(0) == DBNull.Value) {
                        stockId = 1;
                    } else {
                        stockId = Convert.ToInt32(stockIdReader.GetValue(0)) + 1;
                    }

                }
                // Remember to close reader as soon as it completes its task. This is important. Otherwise it will throw 
                // "there is already an open datareader associated with this command which must be closed first." error at run time.
                stockIdReader.Close();

                SqlCommand cmdCheckProductExistance = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT stock_id, product_id FROM stock WHERE product_id = " + Convert.ToInt32(pId) + "",
                    CommandType = CommandType.Text
                };

                SqlCommand cmdInsertIntoStock = new SqlCommand {
                    Connection = connection,
                    CommandText = "INSERT INTO stock (stock_id, arrived_quantity, stock_quantity, arrived_date, product_id) " +
                    "VALUES (" + stockId + ", " + Convert.ToInt32(quantity) + ", " + Convert.ToInt32(quantity) + ", '" + arrDate + "', " + Convert.ToInt32(pId) + ")",
                    CommandType = CommandType.Text
                };

                SqlCommand cmdUpdateIntoStock = new SqlCommand {
                    Connection = connection,
                    CommandText = "UPDATE stock SET arrived_quantity = arrived_quantity + " + Convert.ToInt32(quantity) + ", stock_quantity = stock_quantity + " + quantity + ", arrived_date = '"+ arrDate +"' WHERE product_id = "+ Convert.ToInt32(pId) +"",
                    CommandType = CommandType.Text
                };

                SqlCommand cmdInsertIntoStockManager = new SqlCommand {
                    Connection = connection,
                    CommandText = "INSERT INTO stock_manager (user_id, stock_id) " +
                    "VALUES (" + Convert.ToInt32(uId) + ", " + stockId + ")",
                    CommandType = CommandType.Text
                };
               

                int stockCount = 0;
                int stockManagerCount = 0;

                SqlDataReader productExistance = cmdCheckProductExistance.ExecuteReader();
                if (productExistance.HasRows) {

                    // While updating stock manager table we need stock id
                    int toBeUpdatedStockId = 0;

                    while (productExistance.Read()) {
                        toBeUpdatedStockId = Convert.ToInt32(productExistance.GetValue(0));
                    }

                    SqlCommand cmdUpdateIntoStockManager = new SqlCommand {
                        Connection = connection,
                        CommandText = "UPDATE stock_manager SET user_id = " + Convert.ToInt32(uId) + " WHERE stock_id = " + toBeUpdatedStockId + "",
                        CommandType = CommandType.Text
                    };

                    //Update stock
                    stockCount = cmdUpdateIntoStock.ExecuteNonQuery();
                    stockManagerCount = cmdUpdateIntoStockManager.ExecuteNonQuery();

                } else {
                    //Insert stock
                    stockCount = cmdInsertIntoStock.ExecuteNonQuery();
                    stockManagerCount = cmdInsertIntoStockManager.ExecuteNonQuery();
                    
                }


                connection.Close();
                connection.Dispose();

                if (stockCount == 1 && stockManagerCount == 1) {
                    return ("1");
                } else {
                    return ("0");
                }

            } catch (Exception e) {
                return e.Message;
            }

        }

        // get product and users name
        [WebMethod]
        public static string GetProductAndUser() {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                // Get product
                SqlCommand cmdGetCategoryName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT product_id, item_name FROM product_details",
                    CommandType = CommandType.Text
                };

                // Get users
                SqlCommand cmdGetUsersName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT user_id, full_name FROM users",
                    CommandType = CommandType.Text
                };

                // Options for category
                SqlDataReader productDataReader = cmdGetCategoryName.ExecuteReader();
                StringBuilder productOption = new StringBuilder();
                while (productDataReader.Read()) {
                    productOption.Append("<option value='" + productDataReader.GetValue(0) + "'>" + productDataReader.GetValue(1) + "</option>");
                }
                productDataReader.Close();

                // Options for users
                SqlDataReader usersDataReader = cmdGetUsersName.ExecuteReader();
                StringBuilder usersOption = new StringBuilder();
                while (usersDataReader.Read()) {
                    usersOption.Append("<option value='" + usersDataReader.GetValue(0) + "'>" + usersDataReader.GetValue(1) + "</option>");
                }
                usersDataReader.Close();

                connection.Close();
                connection.Dispose();

                // Return string by adding splitter between two result
                string optionCollection = productOption.ToString()+ "##" + usersOption.ToString();

                return optionCollection;

            } catch (Exception e) {
                return e.Message;
            }

        }

        // get product and users name
        [WebMethod]
        public static string GetProductStockDetails(string productId) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                SqlCommand cmdSelectStockDetails = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT stock_id, arrived_quantity, stock_quantity, arrived_date " +
                                     "FROM stock WHERE product_id = "+ Convert.ToInt32(productId) +"",
                    CommandType = CommandType.Text
                };

                // Items table start
                SqlDataReader stockDataReader = cmdSelectStockDetails.ExecuteReader();
                StringBuilder stockTable = new StringBuilder();
                while (stockDataReader.Read()) {

                    stockTable.Append("<tr>");
                    stockTable.Append("<td class='color-blue-grey-lighter'>" + stockDataReader.GetValue(0) + "</td>");
                    stockTable.Append("<td>" + GetProductName(connection, productId) + "</td>");
                    stockTable.Append("<td>" + stockDataReader.GetValue(1) + "</td>");
                    stockTable.Append("<td>" + stockDataReader.GetValue(2) + "</td>");
                    stockTable.Append("<td>" + stockDataReader.GetValue(3) + "</td>");
                    stockTable.Append("</tr>");

                }
                stockDataReader.Close();

                connection.Close();
                connection.Dispose();

                // Return string by adding splitter between two result
                string result = stockTable.ToString();

                return result;

            } catch (Exception e) {
                return e.Message;
            }

        }

        [WebMethod]
        public static string GetStockWithProductDetails(string productId) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                SqlCommand cmdStockWithProductDetails = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT s.stock_id, s.arrived_quantity, s.stock_quantity, s.arrived_date, " +
                                        "p.item_name, p.item_code, p.description, p.price, p.purchase_date, p.category_id, p.supplier_id, p.user_id " +
                                        "FROM stock s " +
                                        "JOIN product_details p " +
                                        "ON s.product_id = p.product_id " +
                                        "WHERE s.product_id = " + Convert.ToInt32(productId) + "",
                    CommandType = CommandType.Text
                };

                // Items table start
                SqlDataReader stockDataReader = cmdStockWithProductDetails.ExecuteReader();
                StringBuilder stockTable = new StringBuilder();
                while (stockDataReader.Read()) {
                   
                    stockTable.Append("<tr>");
                    stockTable.Append("<td class='color-blue-grey-lighter'>" + stockDataReader.GetValue(0) + "</td>");
                    stockTable.Append("<td>" + stockDataReader.GetValue(4) + "</td>");
                    stockTable.Append("<td>" + stockDataReader.GetValue(5) + "</td>");
                    stockTable.Append("<td>" + SSMS.Items.GetCategoryName(connection, stockDataReader.GetValue(9)) + "</td>");
                    stockTable.Append("<td>" + stockDataReader.GetValue(6) + "</td>");
                    stockTable.Append("<td>" + stockDataReader.GetValue(7) + "</td>");
                    stockTable.Append("<td>" + stockDataReader.GetValue(8) + "</td>");
                    stockTable.Append("<td>" + stockDataReader.GetValue(3) + "</td>");
                    stockTable.Append("<td>" + stockDataReader.GetValue(1) + "</td>");
                    stockTable.Append("<td>" + stockDataReader.GetValue(2) + "</td>");
                    stockTable.Append("<td>" + SSMS.Items.GetSupplierName(connection, stockDataReader.GetValue(10)) + "</td>");
                    stockTable.Append("<td>" + SSMS.Items.GetUserName(connection, stockDataReader.GetValue(11)) + "</td>");
                    stockTable.Append("</tr>");

                }
                stockDataReader.Close();

                return stockTable.ToString();

            } catch(Exception e) {
                return e.Message;
            }
            

        }

        private static int GetStockQuantity(Object id, SqlConnection connection) {

            int productId = Convert.ToInt32(id);
            int quantity = 0;

            SqlCommand cmdGetProductQuantity = new SqlCommand {
                Connection = connection,
                CommandText = "SELECT stock_quantity FROM stock WHERE product_id = " + productId + "",
                CommandType = CommandType.Text
            };

            SqlDataReader quantityReader = cmdGetProductQuantity.ExecuteReader();
            while (quantityReader.Read()) {

                if(!(quantityReader.GetValue(0) is DBNull)) {
                    quantity = Convert.ToInt32(quantityReader.GetValue(0));
                }
                
            }
            quantityReader.Close();

            return quantity;

        }

        // Get product name by its id
        public static string GetProductName(SqlConnection connection, Object objId) {

            if (!(objId is DBNull)) {

                int id = Convert.ToInt32(objId);
                string productName = null;

                SqlCommand cmdGetcategoryName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT item_name FROM product_details WHERE product_id = " + id + "",
                    CommandType = CommandType.Text
                };

                SqlDataReader categoryDataReader = cmdGetcategoryName.ExecuteReader();
                while (categoryDataReader.Read()) {
                    productName = categoryDataReader.GetValue(0).ToString();
                }
                categoryDataReader.Close();

                return productName;

            } else {
                return "N.A";
            }

        }

    }

}