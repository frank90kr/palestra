import axios from "axios";
import { useState } from "react";
import { useDispatch } from "react-redux";
import { LOGIN } from "../redux/actions";
import { Button, Col, Container, Form, Row } from "react-bootstrap";

const Register = () => {
  const dispatch = useDispatch();
  const [profileImage, setProfileImage] = useState(null);

  const [formData, setFormData] = useState({
    name: "",
    email: "",
    password: "",
    password_confirmation: "",
    profile_image: "",
  });

  const [errors, setErrors] = useState(null);

  const updateInputValue = (ev) => {
    setFormData((oldFormData) => ({
      ...oldFormData,
      [ev.target.name]: ev.target.value,
    }));
  };

  const updateImageField = (ev) => {
    updateInputValue(ev);
    setProfileImage(ev.target.files[0]);
  };

  const submitLogin = (ev) => {
    ev.preventDefault();
    axios
      .get("/sanctum/csrf-cookie")
      .then(() => {
        const body = new FormData();
        body.append("name", formData.name);
        body.append("email", formData.email);
        body.append("password", formData.password);
        body.append("password_confirmation", formData.password_confirmation);
        if (profileImage) {
          body.append("profile_img", profileImage); // In questo caso ci serve il contenuto
        }
        return axios.post("/register", body);
      })
      .then(() => axios.get("/api/user"))
      .then((res) => {
        // Salvare i dati dello user nel Redux state
        dispatch({
          type: LOGIN,
          payload: res.data,
        });
      })
      .catch((err) => {
        console.log(err.response.data.errors);
        setErrors(err.response.data.errors);
      });
  };

  return (
    <Container className="d-flex justify-content-center align-items-center min-vh-100">
      <Row className="w-100">
        <Col md={4} className="mx-auto">
          <Form onSubmit={(ev) => submitLogin(ev)} noValidate>
            <Form.Group className="mb-3" controlId="formBasicUsername">
              <Form.Label>Username</Form.Label>
              <Form.Control
                type="text"
                name="name"
                id="name"
                onChange={(ev) => updateInputValue(ev)}
                value={formData.name}
                placeholder="Enter username"
              />
            </Form.Group>

            <Form.Group className="mb-3" controlId="formBasicEmail">
              <Form.Label>Email address</Form.Label>
              <Form.Control
                type="email"
                name="email"
                id="email"
                onChange={(ev) => updateInputValue(ev)}
                value={formData.email}
                placeholder="Enter email"
              />
            </Form.Group>

            <Form.Group className="mb-3" controlId="formBasicPassword">
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

            <Form.Group className="mb-3" controlId="formBasicPasswordConfirm">
              <Form.Label>Confirm Password</Form.Label>
              <Form.Control
                type="password"
                name="password_confirmation"
                id="password_confirmation"
                onChange={(ev) => updateInputValue(ev)}
                value={formData.password_confirmation}
                placeholder="Confirm Password"
              />
            </Form.Group>

            <Form.Group className="mb-3" controlId="formProfileImage">
              <Form.Label>Profile image</Form.Label>
              <Form.Control type="file" name="profile_img" id="profile_img" onChange={(ev) => updateImageField(ev)} />
            </Form.Group>

            <Button variant="dark w-100 mt-2" type="submit">
              Register
            </Button>
          </Form>
        </Col>
      </Row>
    </Container>
  );
};

export default Register;
