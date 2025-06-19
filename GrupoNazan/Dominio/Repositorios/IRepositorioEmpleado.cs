using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Repositorios
{
    public interface IRepositorioEmpleado
    {
        Task<Empleado?> ConsultarEmpleado(int id);
        Task<Empleado> InsertarEmpleado(Empleado empleado);
        Task<bool> ActualizarPuesto(int Empleado_Id, int Puesto_Id);
        Task<decimal?> ConsultarSueldoMensual(int Empleado_Id);
    }
}
