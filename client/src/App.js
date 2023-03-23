import './App.css';
import CondorApp from "./CondorApp/CondorApp";
import {ContextProvider} from './Context/Context';
function App() {
  return (
      <ContextProvider>
          <CondorApp />
      </ContextProvider>
  );
}

export default App;
