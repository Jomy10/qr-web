/**
 * Add to DOM what ruby can't do
 */
export const addToDOM = () => {
    console.log("Adding placeholder to input fieled")
    Array.from(document.getElementsByClassName("input_field")).forEach(element => {
        console.log(element);
        element.setAttribute('placeholder', " ");
    });
}