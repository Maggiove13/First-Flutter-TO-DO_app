# Instrucciones para usar la aplicación de Organizador de Tareas

¡Bienvenido a tu aplicación de organizador de tareas! Esta aplicación te ayudará a mantener tus actividades organizadas y te motivará con frases inspiradoras. A continuación, te explicamos cómo usarla.

---

## **¿Qué hace esta aplicación?**
1. **Organiza tus tareas**: Puedes agregar, ver y eliminar tareas fácilmente.
2. **Frases motivadoras**: Obtén frases inspiradoras para mantenerte motivado durante el día.
3. **Fácil de usar**: La aplicación tiene una interfaz sencilla e intuitiva.

---

## **Cómo usar la aplicación**

### **1. Pantalla de Bienvenida**
Al abrir la aplicación, verás la pantalla de bienvenida. Aquí puedes:
- **Ir a la lista de tareas**: Presiona el botón **"Lista de Tareas"**.
- **Obtener frases motivadoras**: Presiona el botón **"Inspiración Diaria"**.

---

### **2. Lista de Tareas**
En esta pantalla puedes:
- **Agregar una tarea**:
  1. Escribe la tarea en el campo de texto.
  2. Presiona el botón **"+"** o el ícono de agregar en la parte inferior derecha.
- **Eliminar una tarea**:
  1. Desliza la tarea hacia la izquierda o presiona el ícono de basura junto a la tarea.
- **Eliminar todas las tareas**:
  1. Presiona el ícono de basura en la barra superior.

---

### **3. Frases Motivadoras**
En esta pantalla puedes:
- **Obtener una nueva frase**: Presiona el botón **"Nueva Frase"**.
- **Leer frases inspiradoras**: La aplicación te mostrará una frase aleatoria cada vez que presiones el botón.

---

## **Preguntas frecuentes**

### **¿Cómo se guardan las tareas?**
Las tareas se guardan automáticamente en tu dispositivo. No necesitas hacer nada adicional para guardarlas.

### **¿Qué pasa si no tengo conexión a internet?**
La aplicación funciona sin conexión a internet para la lista de tareas. Para las frases motivadoras, si no hay conexión, la aplicación mostrará una frase predefinida.

### **¿Puedo cambiar el tema de la aplicación?**
Por ahora, la aplicación tiene un tema predeterminado, pero puedes personalizarlo en futuras actualizaciones.

---

## **Consejos para usar la aplicación**
- **Mantén tu lista actualizada**: Elimina las tareas que ya hayas completado.
- **Usa las frases motivadoras**: Presiona el botón de "Nueva Frase" cuando necesites un impulso de motivación.
- **Explora todas las funciones**: No dudes en probar todas las opciones que ofrece la aplicación.


---
## **Cómo construir la aplicación para Android y iPhone**.

##### Si quieres construir la aplicación para Android o iPhone, sigue estos pasos:

#### **1. Requisitos previos**
- Flutter instalado**: Asegúrate de que tienes Flutter instalado en tu ordenador. Si no lo tienes, sigue las instrucciones en [flutter.dev](https://flutter.dev).
- Android Studio (para Android)**: Necesitas Android Studio para configurar el entorno de desarrollo de Android.
- Xcode (para iPhone)**: Necesitas tener Xcode instalado en un Mac para crear la aplicación para iPhone.

---

#### **2. Construir para Android**
1. Abre un terminal en la carpeta de tu proyecto.
2. Conecta un dispositivo Android o abre un emulador.
3. Ejecuta el siguiente comando:
   ````bash Copiar
   flutter build apk
   ````
Esto generará un archivo .apk en la carpeta build/app/outputs/apk/release/.

4. **Para instalar la aplicación en tu dispositivo:**

    1. **Activa el modo desarrollador**:
       - Ve a **Configuración** > **Acerca del teléfono**.
       - Toca **Número de compilación** 7 veces para activar el modo desarrollador.
    2. **Activar la depuración USB**:
       - Ve a **Configuración** > **Opciones de desarrollador** > Activar **Depuración USB**.
    3. **Conecta el teléfono al ordenador**:
       - Utiliza un cable USB que permita la transferencia de datos.
    4. **Ejecuta la aplicación de prueba**:
       - Abre un terminal en la carpeta de tu proyecto y ejecuta:
         ````bash
         flutter run
         `````
       - La aplicación se instalará y ejecutará en tu teléfono.
    
---
#### **3. Construir para iPhone**
1. Abre un terminal en la carpeta de tu proyecto.

2. Conecta un dispositivo iPhone o abre un simulador desde Xcode.

3. Ejecuta el siguiente comando:

    ````bash Copiar
    flutter build ios
    ````
4. Abre el proyecto en Xcode:

    ````bash Copiar
    open ios/Runner.xcworkspace
    ````
5. En Xcode, selecciona tu dispositivo o simulador y pulsa el botón «Run» (▶️).
