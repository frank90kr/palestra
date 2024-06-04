// Home.js
import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom"; // Importa Link per creare il link alla pagina del corso
import "bootstrap/dist/css/bootstrap.min.css";
import { ListGroup, Button } from "react-bootstrap";

const Home = () => {
  const [activities, setActivities] = useState([]);

  useEffect(() => {
    fetch("/api/activities")
      .then((res) => res.json())
      .then((data) => setActivities(data));
  }, []);

  return (
    <div className="container">
      <div className="text-secondary py-0">
        <div className="">
          <div style={{ width: "1300px", height: "420px", overflow: "hidden", margin: "0 auto" }}>
            <img
              src="https://images.unsplash.com/photo-1558611848-73f7eb4001a1?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
              alt=""
              style={{ width: "100%", height: "100%", objectFit: "cover" }}
            />
          </div>
        </div>
      </div>

      <h1 className="mt-2 text-center">Corsi disponibili</h1>

      <div className="row mt-3 justify-content-center">
        <div className="col-md-10">
          <ListGroup className="" variant="dark">
            {activities.map((activity) => (
              <ListGroup.Item key={activity.id}>
                <div className="d-flex justify-content-between align-items-center">
                  <div>
                    <h5 className="mb-0">{activity.name}</h5>
                    <p className="mb-0 ms-4 mt-2">{activity.description}</p>
                  </div>
                  <Link to={`/courses/${activity.id}`}>
                    <Button className="px-4" variant="info">
                      Info
                    </Button>
                  </Link>
                </div>
              </ListGroup.Item>
            ))}
          </ListGroup>
        </div>
      </div>
    </div>
  );
};

export default Home;
