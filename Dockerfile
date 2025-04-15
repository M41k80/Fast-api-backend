# Usa una imagen oficial de Python
FROM python:3.11-slim

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia los archivos necesarios
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del código
COPY . .

# Expone el puerto 8000 (Render lo necesita explícitamente)
EXPOSE 8000

# Comando para correr la app con Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
