using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace BookStoreDB.DAL
{
   public  class BaseRepository
    {
        protected IDbConnection connect;
        public BaseRepository()
        {
            connect = new SqlConnection(@"Data Source=.;Initial Catalog=BookStoreDB;Integrated Security=True");
        }
    }
}
