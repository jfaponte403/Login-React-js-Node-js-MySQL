import {BrowserRouter, Route, Routes} from "react-router-dom";
import LoginStudent from "../Login/Login";
import MenuStudent from "../MenuStudent/MenuStudent";
import MenuTeacher from "../MenuTeacher/MenuTeacher";
import Home from "../Home/Home";
function CondorApp(){
    return (
        <div>
            <BrowserRouter>
                <Routes>
                    <Route path='/' element={<Home />} />
                    <Route path='/home' element={<Home />} />
                    <Route path='/login' element={<LoginStudent />} />
                    <Route path='/menu-student' element={<MenuStudent />} />
                    <Route path='/menu-teacher' element={<MenuTeacher />} />
                </Routes>
            </BrowserRouter>
        </div>
    );
}

export default CondorApp;