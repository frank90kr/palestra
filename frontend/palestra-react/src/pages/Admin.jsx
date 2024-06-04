import React, { useState, useEffect } from "react";
import axios from "axios";
import { Container, Table, Button, Collapse } from "react-bootstrap";

const Admin = () => {
  const [pendingSubscriptions, setPendingSubscriptions] = useState([]);
  const [acceptedUsers, setAcceptedUsers] = useState([]);
  const [openCollapse, setOpenCollapse] = useState(false);

  useEffect(() => {
    fetchSubscriptions();
  }, []);

  const fetchSubscriptions = () => {
    axios
      .get("/api/admin/courses")
      .then((response) => {
        // Filtra e setta le iscrizioni pendenti
        const pendingSubs = response.data.subscriptions.map((course) => ({
          ...course,
          users: course.users.filter((user) => user.pivot.status === "pending"),
          day: course.slot.day, // giorno
          startTime: course.slot.start_time, // ora di inizio
          endTime: course.slot.end_time, // ora di fine
        }));
        setPendingSubscriptions(pendingSubs);

        // Filtra e setta gli utenti accettati
        const accepted = response.data.subscriptions.flatMap((course) =>
          course.users.filter((user) => user.pivot.status === "accepted")
        );
        setAcceptedUsers(accepted);
      })
      .catch((error) => {
        console.error("Error fetching subscriptions:", error);
      });
  };

  const acceptSubscription = (userId, courseId) => {
    axios
      .post(`/api/admin/users/${userId}/courses/${courseId}/accept`)
      .then((response) => {
        // Aggiorna le iscrizioni dopo l'accettazione
        fetchSubscriptions();
      })
      .catch((error) => {
        console.error("Error accepting subscription:", error);
      });
  };

  const cancelSubscription = (userId, courseId) => {
    axios
      .post(`/api/admin/users/${userId}/courses/${courseId}/cancel`)
      .then((response) => {
        // Aggiorna le iscrizioni dopo la cancellazione
        fetchSubscriptions();
      })
      .catch((error) => {
        console.error("Error canceling subscription:", error);
      });
  };

  return (
    <Container>
      <h2 className="text-center">Pannello di Amministrazione</h2>
      <h3 className="mt-2">Iscrizioni</h3>
      <Table striped bordered hover>
        <thead>
          <tr>
            <th>Corso</th>
            <th>Giorno</th>
            <th>Ora Inizio</th>
            <th>Ora Fine</th>
            <th>UserName</th>
            <th>Email</th>
            <th>Status</th>
            <th>Action</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {pendingSubscriptions.map((course) =>
            course.users.map((user) => (
              <tr key={`${course.id}-${user.id}`}>
                <td>{course.title}</td>
                <td>{course.day}</td>
                <td>{course.startTime}</td>
                <td>{course.endTime}</td>
                <td>{user.name}</td>
                <td>{user.email}</td>
                <td>{user.pivot.status}</td>
                <td>
                  {user.pivot.status === "pending" && (
                    <Button size="sm" className="bg-success" onClick={() => acceptSubscription(user.id, course.id)}>
                      Accetta Iscrizione
                    </Button>
                  )}
                </td>
                <td>
                  <Button
                    size="sm"
                    className="bg-danger"
                    onClick={() => cancelSubscription(user.id, course.id)}
                    disabled={user.pivot.status !== "pending"}
                  >
                    Cancella Iscrizione
                  </Button>
                </td>
              </tr>
            ))
          )}
        </tbody>
      </Table>

      <h3 className="mt-2">
        Uteni accettati ai corsi{" "}
        <Button
          onClick={() => setOpenCollapse(!openCollapse)}
          aria-controls="accepted-users-collapse"
          aria-expanded={openCollapse}
          variant="outline-primary"
          size="sm"
        >
          {openCollapse ? "Nascondi" : "Mostra"}
        </Button>
      </h3>
      <Collapse in={openCollapse}>
        <div id="accepted-users-collapse">
          <Table striped bordered hover variant="success">
            <thead>
              <tr>
                <th>UserName</th>
                <th>Email</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              {acceptedUsers.map((user) => (
                <tr key={user.id}>
                  <td>{user.name}</td>
                  <td>{user.email}</td>
                  <td>{user.pivot.status}</td>
                </tr>
              ))}
            </tbody>
          </Table>
        </div>
      </Collapse>
    </Container>
  );
};

export default Admin;
