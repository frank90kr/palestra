import React, { useState, useEffect } from "react";
import { Container, Spinner, Alert } from "react-bootstrap";
import { useNavigate, useParams } from "react-router-dom";
import { Button } from "react-bootstrap";
import axios from "axios";

const Course = () => {
  const [course, setCourse] = useState(null);
  const [loading, setLoading] = useState(false);
  const [showAlert, setShowAlert] = useState(false);
  const [isAlreadySubscribed, setIsAlreadySubscribed] = useState(false);
  const { id } = useParams();
  const navigate = useNavigate();

  useEffect(() => {
    fetch(`/api/courses/${id}`)
      .then((res) => {
        if (!res.ok) navigate("/404");
        return res.json();
      })
      .then((data) => setCourse(data));
  }, [id]);

  const subscribeToCourse = () => {
    setLoading(true);
    axios
      .post("/api/subscribe", { course_id: id })
      .then((res) => {
        // Gestisci la risposta dal backend
        console.log("Subscription successful:", res.data);
        setShowAlert(true); // Mostra l'alert di successo
      })
      .catch((error) => {
        if (
          error.response &&
          error.response.status === 400 &&
          error.response.data.message === "Utente già iscritto a questo corso"
        ) {
          setIsAlreadySubscribed(true);
        } else {
          console.error("Subscription failed:", error);
        }
      })
      .finally(() => {
        setLoading(false); // Disattiva lo spinner
      });
  };

  return (
    <div>
      {course && (
        <Container>
          <div className="text-center">
            <h2>{course.title}</h2>
            {course.image && <img src={course.image} alt={course.title} />}
            <p className="mt-4">{course.description}</p>
            <h4>{course.slot.day}</h4>
            <p>
              Start {course.slot.start_time}/{course.slot.end_time}
            </p>
          </div>
          <div className="d-flex justify-content-center">
            <Button className="px-4" variant="dark" onClick={subscribeToCourse} disabled={loading}>
              {loading ? <Spinner animation="border" size="sm" /> : "Iscriviti"}
            </Button>
          </div>
          {showAlert && (
            <Alert variant="success" className="mt-3">
              Iscrizione avvenuta con successo, resta in attesa di approvazione.
            </Alert>
          )}
          {isAlreadySubscribed && (
            <Alert variant="warning" className="mt-3">
              Sei già iscritto a questo corso!
            </Alert>
          )}
        </Container>
      )}
    </div>
  );
};

export default Course;
