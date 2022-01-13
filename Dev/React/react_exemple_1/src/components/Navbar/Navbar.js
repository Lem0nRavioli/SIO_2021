import { NavLink } from 'react-router-dom';
import './Navbar.css';

const Navbar = () => {
    return ( 
        <nav className="navbar">
          <NavLink activeClassName="navbar__link--active" className="nav-element" to="/">Home</NavLink>
          <NavLink activeClassName="navbar__link--active" className="nav-element" to="/about">About</NavLink>
        </nav>
     );
}
 
export default Navbar;