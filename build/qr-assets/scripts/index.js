import { addChangeListener, observeInsert } from '/qr-assets/scripts/changeListener.js';
import { drawQR } from '/qr-assets/scripts/qr.js';
import { addToDOM } from '/qr-assets/scripts/dom.js';

// TODO: show loading icon when button clicked!

// Wait for DOM to load
observeInsert((node, endCallback) => {
    // Add to dom what ruby can't do
    addToDOM();
    // Add event listener to the qr-code text
    if (node.className === "app") {
        // Stop observing of element insertion
        endCallback();
        // Listen for cange on #qr-code node and draw when changed
        addChangeListener(document.getElementById('qr-code'), (text) => {
            drawQR('qr-code-canvas', text);
            document.getElementById('download').style.opacity = 100;
        });
    }

    document.getElementById('download').addEventListener('click', () => {
        download('qr-code-canvas');
    })
});

const download = (canvasId) => {
    let canvas = document.getElementById(canvasId);
    console.log(canvas);
    let img = canvas.toDataURL('image/png');
    console.log(img);

    var anchor = document.createElement('a');
    anchor.href = img;
    anchor.download = 'img.png';
    anchor.click();
}