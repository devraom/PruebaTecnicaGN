using Dominio.Repositorios;
using Entidades;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Options;
using Soporte;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositorios
{
    public class RepositorioEmpleado : IRepositorioEmpleado
    {
        private readonly string _connectionString;
        private readonly Configuracion _configuracion;
        public RepositorioEmpleado(string connectionString, IOptions<Configuracion> configuracion)
        {
            _connectionString = connectionString;
            _configuracion = configuracion.Value;
        }

        public async Task<Empleado?> ConsultarEmpleado(int id)
        {
            using var connection = new SqlConnection(_connectionString);
            using var command = connection.CreateCommand();
            command.CommandText = _configuracion.ProcedimientoAlmacenadoConsultarEmpleado;
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add(new SqlParameter("Empleado_Id", id));

            await connection.OpenAsync();
            using var reader = await command.ExecuteReaderAsync();

            if (await reader.ReadAsync())
            {
                return new Empleado
                {
                    Empleado_Id = reader.GetInt32(reader.GetOrdinal("Empleado_Id")),
                    Nombre = reader.GetString(reader.GetOrdinal("Nombre")),
                    APaterno = reader.GetString(reader.GetOrdinal("APaterno")),
                    AMaterno = reader.GetString(reader.GetOrdinal("AMaterno")),
                    Puesto_Id = reader.GetInt32(reader.GetOrdinal("Puesto_Id")),
                    Puesto = new Puesto
                    {
                        Puesto_Id = reader.GetInt32(reader.GetOrdinal("Puesto_Id")),
                        NombrePuesto = reader.GetString(reader.GetOrdinal("NombrePuesto")),
                    }
                };
            }

            return null;
        }

        public async Task<Empleado> InsertarEmpleado(Empleado empleado)
        {
            using var connection = new SqlConnection(_connectionString);
            using var command = connection.CreateCommand();
            command.CommandText = _configuracion.ProcedimientoAlmacenadoInsertarEmpleado;
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.Add(new SqlParameter("@Nombre", empleado.Nombre));
            command.Parameters.Add(new SqlParameter("@APaterno", empleado.APaterno));
            command.Parameters.Add(new SqlParameter("@AMaterno", empleado.AMaterno));
            command.Parameters.Add(new SqlParameter("@Puesto_Id", empleado.Puesto_Id));

            var outputId = new SqlParameter("Empleado_Id", System.Data.SqlDbType.Int) { Direction = System.Data.ParameterDirection.Output };
            command.Parameters.Add(outputId);

            await connection.OpenAsync();
            await command.ExecuteNonQueryAsync();

            empleado.Empleado_Id = (int)outputId.Value;
            return empleado;
        }

        public async Task<bool> ActualizarPuesto(int Empleado_Id, int Puesto_Id)
        {
            using var connection = new SqlConnection(_connectionString);
            using var command = connection.CreateCommand();
            command.CommandText = _configuracion.ProcedimientoAlmacenadoActualizarPuestoEmpleado;
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.Add(new SqlParameter("@Empleado_Id", Empleado_Id));
            command.Parameters.Add(new SqlParameter("@Puesto_Id", Puesto_Id));

            await connection.OpenAsync();
            int rowsAffected = await command.ExecuteNonQueryAsync();

            return rowsAffected > 0;
        }

        public async Task<decimal?> ConsultarSueldoMensual(int Empleado_Id)
        {
            using var connection = new SqlConnection(_connectionString);
            using var command = connection.CreateCommand();
            command.CommandText = _configuracion.ProcedimientoAlmacenadoConsultarSueldoMensualEmpleado;
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add(new SqlParameter("Empleado_Id", Empleado_Id));

            await connection.OpenAsync();
            var result = await command.ExecuteScalarAsync();

            if (result != null && decimal.TryParse(result.ToString(), out var sueldo))
                return sueldo;

            return null;
        }
    }
}
