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

    public partial class Customers : System.Web.UI.Page {

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

                // Get user name and is
                SqlCommand cmdGetUsersName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT user_id, full_name FROM users",
                    CommandType = CommandType.Text
                };
                
                // Get customer name and id
                SqlCommand cmdGetCustomersName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT customer_id, name FROM customer_details",
                    CommandType = CommandType.Text
                };

                // Set options for user
                SqlDataReader usersDataReader = cmdGetUsersName.ExecuteReader();
                StringBuilder usersOption = new StringBuilder();
                while (usersDataReader.Read()) {
                    usersOption.Append("<option value='" + usersDataReader.GetValue(0) + "'>" + usersDataReader.GetValue(1) + "</option>");
                }
                usersDataReader.Close();
                UserIdPlaceholder.Controls.Add(new Literal { Text = usersOption.ToString() });

                // Set options for customer
                SqlDataReader customersDataReader = cmdGetCustomersName.ExecuteReader();
                StringBuilder customersOption = new StringBuilder();
                while (customersDataReader.Read()) {
                    customersOption.Append("<option value='" + customersDataReader.GetValue(0) + "'>" + customersDataReader.GetValue(1) + "</option>");
                }
                customersDataReader.Close();
                CustomerNamePlaceHolder.Controls.Add(new Literal { Text = customersOption.ToString() });

                // Get all customer details
                SqlCommand cmdSelectCustomerDetails = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT customer_id, name, address, contact_no, email, user_id " +
                                    "FROM customer_details",
                    CommandType = CommandType.Text
                };

                // Command to get all customers who have not purchase any items in last 31 days
                SqlCommand cmdCustomerPurchaseDetails = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT cd.name, cd.address, cd.contact_no, cd.email, " +
                                            "sd.quantity, sd.rate, sd.total_price, sd.credit_amount, sd.billing_date, sd.user_id, sd.product_id " +
                                            "FROM customer_details cd " +
                                            "JOIN sales_details sd " +
                                            "ON cd.customer_id = sd.customer_id " +
                                            "WHERE sd.billing_date <= GetDate() - 31 " +
                                            "AND cd.customer_id NOT IN " +
                                            "(SELECT sd.customer_id FROM sales_details sd " +
                                            "WHERE sd.billing_date >= GetDate() - 31)",
                    CommandType = CommandType.Text
                };


                // Read all customer details and store into table
                SqlDataReader customerDataReader = cmdSelectCustomerDetails.ExecuteReader();
                StringBuilder customerTable = new StringBuilder();
                while (customerDataReader.Read()) {

                    customerTable.Append("<tr>");
                        customerTable.Append("<td class='color-blue-grey-lighter'>" + customerDataReader.GetValue(0) + "</td>");
                        customerTable.Append("<td>" + customerDataReader.GetValue(1) + "</td>");
                        customerTable.Append("<td>" + customerDataReader.GetValue(2) + "</td>");
                        customerTable.Append("<td>" + customerDataReader.GetValue(3) + "</td>");
                        customerTable.Append("<td>" + customerDataReader.GetValue(4) + "</td>");
                        customerTable.Append("<td class='color-blue-grey-lighter'>" + GetUserName(connection, customerDataReader.GetValue(5)) + "</td>");                       
                    customerTable.Append("</tr>");

                }
                customerDataReader.Close();
                TablePlaceHolder.Controls.Add(new Literal { Text = customerTable.ToString() });

                
                // Read all customer details and store into table
                SqlDataReader notPurchaseCustomerDataReader = cmdCustomerPurchaseDetails.ExecuteReader();
                StringBuilder notPurchaseCustomerTable = new StringBuilder();
                int count = 1;
                while (notPurchaseCustomerDataReader.Read()) {

                    notPurchaseCustomerTable.Append("<tr>");
                    notPurchaseCustomerTable.Append("<td class='color-blue-grey-lighter'>" + count + "</td>");
                    notPurchaseCustomerTable.Append("<td>" + notPurchaseCustomerDataReader.GetValue(0) + "</td>");
                    notPurchaseCustomerTable.Append("<td>" + notPurchaseCustomerDataReader.GetValue(1) + "</td>");
                    notPurchaseCustomerTable.Append("<td>" + notPurchaseCustomerDataReader.GetValue(2) + "</td>");
                    notPurchaseCustomerTable.Append("<td>" + notPurchaseCustomerDataReader.GetValue(3) + "</td>");
                    notPurchaseCustomerTable.Append("<td>" + SSMS.Index.GetProductName(connection, notPurchaseCustomerDataReader.GetValue(10)) + "</td>");
                    notPurchaseCustomerTable.Append("<td>" + notPurchaseCustomerDataReader.GetValue(4) + "</td>");
                    notPurchaseCustomerTable.Append("<td>" + notPurchaseCustomerDataReader.GetValue(5) + "</td>");
                    notPurchaseCustomerTable.Append("<td>" + notPurchaseCustomerDataReader.GetValue(6) + "</td>");
                    notPurchaseCustomerTable.Append("<td>" + notPurchaseCustomerDataReader.GetValue(7) + "</td>");
                    notPurchaseCustomerTable.Append("<td>" + notPurchaseCustomerDataReader.GetValue(8) + "</td>");
                    notPurchaseCustomerTable.Append("<td class='color-blue-grey-lighter'>" + GetUserName(connection, notPurchaseCustomerDataReader.GetValue(9)) + "</td>");
                    notPurchaseCustomerTable.Append("</tr>");

                    count++;
                }
                notPurchaseCustomerDataReader.Close();
                CustomerNotPurchasePlaceholder.Controls.Add(new Literal { Text = notPurchaseCustomerTable.ToString() });

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

        [WebMethod]
        public static string InsertCustomerDetails(string cName, string cContactNo, string cEmail, string cAddress, string userId) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();


                // For the purpose of primary key auto increment 
                int customerId = 0;
                SqlCommand cmdCustomerId = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT MAX(customer_id) FROM customer_details",
                    CommandType = CommandType.Text
                };

                SqlDataReader customerIdReader = cmdCustomerId.ExecuteReader();
                while (customerIdReader.Read()) {

                    if(customerIdReader.GetValue(0) == DBNull.Value ) {
                        customerId = 1;
                    } else {
                        customerId = Convert.ToInt32(customerIdReader.GetValue(0)) + 1;
                    }

                }
                // Remember to close reader as soon as it completes its task. This is important. Otherwise it will throw 
                // "there is already an open datareader associated with this command which must be closed first." error at run time.
                customerIdReader.Close();

                SqlCommand cmdInsertCustomer = new SqlCommand {
                    Connection = connection,
                    CommandText = "INSERT INTO customer_details (customer_id, name, address, contact_no, email, user_id) " +
                    "VALUES (" + customerId + ", '" + cName + "', '" + cAddress + "', '" + cContactNo + "', '" + cEmail + "', " + Convert.ToInt32(userId) + ")",
                    CommandType = CommandType.Text
                };

                int count = cmdInsertCustomer.ExecuteNonQuery();

                
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

        [WebMethod]
        public static string UpdateCustomerDetails(string id, string cName, string cContactNo, string cEmail, string cAddress) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                SqlCommand cmdUpdateCustomer = new SqlCommand {
                    Connection = connection,
                    CommandText = "UPDATE customer_details SET name = '" + cName + "', address = '" + cAddress + "', contact_no = '" + cContactNo + "', email = '" + cEmail + "'" +
                    " WHERE customer_id = " + Convert.ToInt32(id) + "",
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

        [WebMethod]
        public static string DeleteRecord(string id) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                SqlCommand cmdDelete = new SqlCommand {
                    Connection = connection,
                    CommandText = "DELETE FROM customer_details WHERE customer_id = " + Convert.ToInt32(id) + "",
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

        [WebMethod]
        public static string GetCustomerPurchaseRecord(string cId) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                SqlCommand cmdCustomerPurchaseDetails = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT cd.name, cd.address, cd.contact_no, cd.email, " +
                                            "sd.quantity, sd.rate, sd.total_price, sd.credit_amount, sd.billing_date, sd.user_id, sd.product_id " +
                                            "FROM customer_details cd " +
                                            "JOIN sales_details sd " +
                                            "ON cd.customer_id = sd.customer_id " +
                                            "WHERE cd.customer_id = " + cId + "" +
                                            "AND sd.billing_date >= GetDate() - 31",
                    CommandType = CommandType.Text
                };

                // Read all customer details and store into table
                SqlDataReader customerDataReader = cmdCustomerPurchaseDetails.ExecuteReader();
                StringBuilder customerTable = new StringBuilder();
                int count = 1;
                while (customerDataReader.Read()) {

                    customerTable.Append("<tr>");
                    customerTable.Append("<td class='color-blue-grey-lighter'>" + count + "</td>");
                    customerTable.Append("<td>" + customerDataReader.GetValue(0) + "</td>");
                    customerTable.Append("<td>" + customerDataReader.GetValue(1) + "</td>");
                    customerTable.Append("<td>" + customerDataReader.GetValue(2) + "</td>");
                    customerTable.Append("<td>" + customerDataReader.GetValue(3) + "</td>");
                    customerTable.Append("<td>" + SSMS.Index.GetProductName(connection, customerDataReader.GetValue(10)) + "</td>");
                    customerTable.Append("<td>" + customerDataReader.GetValue(4) + "</td>");
                    customerTable.Append("<td>" + customerDataReader.GetValue(5) + "</td>");
                    customerTable.Append("<td>" + customerDataReader.GetValue(6) + "</td>");
                    customerTable.Append("<td>" + customerDataReader.GetValue(7) + "</td>");
                    customerTable.Append("<td>" + customerDataReader.GetValue(8) + "</td>");
                    customerTable.Append("<td class='color-blue-grey-lighter'>" + GetUserName(connection, customerDataReader.GetValue(9)) + "</td>");
                    customerTable.Append("</tr>");

                    count++;
                }
                customerDataReader.Close();

                return customerTable.ToString();

            } catch(Exception e) {
                return e.Message;
            }

            
        }

        private static string GetUserName(SqlConnection connection, Object objId) {

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