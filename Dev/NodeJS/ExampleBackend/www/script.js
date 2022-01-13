async function fetchAllTodos () {
    const result = await fetch('http://localhost:3000/api/todos', {
        // method: "GET",
        mode: 'cors',
        headers: {
            'Content-Type': 'application/json'
        }
    });
    const todos = await result.json();
    // console.log(todos);
    if (todos.success) {
        const ul = document.createElement("ul");
        ul.setAttribute('id', 'todo-ul');
        
        document.querySelector("#todos-container").appendChild(ul);
        
        todos.success.forEach(todo => {
            console.log(todo);
            const li = document.createElement("li");
            li.innerHTML = todo.texte;
            ul.appendChild(li)
        });
    }
}

async function addTodo (event) {
    event.preventDefault(); // prevent refresh page
    const data = { texte: event.target[0].value }
    const result = await fetch('http://localhost:3000/api/todos', {
        method: "POST",
        mode: 'cors',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    });

    const json = await result.json();
    if (json.error) {
        alert(json.error);
    }
}

function test (e) {
    console.log(e.target.value);
}
