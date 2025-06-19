using Aplicacion.Interfaces;
using Aplicacion.Servicios;
using Dominio.Repositorios;
using Repositorios;
using Soporte;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.Configure<Configuracion>(
    builder.Configuration.GetSection("Configuracion"));

builder.Services.AddScoped(sp =>
    builder.Configuration.GetConnectionString("CadenaConexion"));

builder.Services.AddScoped<IServicioEmpleado, ServicioEmpleado>();
builder.Services.AddScoped<IRepositorioEmpleado, RepositorioEmpleado>();

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
