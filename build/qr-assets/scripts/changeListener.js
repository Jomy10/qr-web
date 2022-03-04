/**
 * Called whenever a QR coe is generated
 * @callback addChangeListenerCallback
 * @param {string} text The text representation of the QR code
 */

/**
 * 
 * @param {HTMLElement} element The element where the QR code text is stored
 * @param {addChangeListenerCallback} callback Called wenever a QR code is generated
 */
export function addChangeListener(element, callback) {
    const _callback = (mutationsList) => {
        for (let mutation of mutationsList) {
            console.log('mutation:', mutation)
            if (mutation.type === "characterData") {
                let text = mutation.target.data;
                callback(text);
            }
        }
    };

    var observer = new MutationObserver(_callback);

    observer.observe(element, { characterData: true, attributes: true, childList: true, subtree: true });
}

/**
 * Callback for `observeInsert`
 * @callback observeInsertCallback
 * @param {Node} node
 * @param {callback} callback
 */

/**
 * Adds an event listener to the dom that listens for insertion of elements
 * @param {observeInsertCallback} callback executed when an element 
 * is inserted into the DOM 
 * @callback Executes the callback with the newly created node and 
 * a callback to stop observing as parameters
 */
export function observeInsert(callback) {
    let observer = new MutationObserver((mutations) => {
        mutations.forEach((mutation) => {
            if (!mutation.addedNodes) return

            for (let i = 0; i < mutation.addedNodes.length; i++) {
                // newly added node
                let node = mutation.addedNodes[i];
                const stopObserver = () => {
                    observer.disconnect();
                    console.log("Insertion observer disconnected");
                };
                callback(node, stopObserver);
            }
        })
    });

    observer.observe(document.body, {
        childList: true,
        subtre: true,
        attributes: true,
        characterData: true
    });
}