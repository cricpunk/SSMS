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
    public partial class Suppliers : System.Web.UI.Page {

        public static string currentUser;

        //For Purushottam's database server
        //protected static string connectingStringSSMS = "Data Source=DESKTOP-JI61OUF\\SQLEXPRESS; Initial Catalog=SSMS; Integrated Security=True; MultipleActiveResultSets=true";

        //For Pankaj's database server
        protected static string connectingStringSSMS = "Data Source=DESKTOP-1NMRQA9\\SQLEXPRESS; Initial Catalog=SSMS; Integrated Security=True; MultipleActiveResultSets=true";

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
                    CommandText = "SELECT supplier_id, supplier_name, contact_no, email, address, url, personal_no, user_id " +
                                    "FROM suppliers",
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
                    customerTable.Append("<td>" + customerDataReader.GetValue(5) + "</td>");
                    customerTable.Append("<td>" + customerDataReader.GetValue(6) + "</td>");
                    customerTable.Append("<td class='color-blue-grey-lighter'>" + GetUserName(connection, customerDataReader.GetValue(7)) + "</td>");
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
        public void logOut(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Index Session Logout:");
            HttpContext.Current.Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        [WebMethod]
        public static string InsertSupplierDetails(string sName, string sContactNo, string sEmail, string sAddress, string sUrl, string sPersonalNo, string userId) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();


                // For the purpose of primary key auto increment 
                int supplierId = 0;
                SqlCommand cmdSupplierId = new SqlCommand {
                    Connection = connection,
                    CommandText = "SELECT MAX(supplier_id) FROM suppliers",
                    CommandType = CommandType.Text
                };

                SqlDataReader supplierIdReader = cmdSupplierId.ExecuteReader();
                while (supplierIdReader.Read()) {

                    if (supplierIdReader.GetValue(0) == DBNull.Value) {
                        supplierId = 1;
                    } else {
                        supplierId = Convert.ToInt32(supplierIdReader.GetValue(0)) + 1;
                    }

                }
                // Remember to close reader as soon as it completes its task. This is important. Otherwise it will throw 
                // "there is already an open datareader associated with this command which must be closed first." error at run time.
                supplierIdReader.Close();

                SqlCommand cmdInsertSupplier = new SqlCommand {
                    Connection = connection,
                    CommandText = "INSERT INTO suppliers (supplier_id, supplier_name, contact_no, email, address, url, personal_no, user_id) " +
                    "VALUES (" + supplierId + ", '" + sName + "', '" + sContactNo + "', '" + sEmail + "', '" + sAddress + "', '" + sUrl + "', '" + sPersonalNo + "', " + Convert.ToInt32(userId) + ")",
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

        [WebMethod]
        public static string UpdateSupplierDetails(string id, string sName, string sContactNo, string sEmail, string sAddress, string sUrl, string sPersonalNo) {

            try {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                SqlCommand cmdUpdateCustomer = new SqlCommand {
                    Connection = connection,
                    CommandText = "UPDATE suppliers SET supplier_name = '" + sName + "', contact_no = '" + sContactNo + "', " +
                    "email = '" + sEmail + "', address = '" + sAddress + "', url = '" + sUrl + "', personal_no = '" + sPersonalNo + "'" +
                    " WHERE supplier_id = " + Convert.ToInt32(id) + "",
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
                    CommandText = "DELETE FROM suppliers WHERE supplier_id = " + Convert.ToInt32(id) + "",
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