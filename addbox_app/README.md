README PRO – ADDBOX APP (versión empresarial)
Código
# ADDBOX APP – Sistema Profesional de Inspecciones Técnicas

ADDBOX APP es una aplicación móvil diseñada para inspecciones técnicas en obra,
con arquitectura offline-first, medición BLE con Bosch GLM 50‑27, reportes PDF
profesionales, comparación de fotos y sincronización en la nube.

---

## 🚀 Tecnologías Principales
- Flutter 3.x
- SQLite (modo offline)
- Firebase / PocketBase (sincronización)
- flutter_blue_plus (BLE)
- pdf + printing (reportes)
- Riverpod (gestión de estado)
- image_picker + flutter_image_compress (fotos optimizadas)

---

## 🏗 Arquitectura del Proyecto

lib/
core/                → BLE, Sync, DB
features/            → Inspección, Fotos, PDF
shared/              → Widgets, utilidades
main.dart            → Punto de entrada

Código

---

## ⚙️ Funcionalidades Principales

- Inspección offline-first  
- Medición automática según unidad:
  - m² → Largo × Ancho (BLE)
  - m → Medición directa (BLE)
  - und/pza → Contador
  - sg → Porcentaje global
- Integración BLE con Bosch GLM 50‑27  
- Fotos comparativas con compresión automática  
- Reportes PDF profesionales  
- Sincronización automática con la nube  
- Modo seguro para trabajo en campo  

---

## 🧩 Módulos Internos

- **BLE Service** → Conexión, lectura y decodificación de mediciones  
- **SQLite Local DB** → Tablas: items, inspections, inspection_results, sync_queue  
- **Sync Engine** → Cola de sincronización + reintentos  
- **PDF Generator** → Reportes corporativos  
- **Photo Service** → Captura, compresión y almacenamiento local  
- **UI Dinámica** → Factory de inputs según unidad  

---

## 🗂 Roadmap Oficial

- **Semana 1:** BLE + UI dinámica  
- **Semana 2:** Fotos + compresión  
- **Semana 3:** PDF corporativo  
- **Semana 4:** Sincronización  
- **Semana 5:** Pruebas de campo + optimización  

---

## 🧪 Pruebas en Obra

- Validación de mediciones BLE  
- Validación de fotos comparativas  
- Validación de reportes PDF  
- Validación de sincronización offline-first  

---

## ✍️ Autor

ADDBOX Constructora – Alexander García  
Villa de Cura, Aragua – Venezuela