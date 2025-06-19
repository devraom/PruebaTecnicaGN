using Aplicacion.DTOs;
using Aplicacion.Interfaces;
using Entidades;
using Microsoft.AspNetCore.Mvc;
using Soporte.Http;

namespace GrupoNazan.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class EmpleadoController : ControllerBase
    {
        private IServicioEmpleado _servicioEmpleado;

        public EmpleadoController(IServicioEmpleado servicioEmpleado)
        {
            _servicioEmpleado = servicioEmpleado;
        }

        [HttpGet("{Empleado_Id}")]
        public async Task<ActionResult<Respuesta<Empleado>>> ConsultarEmpleado(int Empleado_Id)
        {
            try
            {
                var empleado = await _servicioEmpleado.ConsultarEmpleado(Empleado_Id);

                if (empleado == null)
                {
                    return NotFound(new Respuesta<Empleado>
                    {
                        datos = null,
                        estatus = 404,
                        mensaje = "Empleado no encontrado",
                        codigo = 1,
                    });
                }

                return Ok(new Respuesta<Empleado>
                {
                    datos = empleado,
                    estatus = 200,
                    mensaje = "Empleado encontrado exitosamente",
                    codigo = 1,
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new Respuesta<Empleado>
                {
                    datos = null,
                    estatus = 500,
                    codigo = 0,
                    mensaje = $"Error del servidor: {ex.Message}"
                });
            }
        }

        [HttpPost("CrearEmpleado")]
        public async Task<ActionResult<Respuesta<Empleado>>> InsertarEmpleado([FromBody] EmpleadoDTO empleado)
        {
            try
            {
                if (empleado == null || string.IsNullOrWhiteSpace(empleado.Nombre))
                {
                    return BadRequest(new Respuesta<Empleado>
                    {
                        datos = null,
                        estatus = 400,
                        codigo = 1,
                        mensaje = "El empleado es inválido o incompleto."
                    });
                }

                var empleadoInsertado = await _servicioEmpleado.InsertarEmpleado(empleado);

                var respuesta = new Respuesta<Empleado>
                {
                    datos = empleadoInsertado,
                    estatus = 201,
                    codigo = 1,
                    mensaje = "Empleado insertado correctamente."
                };

                return StatusCode(201, respuesta);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new Respuesta<Empleado>
                {
                    datos = null,
                    estatus = 500,
                    codigo = 0,
                    mensaje = $"Error del servidor: {ex.Message}"
                });
            }
        }

        [HttpPut("CambiarPuesto")]
        public async Task<ActionResult<Respuesta<object>>> ActualizarPuesto([FromBody] ActualizarPuestoDTO actualizarPuesto)
        {
            try
            {
                if (actualizarPuesto.Empleado_Id <= 0 || actualizarPuesto.Puesto_Id <= 0)
                {
                    return BadRequest(new Respuesta<object>
                    {
                        datos = null,
                        estatus = 400,
                        codigo = 1,
                        mensaje = "Los valores enviados no son válidos."
                    });
                }

                var actualizado = await _servicioEmpleado.ActualizarPuesto(actualizarPuesto.Empleado_Id, actualizarPuesto.Puesto_Id);

                if (!actualizado)
                {
                    return NotFound(new Respuesta<object>
                    {
                        datos = null,
                        estatus = 404,
                        codigo = 0,
                        mensaje = "No se encontró el empleado o no se pudo actualizar."
                    });
                }

                return Ok(new Respuesta<object>
                {
                    datos = null,
                    estatus = 200,
                    codigo = 1,
                    mensaje = "Puesto del empleado actualizado correctamente."
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new Respuesta<object>
                {
                    datos = null,
                    estatus = 500,
                    codigo = 0,
                    mensaje = $"Error del servidor: {ex.Message}"
                });
            }
        }

        [HttpGet("{Empleado_Id}/SueldoMensual")]
        public async Task<ActionResult<Respuesta<decimal>>> ObtenerSueldoMensual(int Empleado_Id)
        {
            var sueldo = await _servicioEmpleado.ConsultarSueldoMensual(Empleado_Id);

            if (sueldo == null)
            {
                return NotFound(new Respuesta<decimal>
                {
                    datos = 0,
                    estatus = 404,
                    codigo = 0,
                    mensaje = "No se encontró el empleado o no tiene salario asignado"
                });
            }

            return Ok(new Respuesta<decimal>
            {
                datos = sueldo.Value,
                estatus = 200,
                codigo = 1,
                mensaje = "Sueldo mensual obtenido correctamente"
            });
        }
    }
}
