// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import morphdom from 'morphdom' ;
import debounce from 'lodash.debounce';

function doNotChangeInputValues(toEl, fromEl) {
    if (toEl.tagName === 'INPUT') {
        toEl.value = fromEl.value;
    }
}

document.addEventListener('turbolinks:load', function () {
    let search_text = document.getElementById('search_text');
    let fetchSearchResults = async function () {
        const response = await fetch(`http://localhost:3000/people?search_text=${search_text.value}&commit=Search`);
        let htmlText = await response.text();

        morphdom(document.documentElement, htmlText, {
            onBeforeElUpdated: function (fromEl, toEl) {
                doNotChangeInputValues(toEl, fromEl);
            },
            onNodeAdded: function (node) {
                if (node.nodeName === 'SCRIPT' && node.src) {
                    var script = document.createElement('script');
                    script.src = node.src;
                    node.replaceWith(script)
                }
            }
        });
    };

    let fetchSearchResultsDebounced = debounce(fetchSearchResults, 300);
    search_text.addEventListener('keyup', fetchSearchResultsDebounced);
});
