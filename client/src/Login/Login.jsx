import Axios from 'axios';
import React, {useEffect, useState, useContext} from 'react';
import { Link } from 'react-router-dom';
import {Context} from "../Context/Context";
import './Login.css';
import {useNavigate} from "react-router-dom";

function Login(){

    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const { id, setId, role, setRole } = useContext(Context);
    const navigate = useNavigate();
    const [loginState, setLoginState] = useState('');

    Axios.defaults.withCredentials = true;

    const sendData = () => {
        Axios.post("http://localhost:3001/login", {
            username: username,
            password: password
        }).then((response) =>{
            console.log(response.data);
            if(response.data.length > 0){
                setId(response.data[0].id_user);
                setRole(response.data[0].role);
                console.log({
                    session: true,
                    code: id,
                    username: response.data[0].username,
                    role: role
                });
                if(role === 1){
                    console.log('Student');
                    navigate("/menu-student");
                }
                if(role === 2){
                    console.log('Teacher');
                    navigate("/menu-teacher");
                }
            }

            if(!response.data.length > 0){
                setLoginState(response.data.message);
            }
        });
    }
    const login = (e) => {
        e.preventDefault();
        sendData();
    }

    return (
        <div className="login-form">
            <form>
                <h3>Login here</h3>

                <label htmlFor="username">Username</label>
                <input type="text" name="username" id="username" value={username}
                       onChange={e => setUsername(e.target.value)}/>

                <label htmlFor="password">Password</label>
                <input type="password" name="password" id="password" value={password}
                       onChange={e => setPassword(e.target.value)}/>

                <label htmlFor="wrong" style={{ color: "red" }}>{loginState}</label>


                <button type="submit" className="btn" onClick={login}>Log In</button>
                <div className='social'>
                    <div className='btn-div-login'><Link className='btn-home' to="/home">Home</Link></div>
                </div>
            </form>

        </div>
    );
}

export default Login;