import { Routes, Route } from "react-router-dom";

import About from '../../pages/About/About'
import Todo from '../../pages/Todo/Todo';
import NotFound from '../../pages/NotFound/NotFound';

const TodoRoutes = () => {
    return ( 
        <Routes>
          <Route path="/" element={<Todo />} />
          <Route path="/about" element={<About />} />
          <Route path="*" element={<NotFound />} />
        </Routes>
     );
}
 
export default TodoRoutes;