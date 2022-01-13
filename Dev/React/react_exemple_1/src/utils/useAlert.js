import { useEffect } from "react"

const useAlert = (message) => {

    useEffect(() => {

        return () => alert(message);
    })
}

export default useAlert