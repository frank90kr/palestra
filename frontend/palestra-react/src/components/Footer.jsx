import React from "react";
import { Link } from "react-router-dom";
import { FaFacebookF } from "react-icons/fa6";
import { FaInstagram } from "react-icons/fa6";
import { FaXTwitter } from "react-icons/fa6";

const Footer = () => {
  return (
    <footer className="bg-dark text-white py-4 mt-5">
      <div className="container">
        <div className="row">
          <div className="col-md-6">
            <h5 className="mb-4">THE POWER HOUSE GYM</h5>
            <p className="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
          </div>
          <div className="col-md-3">
            <ul className="list-unstyled">
              <li>
                <Link to="" className="text-white text-decoration-none">
                  Corsi
                </Link>
              </li>
              <li>
                <Link to="" className="text-white text-decoration-none">
                  Chi Siamo
                </Link>
              </li>
              <li>
                <Link to="" className="text-white text-decoration-none">
                  About
                </Link>
              </li>
            </ul>
          </div>
        </div>
        <FaFacebookF className="me-1" />
        <FaInstagram className="me-1" />
        <FaXTwitter />
      </div>
    </footer>
  );
};

export default Footer;
