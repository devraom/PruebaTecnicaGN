using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aplicacion.DTOs
{
    public class EmpleadoDTO
    {

        [Required]
        public string Nombre { get; set; }

        [Required]
        public string APaterno { get; set; }

        [Required]
        public string AMaterno { get; set; }

        [Required]
        public int Puesto_Id { get; set; }
    }
}
