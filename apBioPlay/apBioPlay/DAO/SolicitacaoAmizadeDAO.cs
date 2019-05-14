using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;
using System.Data.SqlClient;

namespace apBioPlay.DAO
{
    public class SolicitacaoAmizadeDAO : IDisposable
    {
        private SqlConnection conexao;

        public SolicitacaoAmizadeDAO()
        {
            conexao = new SqlConnection("Data Source=regulus.cotuca.unicamp.br;Initial Catalog=PR118174;User ID=PR118174;Password=PR118174");
            conexao.Open();
        }

        public void Dispose()
        {
            conexao.Close();
        }

        public List<Usuario> SolicitacoesPara(int codUsu2)
        {
            var ret = new List<Usuario>();
            var sqlSelect = conexao.CreateCommand();
            sqlSelect.CommandText = "SELECT * FROM SOLICITACAOAMIZADE WHERE CODUSUARIO2 = @c";
            sqlSelect.Parameters.Add(new SqlParameter("c", codUsu2));
            var resultado = sqlSelect.ExecuteReader();
            var usuDao = new UsuariosDAO();
            while (resultado.Read())
                ret.Add(usuDao.Buscar(u => u.Codigo == Convert.ToInt32(resultado["codUsuario1"])));
            resultado.Close();
            return ret;
        }

        public bool Existe(int codUsu1, int codUsu2)
        {
            var sqlSelect = conexao.CreateCommand();
            sqlSelect.CommandText = "SELECT * FROM SOLICITACAOAMIZADE WHERE CODUSUARIO1 = @c1 AND CODUSUARIO2 = @c2";
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

        public void Adicionar(int codUsuario1, int codUsuario2)
        {
            try
            {
                var sqlInsert = conexao.CreateCommand();
                sqlInsert.CommandText = "INSERT INTO SOLICITACAOAMIZADE (codUsuario1, codUsuario2) VALUES (@cod1, @cod2)";
                sqlInsert.Parameters.Add(new SqlParameter("cod1", codUsuario1));
                sqlInsert.Parameters.Add(new SqlParameter("cod2", codUsuario2));
                sqlInsert.ExecuteNonQuery();
            }
            catch (Exception e) { throw new SystemException(e.Message); }
        }

        public void Remover(int codUsuario1, int codUsuario2)
        {
            try
            {
                var sqlDelete = conexao.CreateCommand();
                sqlDelete.CommandText = "DELETE FROM SOLICITACAOAMIZADE WHERE CODUSUARIO1 = @c1 AND CODUSUARIO2 = @c2";
                sqlDelete.Parameters.Add(new SqlParameter("c1", codUsuario1));
                sqlDelete.Parameters.Add(new SqlParameter("c2", codUsuario2));
                sqlDelete.ExecuteNonQuery();
            }
            catch (Exception e) { throw new SystemException(e.Message); }
        }
    }
}