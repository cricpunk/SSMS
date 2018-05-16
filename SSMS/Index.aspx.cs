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

    public partial class Index : System.Web.UI.Page {

        public static string currentUser, currentUserId, userName;

        protected static string connectingStringSSMS = Login.connectingStringSSMS;

        protected void Page_Load(object sender, EventArgs e) {

            if (Session["Name"] == null) {
                Response.Redirect("Login.aspx");
            }
            else {
                Response.Write("<script>alert('"+ GetOutOfStockInfo() +"')</script>");
                currentUser = Session["Full_Name"].ToString();
                userName = Session["User_Name"].ToString();
                currentUserId = Session["User_Id"].ToString();
                System.Diagnostics.Debug.WriteLine("Supplier Session username: " + Session["Name"].ToString());
            }

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                // Get product
                SqlCommand cmdGetCustomerName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT customer_id, name FROM customer_details",
                    CommandType = CommandType.Text
                };

                // Get users
                SqlCommand cmdGetUsersName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT user_id, full_name FROM users",
                    CommandType = CommandType.Text
                };

                //Get all users
                SqlCommand cmdGetAllUsers = new SqlCommand
                {
                    Connection = connection,
                    CommandText = "SELECT user_id, full_name, user_name, user_type, phone_no, email, address FROM users",
                    CommandType = CommandType.Text
                };

                // Options for category
                SqlDataReader customerDataReader = cmdGetCustomerName.ExecuteReader();
                StringBuilder customerOption = new StringBuilder();
                while (customerDataReader.Read()) {
                    customerOption.Append("<option value='" + customerDataReader.GetValue(0) + "'>" + customerDataReader.GetValue(1) + "</option>");
                }
                customerDataReader.Close();

                // Options for users
                SqlDataReader usersDataReader = cmdGetUsersName.ExecuteReader();
                StringBuilder usersOption = new StringBuilder();
                while (usersDataReader.Read()) {
                    usersOption.Append("<option value='" + usersDataReader.GetValue(0) + "'>" + usersDataReader.GetValue(1) + "</option>");
                }
                usersDataReader.Close();

                //User Details
                SqlDataReader userDetailReader = cmdGetAllUsers.ExecuteReader();
                StringBuilder userDetais = new StringBuilder();
                while (userDetailReader.Read())
                {
                    userDetais.Append("<tr>");
                    userDetais.Append("<td class='color-blue-grey-lighter'>" + userDetailReader.GetValue(0) + "</td>");
                    userDetais.Append("<td><span class='label label - primary'>" + userDetailReader.GetValue(1) + "</span></td>");
                    userDetais.Append("<td>" + userDetailReader.GetValue(2) + "</td>");
                    userDetais.Append("<td>" + userDetailReader.GetValue(3) + "</td>");
                    userDetais.Append("<td>" + userDetailReader.GetValue(4) + "</td>");
                    userDetais.Append("<td>" + userDetailReader.GetValue(5) + "</td>");
                    userDetais.Append("<td>" + userDetailReader.GetValue(6) + "</td>");
                    userDetais.Append("</tr>");
                }
                userDetailReader.Close();
                UserTablePlaceholder.Controls.Add(new Literal { Text = userDetais.ToString() }); ;

                SqlCommand cmdSelectItemDetails = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT sales_id, quantity, rate, total_price, credit_amount, CONVERT(DATE, billing_date), customer_id, user_id, product_id " +
                                    "FROM sales_details",
                    CommandType = CommandType.Text
                };

                // Sales Items table start
                SqlDataReader itemsDataReader = cmdSelectItemDetails.ExecuteReader();
                StringBuilder itemsTable = new StringBuilder();
                while (itemsDataReader.Read()) {


                    itemsTable.Append("<tr>");
                    itemsTable.Append("<td class='color-blue-grey-lighter'>" + itemsDataReader.GetValue(0) + "</td>");
                    itemsTable.Append("<td><span class='label label - primary'>" + GetProductName(connection, itemsDataReader.GetValue(8)) + "</span></td>");
                    itemsTable.Append("<td>" + GetCustomerName(connection, itemsDataReader.GetValue(6)) + "</td>");
                    itemsTable.Append("<td>" + itemsDataReader.GetValue(5) + "</td>");
                    itemsTable.Append("<td>" + GetUserName(connection, itemsDataReader.GetValue(7)) + "</td>");
                    itemsTable.Append("<td align='center'>" + itemsDataReader.GetValue(1) + "</td>");
                    itemsTable.Append("<td align='center'>" + itemsDataReader.GetValue(2) + "</td>");
                    itemsTable.Append("<td align='center'>" + itemsDataReader.GetValue(3) + "</td>");
                    itemsTable.Append("<td align='center'>" + itemsDataReader.GetValue(4) + "</td>");
                    itemsTable.Append("</tr>");

                }
                itemsDataReader.Close();
                SaleTablePlaceHolder.Controls.Add(new Literal { Text = itemsTable.ToString() }); ;
                // Sales Items table end



                connection.Close();
                connection.Dispose();

                CustomerNamePlaceHolder.Controls.Add(new Literal { Text = customerOption.ToString() });
                UserNamePlaceHolder.Controls.Add(new Literal { Text = usersOption.ToString() });

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
                    CommandText = "SELECT password FROM users WHERE user_name = '" + userName +"' AND password = '" + oldPassword +"'",
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

            } catch (Exception e)
            {
                return e.Message;
            }
        }

        [WebMethod]
        public static string GetProductCode() {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                // Get product code
                SqlCommand cmdGetProductCode = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT item_code, price, item_name FROM product_details",
                    CommandType = CommandType.Text
                };



                // Options for category
                SqlDataReader productDataReader = cmdGetProductCode.ExecuteReader();
                StringBuilder productCodeList = new StringBuilder();
                StringBuilder productPriceList = new StringBuilder();
                while (productDataReader.Read()) {
                    productCodeList.Append(""+ productDataReader.GetValue(0)  + "("+ productDataReader.GetValue(2) + "),");
                    productPriceList.Append("" + productDataReader.GetValue(1) + ",");
                }
                productDataReader.Close();

                connection.Close();
                connection.Dispose();               

                return productCodeList.ToString() + "##" + productPriceList.ToString();

            } catch (Exception e) {
                return e.Message;
            }

        }               

        [WebMethod]
        public static string SaleProduct(string pCode, string qty, string customer, string billingDate, string rate, string total, string credit, string user) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                // Change date format form dd/mm/yy to yy/mm/dd
                // Microsoft SQL support yy/mm/dd format
                string[] date = billingDate.Split('/');
                string bilDate = date[2] + "/" + date[1] + "/" + date[0];

                // For the purpose of primary key auto increment 
                int saleId = 0;
                SqlCommand cmdCellId = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT MAX(sales_id) FROM sales_details",
                    CommandType = CommandType.Text
                };

                SqlDataReader sellIdReader = cmdCellId.ExecuteReader();
                while (sellIdReader.Read()) {

                    if (sellIdReader.GetValue(0) == DBNull.Value) {
                        saleId = 1;
                    } else {
                        saleId = Convert.ToInt32(sellIdReader.GetValue(0)) + 1;
                    }

                }
                // Remember to close reader as soon as it completes its task. This is important. Otherwise it will throw 
                // "there is already an open datareader associated with this command which must be closed first." error at run time.
                sellIdReader.Close();

                SqlCommand cmdInsertSell = new SqlCommand {
                    Connection = connection,
                    CommandText = "INSERT INTO sales_details (sales_id, quantity, rate, total_price, credit_amount, billing_date, customer_id, user_id, product_id) " +
                    "VALUES (" + saleId + ", " + Convert.ToInt32(qty) + ", " + Convert.ToInt32(rate) + ", " + Convert.ToInt32(total) + ", " + Convert.ToInt32(credit) + ", '" + bilDate + "', " + Convert.ToInt32(customer) + ",  " + Convert.ToInt32(user) + ", " + GetProductId(connection, pCode) + ")",
                    CommandType = CommandType.Text
                };

                SqlCommand cmdDeductQuantity = new SqlCommand {
                    Connection = connection,
                    CommandText = "UPDATE stock SET stock_quantity = stock_quantity - "+ Convert.ToInt32(qty) + " WHERE product_id = "+ GetProductId(connection, pCode) + "",
                    CommandType = CommandType.Text
                };

                SqlCommand cmdDeleteFromSale = new SqlCommand {
                    Connection = connection,
                    CommandText = "DELETE FROM sales_details WHERE product_id = " + GetProductId(connection, pCode) + "",
                    CommandType = CommandType.Text
                };

                int salesCount = cmdInsertSell.ExecuteNonQuery();
                int qtyUpdateCount = cmdDeductQuantity.ExecuteNonQuery();                

                // If sales table is recoeded successfully then decrease quantity from stock table
                // else return unsuccessful message to the user
                if (salesCount == 1) {

                    // If quantity is deducted successfully from stock table then return success message 
                    // Else delete last sales record and return unsuccessful message to the user
                    if (qtyUpdateCount == 1) {

                        connection.Close();
                        connection.Dispose();
                        return ("1");

                    } else {

                        cmdDeleteFromSale.ExecuteNonQuery();
                        connection.Close();
                        connection.Dispose();

                        return ("0");

                    }
                    
                } else {

                    return ("0");

                }

            } catch (Exception e) {
                return e.Message;
            }

        }

        [WebMethod]
        public static string ValidateQuantity(string pCode, string requestQty) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                // Get qty
                SqlCommand cmdGetQty = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT stock_quantity FROM stock WHERE product_id = " + GetProductId(connection, pCode) + "",
                    CommandType = CommandType.Text
                };

                SqlDataReader qtyReader = cmdGetQty.ExecuteReader();
                StringBuilder result = new StringBuilder();

                if(qtyReader.HasRows) {

                    while (qtyReader.Read()) {

                        int availableQty = Convert.ToInt32(qtyReader.GetValue(0));
                        int reqQty = Convert.ToInt32(requestQty);

                        if (availableQty < reqQty) {
                            result.Append("There is only "+ availableQty.ToString()  + " quantity available in stock.");
                        } else {
                            result.Append("available");
                        }

                    }

                } else {
                    result.Append("Item not available in stock");
                }
                
                qtyReader.Close();

                return result.ToString();

            } catch(Exception exception) {
                return exception.Message;
            }

            
        }

        // Update user
        [WebMethod]
        public static string UpdateUser(string id, string uFullName, string uName, string uType, string uPhone, string uEmail, string uAddress) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                SqlCommand cmdUpdateCustomer = new SqlCommand {
                    Connection = connection,
                    CommandText = "UPDATE users SET full_name = '" + uFullName + "', user_name = '" + uName + "',  user_type = '" + uType + "', " +
                    "phone_no = '" + uPhone + "', email = '" + uEmail + "', address = '" + uAddress + "'" +
                    " WHERE user_id = " + Convert.ToInt32(id) + "",
                    CommandType = CommandType.Text
                };

                int count = cmdUpdateCustomer.ExecuteNonQuery();

                connection.Close();
                connection.Dispose();

                if (count == 1)
                {
                    return ("1");
                }
                else
                {
                    return ("0");
                }

            }
            catch (Exception e)
            {
                return e.Message;
            }

        }

        // Delete items
        [WebMethod]
        public static string DeleteRecord(string id)
        {

            try
            {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                SqlCommand cmdDelete = new SqlCommand
                {
                    Connection = connection,
                    CommandText = "DELETE FROM users WHERE user_id = " + Convert.ToInt32(id) + "",
                    CommandType = CommandType.Text
                };

                int count = cmdDelete.ExecuteNonQuery();

                connection.Close();
                connection.Dispose();

                if (count == 1)
                {
                    return ("1");
                }
                else
                {
                    return ("0");
                }

            }
            catch (Exception e)
            {
                return e.Message;
            }

        }

        private static int GetProductId(SqlConnection connection, string productCode) {

            int id = 0;

            // Get product code
            SqlCommand cmdGetProductCode = new SqlCommand {
                Connection = connection,
                CommandText = "SELECT product_id FROM product_details WHERE item_code = '"+ productCode +"'",
                CommandType = CommandType.Text
            };

            SqlDataReader idDataReader = cmdGetProductCode.ExecuteReader();
            while (idDataReader.Read()) {
                id = Convert.ToInt32(idDataReader.GetValue(0));
            }
            idDataReader.Close();

            return id;

        }

        // Get supplier name by its id
        public static string GetProductName(SqlConnection connection, Object objId) {

            if (!(objId is DBNull)) {

                int id = Convert.ToInt32(objId);
                string productname = null;

                SqlCommand cmdGetSupplierName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT item_name FROM product_details WHERE product_id = " + id + "",
                    CommandType = CommandType.Text
                };

                SqlDataReader supplierDataReader = cmdGetSupplierName.ExecuteReader();
                while (supplierDataReader.Read()) {
                    productname = supplierDataReader.GetValue(0).ToString();
                }
                supplierDataReader.Close();

                return productname;

            } else {
                return "Unavailable product";
            }

        }

        // Get category name by its id
        public static string GetCustomerName(SqlConnection connection, Object objId) {

            if (!(objId is DBNull)) {

                int id = Convert.ToInt32(objId);
                string customerName = null;

                SqlCommand cmdGetcategoryName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT name FROM customer_details WHERE customer_id = " + id + "",
                    CommandType = CommandType.Text
                };

                SqlDataReader categoryDataReader = cmdGetcategoryName.ExecuteReader();
                while (categoryDataReader.Read()) {
                    customerName = categoryDataReader.GetValue(0).ToString();
                }
                categoryDataReader.Close();

                return customerName;

            } else {
                return "Past customer";
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
                return "Old user";
            }

        }

        public static string GetOutOfStockInfo() {

            SqlConnection connection = new SqlConnection(connectingStringSSMS);
            connection.Open();

            // 2. Command to select items which are out of stock
            SqlCommand cmdOutOfStockDetails = new SqlCommand {
                Connection = connection,
                CommandText = "SELECT stock_quantity, product_id " +
                                "FROM stock " +
                                "WHERE stock_quantity < 10 ",
                CommandType = CommandType.Text
            };

            SqlDataReader outOfStockDataReader = cmdOutOfStockDetails.ExecuteReader();
            StringBuilder outOfStockItem = new StringBuilder();

            while (outOfStockDataReader.Read()) {
                outOfStockItem.Append("" + SSMS.Stock.GetProductName(connection, outOfStockDataReader.GetValue(1)) + " is out of stock. Only " + outOfStockDataReader.GetValue(0) + " item left.");
            }
            outOfStockDataReader.Close();

            connection.Close();
            connection.Dispose();

            return outOfStockItem.ToString();
        }

    }

}