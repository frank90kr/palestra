import React, { useState, useEffect } from "react";
import axios from "axios";
import { Container, Table, Button } from "react-bootstrap";

const ProfileUser = () => {
  const [courses, setCourses] = useState([]);

  useEffect(() => {
    // Effettua una richiesta API per ottenere i corsi dell'utente
    axios
      .get("/api/profile")
      .then((res) => {
        setCourses(res.data);
      })
      .catch((error) => {
        console.error("Error fetching user courses:", error);
      });
  }, []);

  const handleUnsubscribe = (courseId) => {
    // Effettua una richiesta API per cancellare l'iscrizione al corso
    axios
      .delete(`/api/unsubscribe/${courseId}`)
      .then((res) => {
        // Rimuovi il corso dalla lista
        setCourses(courses.filter((course) => course.id !== courseId));
      })
      .catch((error) => {
        console.error("Error unsubscribing from course:", error);
      });
  };

  return (
    <Container>
      <h1>Il mio profilo</h1>
      <Table striped bordered hover>
        <thead>
          <tr>
            <th>Titolo del corso</th>
            <th>Luogo</th>
            <th>Stato</th>
            <th>Azioni</th>
          </tr>
        </thead>
        <tbody>
          {courses.map((course) => (
            <tr key={course.id}>
              <td className="fs-5 fw-semibold">{course.title}</td>
              <td>{course.location}</td>
              <td>{course.pivot.status}</td>
              <td>
                {/* Pulsante per annullare l'iscrizione al corso */}
                <Button variant="danger" size="sm" onClick={() => handleUnsubscribe(course.id)}>
                  Annulla
                </Button>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
    </Container>
  );
};

export default ProfileUser;
