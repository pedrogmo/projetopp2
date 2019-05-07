using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;
using System.Data.SqlClient;

namespace apBioPlay.DAO
{
    public class LicoesFeitasDAO : IDisposable
    {
        private SqlConnection conexao , conexao2;

        public LicoesFeitasDAO()
        {
            conexao = new SqlConnection("Data Source=regulus.cotuca.unicamp.br;Initial Catalog=PR118174;User ID=PR118174;Password=PR118174");
            conexao.Open();
            conexao2 = new SqlConnection("Data Source=regulus.cotuca.unicamp.br;Initial Catalog=PR118174;User ID=PR118174;Password=PR118174");
            conexao2.Open();
        }

        public int[] Dados(int u)
        {
            int[] ret = new int[3];
            for (int i = 0; i < 3; i++)
                ret[i] = 0;
            var sqlSelect = conexao.CreateCommand();

            sqlSelect.CommandText = "SELECT * FROM USUARIOLICAO WHERE CODUSUARIO = @c";
            var paramCodU = new SqlParameter("c", u);
            sqlSelect.Parameters.Add(paramCodU);

            var resultado = sqlSelect.ExecuteReader();
            while (resultado.Read())
            {
                var selectPerguntas = conexao2.CreateCommand();
                selectPerguntas.CommandText = "SELECT * FROM PERGUNTA WHERE CODLICAO = @cL";
                var paramCodL = new SqlParameter("cL", Convert.ToInt32(resultado["codLicao"]));
                selectPerguntas.Parameters.Add(paramCodL);
                var resultado2 = selectPerguntas.ExecuteReader();
                while (resultado2.Read())
                    ret[0]++;
                ret[1] += Convert.ToInt32(resultado["acertos"]);
                resultado2.Close();
            }
            ret[2] = ret[0] - ret[1];
            resultado.Close();
            return ret;
        }

        internal void Adicionar(int codUsuario, int codLicao, int acertos)
        {
            try
            {
                var sqlInsert = conexao.CreateCommand();
                sqlInsert.CommandText = "INSERT INTO USUARIOLICAO (codUsuario, codLicao, data, acertos) VALUES (@codU, @codL, @dt, @a)";
                var paramCodU = new SqlParameter("codU", codUsuario);
                sqlInsert.Parameters.Add(paramCodU);
                var paramCodL = new SqlParameter("codL", codLicao);
                sqlInsert.Parameters.Add(paramCodL);
                var paramData = new SqlParameter("dt", DateTime.Now);
                sqlInsert.Parameters.Add(paramData);
                var paramAcertos = new SqlParameter("a", acertos);
                sqlInsert.Parameters.Add(paramAcertos);
                sqlInsert.ExecuteNonQuery();
            }
            catch (Exception e) { throw new SystemException(e.Message); }
        }        

        public void Dispose()
        {
            conexao.Close();
        }
    }
}