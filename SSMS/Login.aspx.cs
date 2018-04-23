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

namespace SSMS
{
    public partial class Login : System.Web.UI.Page
    {

        //For Purushottam's database server
        protected static string connectingStringSSMS = "Data Source=DESKTOP-JI61OUF\\SQLEXPRESS; Initial Catalog=SSMS; Integrated Security=True; MultipleActiveResultSets=true";

        //For Pankaj's database server
        //protected static string connectingStringSSMS = "Data Source=DESKTOP-1NMRQA9\\SQLEXPRESS; Initial Catalog=SSMS; Integrated Security=True; MultipleActiveResultSets=true";

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Name"] == null)
            {

            }
            else
            {
                Response.Redirect("Index.aspx");
                System.Diagnostics.Debug.WriteLine("Supplier Session username: " + Session["Name"].ToString());
            }
        }

        [WebMethod]
        public static string VerifyLoginCredentials(string username, string password)
        {

            try
            {

                SqlConnection connection = new SqlConnection(connectingStringSSMS);
                connection.Open();

                SqlCommand cmdVerifyUser = new SqlCommand
                {
                    Connection = connection,
                    CommandText = "SELECT user_name, full_name, user_type, password FROM users WHERE user_name = '"+username+"' AND password = '"+password+"'",
                    CommandType = CommandType.Text
                };

                SqlCommand cmdVerifyUsername = new SqlCommand
                {
                    Connection = connection,
                    CommandText = "SELECT user_name FROM users WHERE user_name = '"+username+"'",
                    CommandType = CommandType.Text
                };

                SqlDataReader credentialsReader = cmdVerifyUser.ExecuteReader();
                //return credentialsReader.HasRows.ToString();
                if (credentialsReader.HasRows)
                {
                    while (credentialsReader.Read())
                    {
                        HttpContext.Current.Session["Full_Name"] = credentialsReader.GetValue(1);
                        HttpContext.Current.Session["User_Type"] = credentialsReader.GetValue(2);
                    }
                    HttpContext.Current.Session["Name"] = username;
                    System.Diagnostics.Debug.WriteLine("Login Session username: " + HttpContext.Current.Session["Name"].ToString());
                    credentialsReader.Close();
                    connection.Close();
                    connection.Dispose();
                    return ("1");
                }
                else
                {
                    SqlDataReader usernameCredentialsReader = cmdVerifyUsername.ExecuteReader();
                    if (usernameCredentialsReader.HasRows)
                    {
                        usernameCredentialsReader.Close();
                        connection.Close();
                        connection.Dispose();
                        return ("2");
                    }
                    else
                    {
                        usernameCredentialsReader.Close();
                        connection.Close();
                        connection.Dispose();
                        return ("0");
                    }
                }


            }
            catch (Exception e)
            {
                return e.GetType().ToString();
            }

        }
    }
}