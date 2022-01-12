import { useRef, useState } from 'react';
import './Todo.css'
import Button from '../../components/Button'

// const { call } = require('../../utils/fetch');

const mariadb = require('mariadb');
const pool = mariadb.createPool({
    host: 'localhost:3000',
    user: 'root',
    password: 'root',
    connectionLimit: 10,
    database: 'todo_dev2'
})

// async function asyncFunction() {
//     let conn;
//     try {
//       conn = await pool.getConnection();
//       const result = await conn.query("SELECT * FROM todo;");
//       console.log(result);
  
//     } catch (err) {
//       throw err;
//     } finally {
//       if (conn) return conn.end();
//     }
//   }

const Todo = () => {
    const [todos, setTodos] = useState([
        { id: 1, text: "Todo 1"},
        { id: 2, text: "Todo 2"},
        { id: 3, text: "Todo 3"},
        { id: 4, text: "Todo 4"},
        { id: 5, text: "Todo 5"}
    ]);
    
    // const [newTodoText, setNewTodoText] = useState();
    const textRef = useRef();

    const supprimer = (id) => {
        // const newTodos = [...todos]; // make a copy of a list
        // const index = newTodos.findIndex((todo) => todo.id === id);
        // vérifie que findIndex a trouvé une valeur correspondante (-1 si absent de la liste)
        // if (index !== -1) {
        //     newTodos.splice(index, 1);
        // }
        // setTodos(newTodos);

        setTodos((prevState) => prevState.filter((todo) => todo.id !== id))
    }

    const addTodo = () => {
        const newEntry = { id: todos.length + 1, text: textRef.current.value };
        setTodos([...todos, newEntry]);
    }

    return (
        <div className="todo">
            {/* <input type="text" onChange={(e) => setNewTodoText(e.target.value)}/> */}
            <input type="text" ref={textRef} />
            <Button text="Ajouter" onClick={addTodo}></Button>
            <ul>
                {
                    todos.map((todo) => (
                        // unique key tag necessary for react for every loop-generated content
                        <li key={todo.id} id={`todo-${todo.id}`}>
                            {todo.text} 
                            <Button text="Supprimer" onClick={() => supprimer(todo.id)}>Supprimer</Button>
                        </li>
                        )
                    )}
            </ul>
        </div>
      );
}
 
export default Todo;