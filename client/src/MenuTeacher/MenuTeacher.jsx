import Axios from "axios";
import React, {useContext, useEffect, useState} from "react";
import {Context} from "../Context/Context";
import user from "../Images/user.png";
function MenuTeacher(){

    const { id } = useContext(Context);
    const [data, setData] = useState([]);

    const goOut = () => {
        window.location = '/';
    }

    useEffect(()=>{
        Axios.get(`http://localhost:3001/teacher-data/${id}`)
            .then((response) => {
                console.log(response.data.result);
                setData(response.data.result);
            });
    },[]);

    if(data !== null){
        return(
            <div className='menu'>
                <aside>
                    <img src={user} alt='img'/>
                        {
                            data.slice(0, 1).map(item => {
                                return (
                                    <div className='data' key={item.professor_code}>
                                        <span><b>Name: </b>{item.professor_name}</span>
                                        <span><b>Code: </b>{item.professor_code}</span>
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
                            <th>COURSE</th>
                            <th>SUBJECT</th>
                            <th>STUDENT</th>
                            <th>GRADE</th>
                        </tr>
                        </thead>
                        <tbody>
                        {
                            data.map(item => {
                                return (
                                    <tr key={item.course_code + item.student_name}>
                                        <td>{item.course_code}</td>
                                        <td>{item.subject_name}</td>
                                        <td>{item.student_name}</td>
                                        <td>{item.student_grade}</td>
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

export default MenuTeacher;