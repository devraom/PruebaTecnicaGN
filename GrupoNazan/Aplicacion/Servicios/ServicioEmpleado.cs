using Aplicacion.DTOs;
using Aplicacion.Interfaces;
using Dominio.Repositorios;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aplicacion.Servicios
{
    public class ServicioEmpleado : IServicioEmpleado
    {
        private readonly IRepositorioEmpleado _repositorioEmpleado;

        public ServicioEmpleado(IRepositorioEmpleado repositorioEmpleado)
        {
            _repositorioEmpleado = repositorioEmpleado;
        }

        public async Task<bool> ActualizarPuesto(int Empleado_Id, int Puesto_Id)
        {
            return await _repositorioEmpleado.ActualizarPuesto(Empleado_Id, Puesto_Id);
        }

        public async Task<Empleado?> ConsultarEmpleado(int id)
        {
            return await _repositorioEmpleado.ConsultarEmpleado(id);
        }

        public async Task<decimal?> ConsultarSueldoMensual(int Empleado_Id)
        {
            return await _repositorioEmpleado.ConsultarSueldoMensual(Empleado_Id);
        }

        public async Task<Empleado> InsertarEmpleado(EmpleadoDTO empleado)
        {
            return await _repositorioEmpleado.InsertarEmpleado(new Empleado
            {
                Nombre = empleado.Nombre,
                APaterno = empleado.APaterno,
                AMaterno = empleado.AMaterno,
                Puesto_Id = empleado.Puesto_Id,
            });
        }
    }
}
