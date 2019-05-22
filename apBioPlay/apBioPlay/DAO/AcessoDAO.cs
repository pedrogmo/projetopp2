using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;
using System.Data.SqlClient;

namespace apBioPlay.DAO
{
    public class AcessoDAO : IDisposable
    {
        private SqlConnection conexao;

        public AcessoDAO()
        {
            conexao = new SqlConnection("Data Source=regulus.cotuca.unicamp.br;Initial Catalog=PR118174;User ID=PR118174;Password=PR118174; Min Pool Size=5;Max Pool Size=250; Connect Timeout=3");
            conexao.Open();
        }

        public void Dispose()
        {
            conexao.Close();
        }

        public void Adicionar(int codU, DateTime data)
        {
            try
            {
                var sqlInsert = conexao.CreateCommand();
                sqlInsert.CommandText = "INSERT INTO ACESSO VALUES (@usu, @data)";
                sqlInsert.Parameters.Add(new SqlParameter("usu", codU));
                sqlInsert.Parameters.Add(new SqlParameter("data", data));
                sqlInsert.ExecuteNonQuery();
            }
            catch (Exception e) { throw new SystemException(e.Message); }
        }
    }
}