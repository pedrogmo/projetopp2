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
            conexao = new SqlConnection("Data Source=regulus.cotuca.unicamp.br;Initial Catalog=PR118174;User ID=PR118174;Password=PR118174; Min Pool Size=5;Max Pool Size=250; Connect Timeout=3");
            conexao.Open();
        }

        public void Dispose()
        {
            conexao.Close();
        }

        public bool EhAmigo(int codUsu1, int codUsu2)
        {
            var sqlSelect = conexao.CreateCommand();
            sqlSelect.CommandText = "SELECT * FROM AMIZADE WHERE CODUSUARIO1 = @c1 AND CODUSUARIO2 = @c2";
            sqlSelect.Parameters.Add(new SqlParameter("c1", codUsu1));
            sqlSelect.Parameters.Add(new SqlParameter("c2", codUsu2));
            var resultado = sqlSelect.ExecuteReader();
            if (resultado.Read())
            {
                resultado.Close();
                return true;
            }
            resultado.Close();
            return false;
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

        public void Remover(int codUsuario1, int codUsuario2)
        {
            try
            {
                var pCod1 = new SqlParameter("c1", codUsuario1);
                var pCod2 = new SqlParameter("c2", codUsuario2);
                var sqlDelete = conexao.CreateCommand();

                sqlDelete.CommandText = "DELETE FROM AMIZADE WHERE CODUSUARIO1 = @c1 AND CODUSUARIO2 = @c2";
                sqlDelete.Parameters.Add(pCod1);
                sqlDelete.Parameters.Add(pCod2);
                sqlDelete.ExecuteNonQuery();                
            }
            catch (Exception e) { throw new SystemException(e.Message); }
        }
    }
}