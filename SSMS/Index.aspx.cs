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

        protected static string connectingStringSSMS = "Data Source=DESKTOP-1NMRQA9\\SQLEXPRESS; Initial Catalog=SSMS; Integrated Security=True; MultipleActiveResultSets=true";

        protected void Page_Load(object sender, EventArgs e) {

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
        public static string GetProductCode() {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                // Get product code
                SqlCommand cmdGetProductCode = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT item_code, price FROM product_details",
                    CommandType = CommandType.Text
                };



                // Options for category
                SqlDataReader productDataReader = cmdGetProductCode.ExecuteReader();
                StringBuilder productCodeList = new StringBuilder();
                StringBuilder productPriceList = new StringBuilder();
                while (productDataReader.Read()) {
                    productCodeList.Append(""+ productDataReader.GetValue(0)  + ",");
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
                    "VALUES (" + saleId + ", " + Convert.ToInt32(qty) + ", " + Convert.ToInt32(rate) + ", " + Convert.ToInt32(total) + ", " + Convert.ToInt32(credit) + ", '" + billingDate + "', " + Convert.ToInt32(customer) + ",  " + Convert.ToInt32(user) + ", " + GetProductId(connection, pCode) + ")",
                    CommandType = CommandType.Text
                };

                int count = cmdInsertSell.ExecuteNonQuery();


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
                return "N.A";
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