import {createContext, useState} from 'react';

export const Context = createContext(undefined);
export function ContextProvider ({children}){
    const [id, setId] = useState('');
    const [role, setRole] = useState(null);

    return(
        <Context.Provider value={
            {
                id,
                setId,
                role,
                setRole
            }
        }>
            {children}
        </Context.Provider>
    )
}