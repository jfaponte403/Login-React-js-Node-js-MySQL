import Axios from "axios";
import './Menu.css';
import React, {useEffect, useContext, useState} from "react";
import { Context } from "../Context/Context";
import user from '../Images/user.png'

function MenuStudent() {
    const { id } = useContext(Context);
    const [data, setData] = useState([]);

    const goOut = () => {
      window.location = '/';
    }

    useEffect(() => {
        Axios.get(`http://localhost:3001/student-data/${id}`)
            .then((response) => {
                setData(response.data.result);
            });
    }, []);

    console.log(data);

    if(data !== null){
        return (
            <div className='menu'>
                <aside>
                    <img src={user} alt='img'/>
                    {
                        data.slice(0, 1).map(item => {
                            return (
                                <div className='data' key={item.code}>
                                    <span><b>Name: </b>{item.name}</span>
                                    <span><b>Code: </b>{item.code}</span>
                                    <span><b>Major: </b>{item.major}</span>
                                </div>
                            );
                        })
                    }
                    <button className='btn-log-out' onClick={goOut}>Log out</button>
                </aside>
            <div className='table'>
                <table>
                    <thead>
                    <tr>
                        <th>Subject</th>
                        <th>Grade</th>
                    </tr>
                    </thead>
                    <tbody>
                    {
                        data.map(item => {
                            return (
                                <tr key={item.subject}>
                                    <td>{item.subject}</td>
                                    <td>{item.grade}</td>
                                </tr>
                            );
                        })
                    }
                    </tbody>
                </table>
            </div>
        </div>
        );
    }
}

export default MenuStudent;
