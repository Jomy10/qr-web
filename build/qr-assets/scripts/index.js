import { addChangeListener, observeInsert } from '/qr-assets/scripts/changeListener.js';
import { drawQR, convertRem } from '/qr-assets/scripts/qr.js';
import { addToDOM } from '/qr-assets/scripts/dom.js';
import { stopAnimation } from '/qr-assets/scripts/loading.js';

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
            stopAnimation();
            let canvas = document.getElementById('qr-code-canvas');
            drawQR(canvas, text);
            setImage(canvas);
            let downloadBtn = document.getElementById('download');
            let controls = document.getElementsByClassName('dl-control');
            [downloadBtn, ...controls].forEach((element) => {
                element.style.opacity = 100;
                element.disabled = false;
            });
        });
    }

    document.getElementById('download').addEventListener('click', () => {
        let canvas = document.getElementById('qr-code-canvas');

        let bezel = convertRem(0.5);
        let padding = 2 * (4.0 * bezel);
        let canvas_width = document.getElementById('main-content').clientWidth - padding;
        if (document.getElementById('dimension-field').value != canvas_width) {
            drawQR(canvas, document.getElementById('qr-code').innerText, document.getElementById('dimension-field').value);
            download(canvas)
        } else {
            download(document.getElementById('qr-code-canvas'));
        }
    });
});

const download = (canvas) => {
    let img = canvas.toDataURL('image/png');

    var anchor = document.createElement('a');
    anchor.href = img;
    anchor.download = 'qr.png';
    anchor.click();
}

const setImage = (canvas) => {
    let img = canvas.toDataURL();
    document.getElementById('qr-code-img').src = img;
}
