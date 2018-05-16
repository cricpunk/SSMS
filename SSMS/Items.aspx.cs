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

    public partial class Items : System.Web.UI.Page {

        public static string currentUser;

        protected static string connectingStringSSMS = Login.connectingStringSSMS;

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
             
                SqlCommand cmdSelectItemDetails = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT product_id, item_name, item_code, description, price, CONVERT(DATE, purchase_date), category_id, supplier_id, user_id " +
                                    "FROM product_details",
                    CommandType = CommandType.Text
                };

                SqlCommand cmdSelectCategoryDetails = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT category_id, category_name, category_description " +
                                    "FROM category",
                    CommandType = CommandType.Text
                };

                // Items table start
                SqlDataReader itemsDataReader = cmdSelectItemDetails.ExecuteReader();
                StringBuilder itemsTable = new StringBuilder();
                while (itemsDataReader.Read()) {

                    itemsTable.Append("<tr>");
                    itemsTable.Append("<td class='color-blue-grey-lighter'>" + itemsDataReader.GetValue(0) + "</td>");
                    itemsTable.Append("<td>" + itemsDataReader.GetValue(1) + "</td>");
                    itemsTable.Append("<td>" + itemsDataReader.GetValue(2) + "</td>");
                    itemsTable.Append("<td>" + itemsDataReader.GetValue(3) + "</td>");
                    itemsTable.Append("<td>" + itemsDataReader.GetValue(4) + "</td>");
                    itemsTable.Append("<td>" + itemsDataReader.GetValue(5) + "</td>");
                    itemsTable.Append("<td class='color-blue-grey-lighter'>" + GetCategoryName(connection, itemsDataReader.GetValue(6)) + "</td>");
                    itemsTable.Append("<td class='color-blue-grey-lighter'>" + GetSupplierName(connection, itemsDataReader.GetValue(7)) + "</td>");
                    itemsTable.Append("<td class='color-blue-grey-lighter'>" + GetUserName(connection, itemsDataReader.GetValue(8)) + "</td>");
                    itemsTable.Append("</tr>");

                }
                itemsDataReader.Close();
                TablePlaceHolder.Controls.Add(new Literal { Text = itemsTable.ToString() }); ;
                // Items table end

                // Category table start
                SqlDataReader categoryDataReader = cmdSelectCategoryDetails.ExecuteReader();
                StringBuilder categoryTable = new StringBuilder();
                while (categoryDataReader.Read()) {

                    categoryTable.Append("<tr>");
                    categoryTable.Append("<td class='color-blue-grey-lighter'>" + categoryDataReader.GetValue(0) + "</td>");
                    categoryTable.Append("<td>" + categoryDataReader.GetValue(1) + "</td>");
                    categoryTable.Append("<td>" + categoryDataReader.GetValue(2) + "</td>");
                    categoryTable.Append("</tr>");

                }
                categoryDataReader.Close();
                CategoryTablePlaceHolder.Controls.Add(new Literal { Text = categoryTable.ToString() }); ;
                // Category table end

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

        // Insert category
        [WebMethod]
        public static string InsertCategory(string category, string description) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();


                // For the purpose of primary key auto increment 
                int categoryId = 0;
                SqlCommand cmdCategoryId = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT MAX(category_id) FROM category",
                    CommandType = CommandType.Text
                };

                SqlDataReader categoryIdReader = cmdCategoryId.ExecuteReader();
                while (categoryIdReader.Read()) {

                    if (categoryIdReader.GetValue(0) == DBNull.Value) {
                        categoryId = 1;
                    } else {
                        categoryId = Convert.ToInt32(categoryIdReader.GetValue(0)) + 1;
                    }

                }
                // Remember to close reader as soon as it completes its task. This is important. Otherwise it will throw 
                // "there is already an open datareader associated with this command which must be closed first." error at run time.
                categoryIdReader.Close();

                SqlCommand cmdInsertSupplier = new SqlCommand {
                    Connection = connection,
                    CommandText = "INSERT INTO category (category_id, category_name, category_description) " +
                    "VALUES (" + categoryId + ", '" + category + "', '" + description + "')",
                    CommandType = CommandType.Text
                };

                int count = cmdInsertSupplier.ExecuteNonQuery();


                connection.Close();
                connection.Dispose();

                if (count == 1) {
                    return ("1");
                } else {
                    return ("0");
                }

            } catch (Exception e) {
                return e.Message;
            }

        }

        // Insert items
        [WebMethod]
        public static string InsertItemDetails(string iName, string iCode, string description, string price, string purchaseDate, string category, string supplier, string userName) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                // Change date format form dd/mm/yy to yy/mm/dd
                // Microsoft SQL support yy/mm/dd format
                string[] date = purchaseDate.Split('/');
                string purDate = date[2] + "/" + date[1] + "/" + date[0];

                // For the purpose of product details primary key auto increment 
                int itemId = 0;
                SqlCommand cmdItemId = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT MAX(product_id) FROM product_details",
                    CommandType = CommandType.Text
                };

                SqlDataReader itemIdReader = cmdItemId.ExecuteReader();
                while (itemIdReader.Read()) {

                    if (itemIdReader.GetValue(0) == DBNull.Value) {
                        itemId = 1;
                    } else {
                        itemId = Convert.ToInt32(itemIdReader.GetValue(0)) + 1;
                    }
                }
                // Remember to close reader as soon as it completes its task. This is important. Otherwise it will throw 
                // "there is already an open datareader associated with this command which must be closed first." error at run time.
                itemIdReader.Close();

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
                stockIdReader.Close();

                SqlCommand cmdInsertItems = new SqlCommand {
                    Connection = connection,
                    CommandText = "INSERT INTO product_details (product_id, item_name, item_code, description, price, purchase_date, category_id, supplier_id, user_id) " +
                    "VALUES (" + itemId + ", '" + iName + "', '" + iCode + "', '" + description + "', '" + price + "', '" + purDate + "', " + Convert.ToInt32(category) +
                    ", " + Convert.ToInt32(supplier) + ", " + Convert.ToInt32(userName) + ")",
                    CommandType = CommandType.Text
                };

                SqlCommand cmdInsertIntoStock = new SqlCommand {
                    Connection = connection,
                    CommandText = "INSERT INTO stock (stock_id, arrived_quantity, stock_quantity, arrived_date, product_id) " +
                    "VALUES (" + stockId + ", '" + iName + "', '" + iCode + "', '" + description + "', '" + price + "', '" + purchaseDate + "', " + Convert.ToInt32(category) +
                    ", " + Convert.ToInt32(supplier) + ", " + Convert.ToInt32(userName) + ")",
                    CommandType = CommandType.Text
                };

                int count = cmdInsertItems.ExecuteNonQuery();


                connection.Close();
                connection.Dispose();

                if (count == 1) {
                    return ("1");
                } else {
                    return ("0");
                }

            } catch (Exception e) {
                return e.Message;
            }

        }

        // Update items
        [WebMethod]
        public static string UpdateItemDetails(string id, string iName, string iCode, string description, string price, string purchaseDate) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                SqlCommand cmdUpdateCustomer = new SqlCommand {
                    Connection = connection,
                    CommandText = "UPDATE product_details SET item_name = '" + iName + "', item_code = '" + iCode + "', " +
                    "description = '" + description + "', price = '" + price + "', purchase_date = '" + purchaseDate +"'" +
                    " WHERE product_id = " + Convert.ToInt32(id) + "",
                    CommandType = CommandType.Text
                };

                int count = cmdUpdateCustomer.ExecuteNonQuery();

                connection.Close();
                connection.Dispose();

                if (count == 1) {
                    return ("1");
                } else {
                    return ("0");
                }

            } catch (Exception e) {
                return e.Message;
            }

        }

        // Delete items
        [WebMethod]
        public static string DeleteRecord(string id) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                SqlCommand cmdDelete = new SqlCommand {
                    Connection = connection,
                    CommandText = "DELETE FROM product_details WHERE product_id = " + Convert.ToInt32(id) + "",
                    CommandType = CommandType.Text
                };

                int count = cmdDelete.ExecuteNonQuery();

                connection.Close();
                connection.Dispose();

                if (count == 1) {
                    return ("1");
                } else {
                    return ("0");
                }

            } catch (Exception e) {
                return e.Message;
            }

        }

        // Get category , suppliers and users details
        [WebMethod]
        public static string GetCataSuppUser() {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                // Get category
                SqlCommand cmdGetCategoryName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT category_id, category_name FROM category",
                    CommandType = CommandType.Text
                };

                // Get suppliers
                SqlCommand cmdGetSuppliersName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT supplier_id, supplier_name FROM suppliers",
                    CommandType = CommandType.Text
                };

                // Get users
                SqlCommand cmdGetUsersName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT user_id, full_name FROM users",
                    CommandType = CommandType.Text
                };

                // Options for category
                SqlDataReader categoryDataReader = cmdGetCategoryName.ExecuteReader();
                StringBuilder categoryOption = new StringBuilder();
                while (categoryDataReader.Read()) {
                    categoryOption.Append("<option value='" + categoryDataReader.GetValue(0) + "'>" + categoryDataReader.GetValue(1) + "</option>");
                }
                categoryDataReader.Close();

                // Options for supplier
                SqlDataReader supplierDataReader = cmdGetSuppliersName.ExecuteReader();
                StringBuilder supplierOption = new StringBuilder();
                while (supplierDataReader.Read()) {
                    supplierOption.Append("<option value='" + supplierDataReader.GetValue(0) + "'>" + supplierDataReader.GetValue(1) + "</option>");
                }
                supplierDataReader.Close();

                // Options for users
                SqlDataReader usersDataReader = cmdGetUsersName.ExecuteReader();
                StringBuilder usersOption = new StringBuilder();
                while (usersDataReader.Read()) {
                    usersOption.Append("<option value='" + usersDataReader.GetValue(0) + "'>" + usersDataReader.GetValue(1) + "</option>");
                }           
                usersDataReader.Close();             
               
                connection.Close();
                connection.Dispose();

                string optionCollection = categoryOption.ToString() + "##" + supplierOption.ToString() + "##" + usersOption.ToString();

                return optionCollection;

            } catch (Exception e) {
                return e.Message;
            }

        }

        // Get supplier name by its id
        public static string GetSupplierName(SqlConnection connection, Object objId) {

            if (!(objId is DBNull)) {

                int id = Convert.ToInt32(objId);
                string supplierName = null;

                SqlCommand cmdGetSupplierName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT supplier_name FROM suppliers WHERE supplier_id = " + id + "",
                    CommandType = CommandType.Text
                };

                SqlDataReader supplierDataReader = cmdGetSupplierName.ExecuteReader();
                while (supplierDataReader.Read()) {
                    supplierName = supplierDataReader.GetValue(0).ToString();
                }
                supplierDataReader.Close();

                return supplierName;

            } else {
                return "N.A";
            }

        }

        // Get category name by its id
        public static string GetCategoryName(SqlConnection connection, Object objId) {

            if (!(objId is DBNull)) {

                int id = Convert.ToInt32(objId);
                string categoryName = null;

                SqlCommand cmdGetcategoryName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT category_name FROM category WHERE category_id = " + id + "",
                    CommandType = CommandType.Text
                };

                SqlDataReader categoryDataReader = cmdGetcategoryName.ExecuteReader();
                while (categoryDataReader.Read()) {
                    categoryName = categoryDataReader.GetValue(0).ToString();
                }
                categoryDataReader.Close();

                return categoryName;

            } else {
                return "N.A";
            }

        }

        // Get user name by its id
        public static string GetUserName(SqlConnection connection, Object objId) {

            if (!(objId is DBNull)) {

                int id = Convert.ToInt32(objId);
                string userName = null;

                SqlCommand cmdGetUserName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT full_name FROM users WHERE user_id = " + id + "",
                    CommandType = CommandType.Text
                };

                SqlDataReader userDataReader = cmdGetUserName.ExecuteReader();
                while (userDataReader.Read()) {
                    userName = userDataReader.GetValue(0).ToString();
                }
                userDataReader.Close();

                return userName;

            } else {
                return "N.A";
            }

        }

    }

}