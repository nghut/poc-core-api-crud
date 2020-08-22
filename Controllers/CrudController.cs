using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;
using System.Reflection;
using Newtonsoft.Json;
using System.Text;

namespace poc_core_api_crud.Controllers
{

    public class Status
    {
        public int Code { get; set; }
        public string Message { get; set; }
    }
    public class Employee
    {
        public int? EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public int? Age { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public string EmailID { get; set; }
        public Int64? MobileNumber { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public bool? IsActive { get; set; }
        public DateTime? CreatedDateTime { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifiedDateTime { get; set; }
        public string ModifiedBy { get; set; }
    }
    [Route("api/[controller]")]
    public class CrudController : Controller
    {
        private readonly string connectionstring = "Server=NAVEEN\\MSSQLSERVER_2016;Database=company;User Id=sa;Password=12345;";

        public string DataTableToJSON(DataTable table)
        {
            var JSONString = new StringBuilder();
            if (table.Rows.Count > 0)
            {
                JSONString.Append("[");
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    JSONString.Append("{");
                    for (int j = 0; j < table.Columns.Count; j++)
                    {
                        if (j < table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == table.Rows.Count - 1)
                    {
                        JSONString.Append("}");
                    }
                    else
                    {
                        JSONString.Append("},");
                    }
                }
                JSONString.Append("]");
            }
            return JSONString.ToString();
        }
        // GET api/Crud
        [HttpGet]
        public IActionResult Get()
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(connectionstring);
            SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM [dbo].[Employee]", con);
            sda.Fill(dt);
            string result = DataTableToJSON(dt);
            return Ok(result);
        }
        // GET api/Crud/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                DataTable dt = new DataTable();
                SqlDataAdapter sda = new SqlDataAdapter($"SELECT * FROM [dbo].[Employee] WHERE EmployeeID = {id}", con);
                sda.Fill(dt);
                string result = DataTableToJSON(dt);
                return Ok(result);
            }
        }

        // POST api/Crud
        [HttpPost]
        public IActionResult Post([FromBody] Employee data)
        {
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO dbo.Employee (EmployeeName,Age,EmailID,MobileNumber,Address,City,State,IsActive,CreatedDateTime,CreatedBy)VALUES(@EmployeeName,@Age,@EmailID,@MobileNumber,@Address,@City,@State,@IsActive,@CreatedDateTime,@CreatedBy)"))
                {
                    cmd.Parameters.AddWithValue("@EmployeeName", data.EmployeeName);
                    cmd.Parameters.AddWithValue("@Age", data.Age);
                    cmd.Parameters.AddWithValue("@EmailID", data.EmailID);
                    cmd.Parameters.AddWithValue("@MobileNumber", data.MobileNumber);
                    cmd.Parameters.AddWithValue("@Address", data.Address);
                    cmd.Parameters.AddWithValue("@City", data.City);
                    cmd.Parameters.AddWithValue("@State", data.State);
                    cmd.Parameters.AddWithValue("@IsActive", true);
                    cmd.Parameters.AddWithValue("@CreatedDateTime", DateTime.UtcNow);
                    cmd.Parameters.AddWithValue("@CreatedBy", "User");
                    cmd.Connection = con;
                    con.Open();
                    int count = cmd.ExecuteNonQuery();
                    con.Close();
                    var Status = new Status();
                    if (count > 0)
                    {
                        Status.Code = 1;
                        Status.Message = "Created successfully";
                    }
                    else
                    {
                        Status.Code = -1;
                        Status.Message = "Failed";
                    }
                    return Ok(Status);
                }
            }
        }

        // PUT api/Crud/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] Employee data)
        {
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE dbo.Employee set EmployeeName = @EmployeeName,Age = @Age,EmailID = @EmailID,MobileNumber= @MobileNumber,Address = @Address,City = @City,State = @State,ModifiedDateTime = @ModifiedDateTime,ModifiedBy = @ModifiedBy WHERE EmployeeID = @EmployeeID"))
                {
                    cmd.Parameters.AddWithValue("@EmployeeID", data.EmployeeID);
                    cmd.Parameters.AddWithValue("@EmployeeName", data.EmployeeName);
                    cmd.Parameters.AddWithValue("@Age", data.Age);
                    cmd.Parameters.AddWithValue("@EmailID", data.EmailID);
                    cmd.Parameters.AddWithValue("@MobileNumber", data.MobileNumber);
                    cmd.Parameters.AddWithValue("@Address", data.Address);
                    cmd.Parameters.AddWithValue("@City", data.City);
                    cmd.Parameters.AddWithValue("@State", data.State);
                    cmd.Parameters.AddWithValue("@ModifiedDateTime", DateTime.UtcNow);
                    cmd.Parameters.AddWithValue("@ModifiedBy", "User");
                    cmd.Connection = con;
                    con.Open();
                    int count = cmd.ExecuteNonQuery();
                    con.Close();
                    var Status = new Status();
                    if (count > 0)
                    {
                        Status.Code = 1;
                        Status.Message = "Created successfully";
                    }
                    else
                    {
                        Status.Code = -1;
                        Status.Message = "Failed";
                    }
                    return Ok(Status);
                }
            }
        }

        // DELETE api/Crud/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM [dbo].[Employee] WHERE EmployeeID = @EmployeeID"))
                {
                    cmd.Parameters.AddWithValue("@EmployeeID", id);
                    cmd.Connection = con;
                    con.Open();
                    int count = cmd.ExecuteNonQuery();
                    con.Close();
                    var Status = new Status();
                    if (count > 0)
                    {
                        Status.Code = 1;
                        Status.Message = "Deleted successfully";
                    }
                    else
                    {
                        Status.Code = -1;
                        Status.Message = "Record not found";
                    }
                    return Ok(Status);
                }
            }
        }
    }
}
