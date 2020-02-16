<%@ WebHandler Language="C#" Class="FileCS" %>
 
using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public class FileCS : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-5UR56DA\SNIPE;Initial Catalog=FormValidationStockage;User ID=sa;Password=R#4@6n-D");

        int id = int.Parse(context.Request.QueryString["Id"]);
        byte[] bytes;
        string fileName, contentType;
        
       
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT NomFichier, Data, ContentType FROM Contact WHERE ContactID=@ContactID";
                cmd.Parameters.AddWithValue("@ContactID", id);
                cmd.Connection = sqlCon;
                sqlCon.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["Data"];
                    contentType = sdr["ContentType"].ToString();
                    fileName = sdr["NomFichier"].ToString();
                }
                sqlCon.Close();
            
        }
 
        context.Response.Buffer = true;
        context.Response.Charset = "";
        if (context.Request.QueryString["download"] == "1")
        {
            context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        }
        context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        context.Response.ContentType = "application/pdf";
        context.Response.BinaryWrite(bytes);
        context.Response.Flush();
        context.Response.End();
    }
 
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}