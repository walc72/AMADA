# 🏪 AMADA — Control de Tienda

Sistema de gestión para una tienda de almacén, en **un solo archivo HTML**. Sin servidor, sin instalación, sin internet: se abre con doble clic en Chrome o Edge.

## Cómo usarlo

1. Descargá `AMADA.html` y guardalo en una carpeta de tu computadora.
2. Abrilo con doble clic (se abre en el navegador).
3. En la pestaña **💾 Respaldo**, tocá **📁 Conectar archivo de datos** para que todo se guarde automáticamente en un archivo real (`AMADA-datos.json`).
4. Para probarlo con datos de ejemplo: **💾 Respaldo → 🎮 Cargar datos demo**.

## Funciones

| Pestaña | Qué hace |
|---|---|
| 🛒 **Vender** | Punto de venta: carrito, medios de pago (efectivo/tarjeta/transferencia/fiado), ticket imprimible, descuento automático de stock |
| 📦 **Productos** | Inventario con costo, precio, ganancia y alerta de stock bajo. Importación por CSV (productos nuevos y reposición de stock) |
| 👤 **Clientes** | Fichas con teléfono y notas, historial de compras filtrable por día/mes |
| 📒 **Fiado** | Cuentas corrientes: tickets pendientes cobrables uno a uno o todo junto, pagos parciales, filtros por cliente y período, exportación a Excel |
| 💵 **Caja** | Cierre de caja diario: ventas por medio de pago, control de efectivo contado y diferencias |
| 📊 **Reportes** | Diario / semanal / mensual con navegación rápida, gráfico de ventas, ganancia estimada, ranking de más y menos vendidos, exportación a Excel |
| 💾 **Respaldo** | Guardado automático en archivo, copias de seguridad manuales, datos demo y restauración |

## Cómo se guardan los datos

- En el **navegador** (localStorage) — siempre.
- En un **archivo real** (`AMADA-datos.json`) mediante la File System Access API de Chrome/Edge — recomendado. Si el navegador borra sus datos, el sistema los recupera solo desde el archivo.
- En la **nube (Supabase)** — opcional: conectando un proyecto gratuito de Supabase, los datos se sincronizan por internet y se puede entrar desde cualquier dispositivo con un **código de tienda** que genera la app. La configuración inicial está en `supabase-setup.sql` y en la pestaña Respaldo de la app.
- El archivo de datos y las copias de seguridad **no se suben a este repositorio** (están en `.gitignore`): contienen información del negocio.

## Archivos

- `AMADA.html` — la aplicación completa (HTML + CSS + JS, sin dependencias).
- `Datos_demo_AMADA.json` — datos de demostración (un mes de ventas simuladas); también están incrustados en la app.

---

Hecho con [Claude Code](https://claude.com/claude-code).
