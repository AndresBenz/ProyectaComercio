# 🌿 AgroAdmin — Sistema de Gestión Comercial

Sistema web completo para la gestión de ventas, compras e inventario de una empresa agroquímica. Desarrollado como proyecto integrador de la Tecnicatura en Programación (UTN).

---

## 📋 Descripción

AgroAdmin permite a los empleados y administradores de un negocio agroquímico gestionar de forma eficiente sus operaciones diarias: desde el control de stock hasta la facturación de ventas, con reportes detallados y manejo de roles de usuario.

---

## ✨ Funcionalidades principales

### 🛒 Gestión de Ventas
- Registro de ventas con selección de cliente y productos
- Validación de stock en tiempo real antes de confirmar la venta
- Cálculo automático de precios con porcentaje de ganancia configurable
- Generación y descarga de **facturas en PDF**
- Historial completo de ventas

### 📦 Gestión de Compras
- Registro de compras por proveedor
- Actualización automática del inventario al ingresar una compra
- Historial de compras con detalle de productos y precios

### 🗃️ Gestión de Inventario
- ABM de productos (fertilizantes, pesticidas, semillas, herramientas, etc.)
- Control de **stock actual y stock mínimo**
- Categorización por marca y tipo de producto
- Asociación de productos a uno o múltiples proveedores

### 👥 Clientes y Proveedores
- ABM completo de clientes y proveedores
- Historial de compras por cliente
- Detalle de productos suministrados por proveedor

### 📊 Reportes
- Reportes de ventas, compras, stock, clientes y proveedores
- **Filtros avanzados** por fecha, producto, cliente y más

### 🔐 Seguridad y Roles
- Sistema de autenticación con perfiles de usuario
- **Rol Vendedor**: acceso al registro de ventas
- **Rol Administrador**: acceso completo al sistema
- ABM de usuarios desde el panel de administración

---

## 🛠️ Tecnologías utilizadas

| Capa | Tecnología |
|------|-----------|
| Backend | C# / ASP.NET Web Forms |
| Base de datos | SQL Server |
| Frontend | HTML, CSS, ASP.NET |
| Generación PDF | Reportes con descarga directa |
| Control de versiones | Git / GitHub |

---

## 🗄️ Base de datos

El archivo `BD.sql` en la raíz del repositorio contiene el script completo para crear y poblar la base de datos con datos de prueba.


---


## 👨‍💻 Autor

**Andrés Benítez**  
Tecnicatura en Programación — UTN General Pacheco  
[GitHub](https://github.com/AndresBenz)

---

> Proyecto académico desarrollado con foco en la aplicación de patrones reales de software empresarial.
