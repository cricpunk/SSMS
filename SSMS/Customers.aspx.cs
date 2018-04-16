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

        protected static string connectingStringSSMS = "Data Source=DESKTOP-1NMRQA9\\SQLEXPRESS; Initial Catalog=SSMS; Integrated Security=True; MultipleActiveResultSets=true";

        protected void Page_Load(object sender, EventArgs e) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();
                Response.Write("Connected");

                SqlCommand cmdGetUsersName = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT user_id, full_name FROM users",
                    CommandType = CommandType.Text
                };

                SqlDataReader usersDataReader = cmdGetUsersName.ExecuteReader();
                StringBuilder usersOption = new StringBuilder();
                while (usersDataReader.Read()) {
                    usersOption.Append("<option value='" + usersDataReader.GetValue(0) + "'>" + usersDataReader.GetValue(1) + "</option>");
                }
                usersDataReader.Close();
                UserIdPlaceholder.Controls.Add(new Literal { Text = usersOption.ToString() });

                SqlCommand cmdSelectCustomerDetails = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT customer_id, name, address, contact_no, email, user_id " +
                                    "FROM customer_details",
                    CommandType = CommandType.Text
                };

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
                TablePlaceHolder.Controls.Add(new Literal { Text = customerTable.ToString() }); ;

                connection.Close();
                connection.Dispose();

            } catch (Exception exception) {
                Response.Write("<script>alert(' " + exception.Message + "')</script>");
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