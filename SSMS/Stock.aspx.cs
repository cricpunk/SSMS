using System;
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

        public static string currentUser;

        //For Purushottam's database server
        protected static string connectingStringSSMS = "Data Source=DESKTOP-JI61OUF\\SQLEXPRESS; Initial Catalog=SSMS; Integrated Security=True; MultipleActiveResultSets=true";

        //For Pankaj's database server
        //protected static string connectingStringSSMS = "Data Source=DESKTOP-1NMRQA9\\SQLEXPRESS; Initial Catalog=SSMS; Integrated Security=True; MultipleActiveResultSets=true";

        protected void Page_Load(object sender, EventArgs e) {

            if (Session["Name"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                currentUser = Session["Full_Name"].ToString();
                System.Diagnostics.Debug.WriteLine("Supplier Session username: " + Session["Name"].ToString());
            }

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();
                Response.Write("Connected");

                SqlCommand cmdSelectStockDetails = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT stock_id, arrived_quantity, stock_quantity, arrived_date, product_id " +
                                    "FROM stock",
                    CommandType = CommandType.Text
                };

                // Items table start
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

        // Insert items
        [WebMethod]
        public static string InsertIntoStock(string pId, string quantity, string arrivedDate, string uId) {
        
            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                int stockQuantity = Convert.ToInt32(quantity) + GetStockQuantity(pId, connection);

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

                SqlCommand cmdInsertIntoStock = new SqlCommand {
                    Connection = connection,
                    CommandText = "INSERT INTO stock (stock_id, arrived_quantity, stock_quantity, arrived_date, product_id) " +
                    "VALUES (" + stockId + ", " + Convert.ToInt32(quantity) + ", " + stockQuantity + ", '" + arrDate + "', " + Convert.ToInt32(pId) + ")",
                    CommandType = CommandType.Text
                };

                SqlCommand cmdInsertIntoStockManager = new SqlCommand {
                    Connection = connection,
                    CommandText = "INSERT INTO stock_manager (user_id, stock_id) " +
                    "VALUES (" + Convert.ToInt32(uId) + ", " + stockId + ")",
                    CommandType = CommandType.Text
                };

                int stockCount = cmdInsertIntoStock.ExecuteNonQuery();
                int stockManagerCount = cmdInsertIntoStockManager.ExecuteNonQuery();


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
        private static string GetProductName(SqlConnection connection, Object objId) {

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