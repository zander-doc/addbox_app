# ADDBOX APP – Sistema de Inspecciones Técnicas

ADDBOX APP es una aplicación profesional de inspecciones de obra,
con arquitectura offline-first, medición BLE con Bosch GLM 50-27,
PDF corporativo, compresión de fotos y sincronización en la nube.

## 🚀 Tecnologías principales
- Flutter (BSD)
- SQLite (sqflite)
- Firebase / PocketBase (sync)
- flutter_blue_plus (BLE)
- pdf + printing
- Riverpod

## 🏗 Arquitectura
lib/
  core/        → Base del sistema (DB, BLE, Sync)
  features/    → Módulos funcionales (inspección, fotos, PDF)
  shared/      → Widgets y utilidades comunes

## 📦 Funcionalidades
- Inspecciones offline
- Medición automática (m2, m, pza, und, sg)
- Integración BLE con Bosch GLM
- Fotos comprimidas
- Reportes PDF profesionales
- Sincronización automática

## 📅 Roadmap
Semana 1: DB + UI dinámica  
Semana 2: BLE  
Semana 3: Fotos  
Semana 4: PDF  
Semana 5: Sync  
Semana 6: Pruebas de campo  

## 🧑‍💻 Autor
ADDBOX Constructora – Alexander García
