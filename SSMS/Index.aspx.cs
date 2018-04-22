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
                    CommandText = "SELECT item_code FROM product_details",
                    CommandType = CommandType.Text
                };



                // Options for category
                SqlDataReader productDataReader = cmdGetProductCode.ExecuteReader();
                StringBuilder productCodeList = new StringBuilder();
                while (productDataReader.Read()) {
                    productCodeList.Append(""+ productDataReader.GetValue(0)  + ",");
                }
                productDataReader.Close();

                connection.Close();
                connection.Dispose();               

                return productCodeList.ToString();

            } catch (Exception e) {
                return e.Message;
            }

        }

    }

}