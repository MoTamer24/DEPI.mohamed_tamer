using Microsoft.VisualBasic.FileIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ado.Net
{
    internal partial class Program 
    {
     
        public static void ImportCsv()
        {
            var csvFilePath = @"D:\Study room\DEPI\depi tasks\users.csv";
            // import csv 
            using (TextFieldParser parser = new TextFieldParser(csvFilePath))
            {
                parser.Delimiters = new string[] { "," };
                parser.HasFieldsEnclosedInQuotes = true;
                parser.ReadFields();
                while (!parser.EndOfData)
                {
                    string[] Line = parser.ReadFields();
                    User user = new User
                    { 
                        Name = Line[1] ?? "Unknown",
                        Email = Line[2] ?? "Unknown",
                        Password = Line[3] ?? "Unknown",
                        Status = Line[4] ?? "Unknown",
                        Address1 = Line[5] ?? "Unknown",
                        Address2 = Line[6] ?? "Unknown",
                        City = Line[7] ?? "Unknown",
                        State = Line[8] ?? "Unknown",
                        PostalCode = Line[9] ?? "Unknown",
                        CountryId = string.IsNullOrEmpty(Line[10])? null:int.Parse(Line[10]) ,
                        CreatedAt = string.IsNullOrEmpty(Line[11])?DateTime.Now: DateTime.Parse(Line[11]),
                    };
                    users.Add(user);
                }
            }
        }
    }
}
