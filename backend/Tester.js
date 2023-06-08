const axios = require('axios');

async function testCRUDOperations() {
  try {
    // Obtener todos los usuarios
    const getUsersResponse = await axios.get('http://db/users');
    console.log('Usuarios obtenidos:', getUsersResponse.data);

    // Crear un nuevo usuario
    const createUserResponse = await axios.post('http://db/users', {
      nickname: 'Santiago',
      email: 'santiagovidarte@gmail.com',
      contact: '095209728'
    });
    const newUser = createUserResponse.data;
    console.log('Nuevo usuario creado:', newUser);

    // Obtener un usuario por su ID
    const userId = newUser.id;
    const getUserResponse = await axios.get(`http://db/${userId}`);
    console.log('Usuario obtenido por ID:', getUserResponse.data);

    // Actualizar un usuario
    const updateUserResponse = await axios.put(`http://db/users/${userId}`, {
      nickname: 'YanoesSanti',
      email: 'noesantiagovidarte@gmail.com',
      contact: '095095095095'
    });
    const updatedUser = updateUserResponse.data;
    console.log('Usuario actualizado:', updatedUser); 

    // Eliminar un usuario
    const deleteUserResponse = await axios.delete(`http://db/users/${userId}`);
    console.log('Usuario eliminado:', deleteUserResponse.data);
  } catch (error) {
    console.error('Error en las operaciones CRUD:', error.response.data);
  }
}

// Ejecutar las pruebas de CRUD
testCRUDOperations();
