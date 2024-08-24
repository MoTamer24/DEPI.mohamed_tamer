using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Microsoft.VisualBasic.FileIO;
using System.Security.Cryptography;
namespace Ado.Net
{
    internal partial class Program
    {
        public static List<User> users = new List<User>();
        static void Main(string[] args)
        {

     
            ImportCsv();
            try
            {
                var connectionStr = "Server=.;Database=UsersDB;Integrated Security=SSPI" +
                   ";TrustServerCertificate=True";
                using (var SqlConnect = new SqlConnection(connectionStr))
                {
                    SqlConnect.Open();
                    var cmd = new SqlCommand("adduser", SqlConnect);
                    cmd.CommandType = CommandType.StoredProcedure;

                    foreach (User user in users)
                    {
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@name", user.Name);
                        cmd.Parameters.AddWithValue("@password", user.Password);
                        cmd.Parameters.AddWithValue("@email", user.Email);
                        cmd.Parameters.AddWithValue("@status", user.Status);
                        cmd.Parameters.AddWithValue("@address1", user.Address1);
                        cmd.Parameters.AddWithValue("@address2", user.Address2);
                        cmd.Parameters.AddWithValue("@city", user.City);
                        cmd.Parameters.AddWithValue("@state", user.State);
                        cmd.Parameters.AddWithValue("@countryId", user.CountryId);
                        cmd.Parameters.AddWithValue("@postal", user.PostalCode);
                        cmd.Parameters.AddWithValue("@createdAt", user.CreatedAt);
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            Console.WriteLine("Success");
                        }
                        else { Console.WriteLine("Error"); }

                    }
                    SqlConnect.Close();
                }
            }
            catch(Exception ex) 
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
