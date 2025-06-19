using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Soporte.Http
{
    public class Respuesta<T>
    {
        public T datos { get; set; }
        public int estatus { get; set; }
        public string mensaje { get; set; } = "";
        public int codigo { get; set; }
    }
}
