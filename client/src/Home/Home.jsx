import './Home.css';
import {Link} from "react-router-dom";
import React from "react";
function Home() {
    return(
        <div className='home'>
            <div className='home-page'>
                <h1>Welcome to condor academic management</h1>
                <p>Check your grades, subjects, courses and teachers, among other academic procedures.</p>
                <div className='btn-div'>
                    <Link className='btn-login' to="/login">Log In</Link>
                </div>
            </div>
        </div>
    );
}

export default Home;