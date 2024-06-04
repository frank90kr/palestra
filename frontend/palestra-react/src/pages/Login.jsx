import React, { useState } from "react";
import { Form, Button, Container, Row, Col, Alert } from "react-bootstrap";
import { useDispatch } from "react-redux";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import { LOGIN } from "../redux/actions";

const Login = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    email: "",
    password: "",
  });
  const [error, setError] = useState("");

  const updateInputValue = (ev) => {
    setFormData((oldFormData) => ({
      ...oldFormData,
      [ev.target.name]: ev.target.value,
    }));
  };

  const submitLogin = (ev) => {
    ev.preventDefault();

    axios
      .get("/sanctum/csrf-cookie")
      .then(() => axios.post("/login", formData))
      .then(() => axios.get("/api/user"))
      .then((res) => {
        // salvare i dati dello user nel Redux state
        dispatch({ type: LOGIN, payload: res.data });
        // reindirizzare alla pagina home
        navigate("/");
      })
      .catch((error) => {
        console.error("Login failed:", error);
        setError("Le tue credenziali sono errate");
      });
  };

  return (
    <Container className="d-flex justify-content-center align-items-center min-vh-100">
      <Row className="w-100">
        <Col md={4} className="mx-auto">
          <Form onSubmit={(ev) => submitLogin(ev)} noValidate>
            <Form.Group className="mb-4" controlId="formBasicEmail">
              <Form.Label>Email address</Form.Label>
              <Form.Control
                type="email"
                name="email"
                id="email"
                onChange={(ev) => updateInputValue(ev)}
                value={formData.email}
                placeholder="Enter email"
              />
              <Form.Text className="text-muted"></Form.Text>
            </Form.Group>

            <Form.Group className="mb-4" controlId="formBasicPassword">
              <Form.Label>Password</Form.Label>
              <Form.Control
                type="password"
                name="password"
                id="password"
                onChange={(ev) => updateInputValue(ev)}
                value={formData.password}
                placeholder="Password"
              />
            </Form.Group>
            <Button variant="dark w-100 mt-2" type="submit">
              Login
            </Button>
            {error && (
              <Alert className="mt-3" variant="danger">
                {error}
              </Alert>
            )}
          </Form>
        </Col>
      </Row>
    </Container>
  );
};

export default Login;
