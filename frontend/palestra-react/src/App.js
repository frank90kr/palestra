import { BrowserRouter, Route, Routes, Navigate } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import TopNav from "./components/TopNav.jsx";
import Home from "./pages/Home.jsx";
import Course from "./pages/Course.jsx";
import NotFound from "./pages/NotFound.jsx";
import Login from "./pages/Login.jsx";
import Register from "./pages/Register.jsx";
import axios from "axios";
import { useEffect, useState } from "react";
import { LOGIN } from "./redux/actions/index.js";
import { useDispatch } from "react-redux";
import ProtectedRoutes from "./pages/ProtectedRoutes.jsx";
import GuestRoutes from "./pages/GuestRoutes.jsx";
import ProfileUser from "./pages/ProfileUser.jsx";
import Admin from "./pages/Admin.jsx";
import Footer from "./components/Footer.jsx";

function App() {
  axios.defaults.withCredentials = true;
  axios.defaults.withXSRFToken = true;

  const dispatch = useDispatch();
  const [loaded, setLoaded] = useState(false);

  useEffect(() => {
    axios("/api/user")
      .then((res) =>
        dispatch({
          type: LOGIN,
          payload: res.data,
        })
      )
      .catch((err) => console.log(err))
      .finally(() => setLoaded(true));
  }, [dispatch]);

  return (
    loaded && (
      <BrowserRouter>
        <TopNav />

        <Routes>
          <Route path="/" element={<Home />} />
          {/* <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} /> */}

          {/* Rotte accessibili solo se se sei loggato */}
          <Route element={<ProtectedRoutes />}>
            <Route path="/courses/:id" element={<Course />} />
            <Route path="/profile" element={<ProfileUser />} />
            <Route path="/admin" element={<Admin />} />
          </Route>

          {/* Rotte accessibili solo se non sei loggato */}
          <Route element={<GuestRoutes />}>
            <Route path="/login" element={<Login />} />
            <Route path="/register" element={<Register />} />
          </Route>

          <Route path="/404" element={<NotFound />} />
          <Route path="*" element={<Navigate to="/404" />} />
        </Routes>

        <Footer />
      </BrowserRouter>
    )
  );
}

export default App;
