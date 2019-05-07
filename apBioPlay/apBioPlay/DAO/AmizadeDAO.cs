using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;
using System.Data.SqlClient;

namespace apBioPlay.DAO
{
    public class AmizadeDAO : IDisposable
    {
        private SqlConnection conexao;

        public AmizadeDAO()
        {
            conexao = new SqlConnection("Data Source=regulus.cotuca.unicamp.br;Initial Catalog=PR118174;User ID=PR118174;Password=PR118174");
            conexao.Open();
        }

        public void Dispose()
        {
            conexao.Close();
        }

        public List<Usuario> Amigos(int codU)
        {
            var ret = new List<Usuario>();
            var sqlSelect = conexao.CreateCommand();
            sqlSelect.CommandText = "SELECT * FROM AMIZADE WHERE CODUSUARIO1 = @c";
            var paramCodU = new SqlParameter("c", codU);
            sqlSelect.Parameters.Add(paramCodU);
            var usuarios = new UsuariosDAO();
            var resultado = sqlSelect.ExecuteReader();
            while (resultado.Read())
            {
                var amigo = usuarios.Buscar(u => u.Codigo == Convert.ToInt32(resultado["codUsuario2"]));
                ret.Add(amigo);                
            }
            resultado.Close();
            return ret;
        }

        public void Adicionar(int codUsuario1, int codUsuario2)
        {
            try
            {
                var sqlInsert = conexao.CreateCommand();
                sqlInsert.CommandText = "INSERT INTO AMIZADE (codUsuario1, codUsuario2) VALUES (@cod1, @cod2)";
                var paramCod1 = new SqlParameter("cod1", codUsuario1);
                sqlInsert.Parameters.Add(paramCod1);
                var paramCod2 = new SqlParameter("cod2", codUsuario2);
                sqlInsert.Parameters.Add(paramCod2);                
                sqlInsert.ExecuteNonQuery();
            }
            catch (Exception e) { throw new SystemException(e.Message); }
        }
    }
}