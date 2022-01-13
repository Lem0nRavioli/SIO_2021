import { useRef, useState } from 'react';
import './Todo.css'
import Button from '../../components/Button'
import Counter from '../../components/Counter/Counter';
import useTextCheck from '../../utils/useTextCheck';
import { useEffect } from 'react/cjs/react.development';


const Todo = () => {
    const [todos, setTodos] = useState([
        { id: 1, texte: "Todo 1" },
        { id: 2, texte: "Todo 2" },
        { id: 3, texte: "Todo 3" },
        { id: 4, texte: "Todo 4" },
        { id: 5, texte: "Todo 5" }
    ]);
    const [textInput, setTextInput] = useState('');

    // const [newTodoText, setNewTodoText] = useState();
    const textRef = useRef();
    const buttonRef = useRef();

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
        // const newEntry = { id: todos[todos.length - 1].id + 1, texte: textRef.current.value };
        // setTodos([...todos, newEntry]);
        fetch('http://localhost:3001/api/todos', {
            method: 'POST',
            body: {texte: textRef.current.value},
            mode: 'cors',
            headers: {
                'Content-Type': 'application/json'
            }})
            .then(data => data.json())
            .then(json => {
                if (json.success){
                    setTodos(prevState => prevState)
                }
            })
        }

    // avant extraction
    // useEffect(() => {
    //     if (textInput.length < 10 || checkFormat(textInput) ) {
    //         console.log(buttonRef.current);
            
    //         buttonRef.current.style.display = 'none';
    //     } else { buttonRef.current.style.display = 'inline-block'; }
    // }, [textInput])

    const isValid = useTextCheck(textInput)

    useEffect(() => {
        fetch('http://localhost:3001/api/todos', {
            // method: "GET",
            // body: {},
            mode: 'cors',
            headers: {
                'Content-Type': 'application/json'
            }})
            .then(data => data.json())
            .then(json => {
                setTodos(json.success);
            })
    }, [todos]);

    return (
        <div className="todo">
            {/* <input type="text" onChange={(e) => setNewTodoText(e.target.value)}/> */}
            <input id="input-todo" type="text" ref={textRef} onChange={(e) => setTextInput(e.target.value)} />
            {/* <Button text="Ajouter" onClick={addTodo} ref={buttonRef}></Button> */}
            {isValid&&<button onClick={addTodo} ref={buttonRef}>Ajouter</button>}

            <ul>
                {
                    todos.map((todo) => (
                        // unique key tag necessary for react for every loop-generated content
                        <li key={todo.id} id={`todo-${todo.id}`}>
                            {todo.texte}
                            <Button text="Supprimer" onClick={() => supprimer(todo.id)}>Supprimer</Button>
                        </li>
                    )
                    )}
            </ul>
            <Counter initialCount={0} />
        </div>
    );
}

export default Todo;



/*
TODO : 
- 


*/