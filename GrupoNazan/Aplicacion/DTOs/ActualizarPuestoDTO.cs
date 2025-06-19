using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aplicacion.DTOs
{
    public class ActualizarPuestoDTO
    {
        [Required]
        public int Empleado_Id { get; set; }
        [Required]
        public int Puesto_Id { get; set; }
    }
}
