# Kit de Optimización Total 2026: Limpiador de Android
# Este script está diseñado para ejecutarse en un entorno Python en Android (como Pydroid 3 o Termux).
# Realiza una limpieza de archivos temporales y carpetas de caché comunes.

import os
import shutil

def limpiar_carpeta(ruta):
    print(f"Limpiando: {ruta}")
    if os.path.exists(ruta):
        try:
            for item in os.listdir(ruta):
                item_path = os.path.join(ruta, item)
                if os.path.isfile(item_path):
                    os.remove(item_path)
                elif os.path.isdir(item_path):
                    shutil.rmtree(item_path)
            print(f"Éxito: {ruta} limpiada.")
        except Exception as e:
            print(f"Error al limpiar {ruta}: {e}")
    else:
        print(f"Aviso: La ruta {ruta} no existe.")

def main():
    print("--- Iniciando Limpiador de Android 2026 ---")

    # Rutas comunes de caché y temporales en Android
    # Nota: El acceso a estas rutas puede variar según la versión de Android y los permisos de la aplicación.
    rutas_a_limpiar = [
        "/sdcard/Android/data/com.android.providers.downloads/cache",
        "/sdcard/Download/.cache",
        "/sdcard/WhatsApp/Media/.Statuses",
        "/sdcard/Android/media/com.whatsapp/WhatsApp/Media/.Statuses",
    ]

    for ruta in rutas_a_limpiar:
        limpiar_carpeta(ruta)

    print("--- Limpieza Completada ---")
    print("Nota: Para una limpieza profunda de aplicaciones, utiliza la configuración del sistema.")

if __name__ == "__main__":
    main()
