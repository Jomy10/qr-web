import { startAnimation } from "/qr-assets/scripts/loading.js";

/**
 * Add to DOM what ruby can't do
 */
export const addToDOM = () => {
    Array.from(document.getElementsByClassName("input_field")).forEach(element => {
        element.setAttribute('placeholder', " ");
    });

    let icon = document.getElementById('loading-icon');
    icon.setAttribute('xmlns:xlink', 'http://www.w3.org/1999/xlink');
    icon.setAttribute('xml:space', 'preserve');

    document.getElementById('generate-parent').addEventListener('click', () => {
        startAnimation();
    }, true);
}
