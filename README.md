# README

```markdown
# Documentación de la API de Películas

## Descripción general

Este documento proporciona detalles sobre la API, incluyendo los endpoints y las estructuras de datos utilizadas en las solicitudes y respuestas.

## Versión de la API

- **Versión**: 1.0.0
- **URL del servidor**: [http://localhost:3000](http://localhost:3000)

## Endpoints

### Categorías

#### Listar categorías

- **Método**: `GET`
- **Ruta**: `/categories`
- **Descripción**: Recupera todas las categorías.
- **Respuesta**:
  - Estado `200`: Devuelve un array de categorías.
    ```json
    [
      {
        "genero": "Acción"
      }
    ]
    ```

#### Crear categoría

- **Método**: `POST`
- **Ruta**: `/categories`
- **Descripción**: Crea una nueva categoría.
- **Cuerpo de la solicitud**:
  ```json
  {
    "genero": "Comedia"
  }
  ```
- **Respuesta**:
  - Estado `201`: Devuelve la categoría creada.
    ```json
    {
      "genero": "Comedia"
    }
    ```
  - Estado `422`: Solicitud inválida.

#### Mostrar categoría

- **Método**: `GET`
- **Ruta**: `/categories/{id}`
- **Descripción**: Recupera los detalles de una categoría específica.
- **Parámetros de ruta**:
  - `id`: ID de la categoría.
- **Respuesta**:
  - Estado `200`: Devuelve los detalles de la categoría.
  - Estado `404`: Categoría no encontrada.

#### Actualizar categoría

- **Método**: `PATCH`
- **Ruta**: `/categories/{id}`
- **Descripción**: Actualiza los detalles de una categoría específica.
- **Parámetros de ruta**:
  - `id`: ID de la categoría.
- **Cuerpo de la solicitud**:
  ```json
  {
    "genero": "Drama"
  }
  ```
- **Respuesta**:
  - Estado `200`: Devuelve la categoría actualizada.
  - Estado `404`: Categoría no encontrada.
  - Estado `422`: Solicitud inválida.

#### Eliminar categoría

- **Método**: `DELETE`
- **Ruta**: `/categories/{id}`
- **Descripción**: Elimina una categoría específica.
- **Parámetros de ruta**:
  - `id`: ID de la categoría.
- **Respuesta**:
  - Estado `204`: Categoría eliminada.
  - Estado `404`: Categoría no encontrada.

### Películas

#### Listar películas

- **Método**: `GET`
- **Ruta**: `/movies`
- **Descripción**: Recupera todas las películas.
- **Respuesta**:
  - Estado `200`: Devuelve un array de películas.
    ```json
    [
      {
        "id": 1,
        "titulo": "Inception",
        "fecha_lanzamiento": "2010-07-16"
      }
    ]
    ```

#### Crear película

- **Método**: `POST`
- **Ruta**: `/movies`
- **Descripción**: Crea una nueva película.
- **Cuerpo de la solicitud**:
  ```json
  {
    "titulo": "Interstellar",
    "fecha_lanzamiento": "2014-11-07",
    "category_ids": [1, 2]
  }
  ```
- **Respuesta**:
  - Estado `201`: Devuelve la película creada.
    ```json
    {
      "id": 2,
      "titulo": "Interstellar",
      "fecha_lanzamiento": "2014-11-07"
    }
    ```
  - Estado `422`: Solicitud inválida.

#### Mostrar película

- **Método**: `GET`
- **Ruta**: `/movies/{id}`
- **Descripción**: Recupera los detalles de una película específica.
- **Parámetros de ruta**:
  - `id`: ID de la película.
- **Respuesta**:
  - Estado `200`: Devuelve los detalles de la película.
    ```json
    {
      "id": 1,
      "titulo": "Inception",
      "fecha_lanzamiento": "2010-07-16"
    }
    ```
  - Estado `404`: Película no encontrada.

#### Recuperar películas por categoría

- **Método**: `GET`
- **Ruta**: `/movies_by_category`
- **Descripción**: Recupera películas por nombre de categoría.
- **Parámetros de consulta**:
  - `category_name`: Nombre de la categoría.
- **Respuesta**:
  - Estado `200`: Devuelve las películas encontradas.
  - Estado `404`: Categoría no encontrada.

#### Recuperar categorías y resumen para una película

- **Método**: `GET`
- **Ruta**: `/movies_with_categories`
- **Descripción**: Recupera las categorías y el resumen de una película.
- **Parámetros de consulta**:
  - `movie_name`: Nombre de la película.
- **Respuesta**:
  - Estado `200`: Devuelve la película, categorías y resumen.
  - Estado `404`: Película no encontrada.

### Resúmenes

#### Listar resúmenes

- **Método**: `GET`
- **Ruta**: `/sumaries`
- **Descripción**: Recupera todos los resúmenes.
- **Respuesta**:
  - Estado `200`: Devuelve un array de resúmenes.
    ```json
    [
      {
        "sinopsis": "Una historia épica de amor y sacrificio.",
        "critica": "Un giro impresionante.",
        "movie_id": 1
      }
    ]
    ```

#### Crear resumen

- **Método**: `POST`
- **Ruta**: `/sumaries`
- **Descripción**: Crea un nuevo resumen.
- **Cuerpo de la solicitud**:
  ```json
  {
    "sinopsis": "Viaje a través del tiempo y el espacio.",
    "critica": "Visualmente impresionante.",
    "movie_id": 1
  }
  ```
- **Respuesta**:
  - Estado `201`: Devuelve el resumen creado.
    ```json
    {
      "sinopsis": "Viaje a través del tiempo y el espacio.",
      "critica": "Visualmente impresionante.",
      "movie_id": 1
    }
    ```
  - Estado `422`: Solicitud inválida.

#### Mostrar resumen

- **Método**: `GET`
- **Ruta**: `/sumaries/{id}`
- **Descripción**: Recupera los detalles de un resumen específico.
- **Parámetros de ruta**:
  - `id`: ID del resumen.
- **Respuesta**:
  - Estado `200`: Devuelve los detalles del resumen.
  - Estado `404`: Resumen no encontrado.

#### Actualizar resumen

- **Método**: `PATCH`
- **Ruta**: `/sumaries/{id}`
- **Descripción**: Actualiza los detalles de un resumen específico.
- **Parámetros de ruta**:
  - `id`: ID del resumen.
- **Cuerpo de la solicitud**:
  ```json
  {
    "sinopsis": "Una nueva sinopsis.",
    "critica": "Una crítica actualizada."
  }
  ```
- **Respuesta**:
  - Estado `200`: Resumen actualizado.
  - Estado `404`: Resumen no encontrado.
  - Estado `422`: Solicitud inválida.

#### Eliminar resumen

- **Método**: `DELETE`
- **Ruta**: `/sumaries/{id}`
- **Descripción**: Elimina un resumen específico.
- **Parámetros de ruta**:
  - `id`: ID del resumen.
- **Respuesta**:
  - Estado `204`: Resumen eliminado.
  - Estado `404`: Resumen no encontrado.
