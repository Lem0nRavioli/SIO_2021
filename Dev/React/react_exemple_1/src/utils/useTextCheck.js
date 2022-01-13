import { useEffect, useState } from "react";

const useTextCheck = (textInput) => {
    // console.log(textInput);
    const [isValid, setIsValid] = useState(false);

    const checkFormat = (str) => {
        var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;

        if (format.test(str)) {
            return true;
        } else {
            return false;
        }
    }

    // console.log(isValid);
    useEffect(() => {
        if (textInput.length > 10 && !checkFormat(textInput)) {
            setIsValid(true)
        } else {
            setIsValid(false);
        }
        }, [textInput]);
    
    
    return isValid;

}

export default useTextCheck;