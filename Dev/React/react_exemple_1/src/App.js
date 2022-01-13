import './App.css';
import { BrowserRouter as Router } from 'react-router-dom';

// Components
import TodoRoutes from './components/TodoRoutes/TodoRoutes';
import Navbar from './components/Navbar/Navbar';

// toute valeur passée à <App valeur=x /> est récupérable (et découpable) via props.valeur
function App(props) {

  return (
    <div className="App">
      <Router>
        <Navbar />
        <TodoRoutes />
      </Router>

    </div>
  );
}

export default App;
