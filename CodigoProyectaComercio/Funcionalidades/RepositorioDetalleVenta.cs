﻿using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Funcionalidades
{
    public class RepositorioDetalleVenta
    {
        public List<DetalleVenta> ListarConSp()
        {
            List<DetalleVenta> listarDetallesVenta = new List<DetalleVenta>();
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearSp("SelDetallesVenta");
                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    DetalleVenta aux = new DetalleVenta();

                    aux.IdDetalleVenta = (int)accesoDatos.Lector["IdDetalleVenta"];
                    aux.IdVenta = (int)accesoDatos.Lector["IdVenta"];
                    aux.IdProducto = (int)accesoDatos.Lector["IdProducto"];
                    aux.Cantidad = (int)accesoDatos.Lector["Cantidad"];
                    aux.PrecioUnitario = (decimal)accesoDatos.Lector["PrecioUnitario"];
                    aux.Subtotal = (decimal)accesoDatos.Lector["Subtotal"];

                    listarDetallesVenta.Add(aux);
                }

                accesoDatos.cerrarConexion();
                return listarDetallesVenta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
