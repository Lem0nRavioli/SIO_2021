import './App.css';
import { 
  BrowserRouter as Router,
  Routes,
  Route,
  Link
 } from 'react-router-dom';

 // Components
import About from './pages/About/About'
import Todo from './pages/Todo/Todo';
import NotFound from './pages/NotFound/NotFound';

// toute valeur passée à <App valeur=x /> est récupérable (et découpable) via props.valeur
function App(props) {
  return (
    <div className="App">
      <Router>
        <nav>
          <Link to="/">Home</Link>
          <br/>
          <Link to="/about">About</Link>
        </nav>
        <Routes>
        <Route path="/" element={<Todo />} />
        <Route path="/about" element={<About />} />
        <Route path= "*" element={<NotFound />} />
        </Routes>
      </Router>
      
    </div>
  );
}

export default App;
