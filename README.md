# Dragon Age Origins Companion API - DOCUMENTACIÓN

## Esta api permite **pedir, crear, actualizar y borrar** personajes usando peticiones estándar HTTP, siguiendo una arquitectura **RESTful**

### URL base:

**http://localhost:3000**

### Prefijo de los endpoints:

**/api**

### Formato datos:

- Request body: JSON
- Response: JSON
- Headers requeridos: Content-Type: application/json

### Endpoints:

1. Obtener todos los personajes: **api/characters**

2. Crear nuevo personaje: **/api/characters**
   Request body (ejemplo):

   {
   "name": "Shale",
   "age": 1000,
   "description": "A sarcastic golem.",
   "background": "Bound soul inside a golem body.",
   "skills": "Great strength",
   "relationship": "Party member",
   "occupation_id": 4
   }

   Respuesta esperada:

   {
   "success": true,
   "id": 10
   }

3. Editar personaje: **api/characters/:id** (en :id indicar el id del personaje a editar)

   Request body (ejemplo):

   {
   "name": "Shale",
   "age": 1001,
   "description": "Sarcastic golem with a sharp wit.",
   "background": "Bound soul inside a golem body.",
   "skills": "Great strength and resilience",
   "relationship": "Party member",
   "occupation_id": 4
   }

   Respuesta esperada:

   {
   "success": true
   }

4. Borrar personaje: **api/characters/:id** (igual que para editar)
   Ejemplo usando curl (opcional, si no se usa Postman): curl -X DELETE http://localhost:3000/api/characters/:id

   Respuesta esperada:

   {
   "success": true
   }

   Respuesta si la petición falla:

   {
   "success": false,
   "message": "Character not found"
   }

### Gestión de errores:

- **404 Not Found** -> El personaje no existe
- **500 Internal Server Error** -> Error del servidor o base de datos

### Tecnologías utilizadas:

- Node.js
- Express.js
- MySQL
- mysql2
- Postman (API testing)

### Como arrancar el proyecto:

1. Instalar dependencias: **npm install**

2. Configurar variables de entorno (.env):

   MYSQL_HOST=localhost
   MYSQL_USER=root
   MYSQL_PASSWORD=your_password
   MYSQL_DATABASE=dragon_age

3. Arrancar el servidor: **npm run dev** ("dev" y "start" ya están añadidos al package.json)
