/**
 * Add to DOM what ruby can't do
 */
export const addToDOM = () => {
    Array.from(document.getElementsByClassName("input_field")).forEach(element => {
        element.setAttribute('placeholder', " ");
    });
}
