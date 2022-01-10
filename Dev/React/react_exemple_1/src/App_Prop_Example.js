import './App.css';
import About from './pages/About';

// toute valeur passée à <App valeur=x /> est récupérable (et découpable) via props.valeur
function App(props) {
  const test = "Hello world";
  return (
    <div className="App">
      <h1>{ test }</h1>
      <p>{props.message}</p>
      <About />
    </div>
  );
}

export default App;
