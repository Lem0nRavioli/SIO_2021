import Button from "../Button";
import { useState } from 'react';
import './Counter.css';
import useAlert from "../../utils/useAlert";

const Counter = ( { initialCount } ) => {
    const [count, setCount] = useState(initialCount)
    
    
    // useEffect(() =>{
    //     // infinite load
    //     // setCount(prevState => prevState + 1);
    //     return () => alert('Mon composant est détruit');
    // })
    // useAlert("Mon composant est détruit");

    return (
        <div className="counter">
            <h2>SUPER COUNTER</h2>
            <h2 id="current-count">{count}</h2>
            <Button text="Reset" onClick={() => setCount(initialCount)}/>
            <Button text="-1" onClick={() => setCount(prevState => prevState - 1)}/>
            <Button text="+1" onClick={() => setCount(prevState => prevState + 1)}/>
        </div> 
     );
}
 
export default Counter;