import React from "react";
import { Navbar, Container, Nav, Dropdown } from "react-bootstrap";
import { useDispatch, useSelector } from "react-redux";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import { LOGOUT } from "../redux/actions";
import { FaUser } from "react-icons/fa";

const TopNav = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const user = useSelector((state) => state.user);

  const logout = () => {
    axios
      .post("/logout")
      .then(() => {
        dispatch({ type: LOGOUT });
        navigate("/login");
      })
      .catch((error) => {
        console.error("Logout failed:", error);
      });
  };

  return (
    <>
      <Navbar bg="dark" data-bs-theme="dark" className="text-white" expand="lg">
        <Container>
          <Navbar.Brand as={Link} to="/">
            THE POWER HOUSE GYM
          </Navbar.Brand>
          <Navbar.Toggle aria-controls="basic-navbar-nav" />
          <Navbar.Collapse id="basic-navbar-nav">
            <Nav className="ms-auto">
              {user ? (
                <Dropdown align="end">
                  <Dropdown.Toggle className="d-flex align-items-center" variant="dark" id="dropdown-basic">
                    <FaUser className="me-2" />
                    <span>{user.name}</span>
                    <img
                      className="me-2 ms-2"
                      src={user.profile_img ? `${user.profile_img}` : "/storage/default.jpg"}
                      alt=""
                      style={{ height: "50px", width: "50px", borderRadius: "50%" }}
                    />
                  </Dropdown.Toggle>

                  <Dropdown.Menu>
                    <Dropdown.Item as={Link} to={user.role === "admin" ? "/admin" : "/profile"}>
                      Profilo
                    </Dropdown.Item>
                    <Dropdown.Item onClick={logout}>Logout</Dropdown.Item>
                  </Dropdown.Menu>
                </Dropdown>
              ) : (
                <>
                  <Nav.Item>
                    <Nav.Link as={Link} to="/login">
                      Login
                    </Nav.Link>
                  </Nav.Item>
                  <Nav.Item>
                    <Nav.Link as={Link} to="/register">
                      Register
                    </Nav.Link>
                  </Nav.Item>
                </>
              )}
            </Nav>
          </Navbar.Collapse>
        </Container>
      </Navbar>
    </>
  );
};

export default TopNav;
